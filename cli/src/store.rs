use std::path::{Path, PathBuf};

use anyhow::{Context, Result};
use serde::Serialize;
use serde::de::DeserializeOwned;
use tokio::sync::RwLock;

use crate::model::{
    InboxFileStatus, InboxItem, InboxStatus, Peer, PeerProtocol, TrustedPeer, unix_timestamp,
};

pub struct Store {
    trusted_path: PathBuf,
    inbox_path: PathBuf,
    trusted: RwLock<Vec<TrustedPeer>>,
    inbox: RwLock<Vec<InboxItem>>,
}

impl Store {
    pub async fn open(data_dir: &Path) -> Result<Self> {
        tokio::fs::create_dir_all(data_dir)
            .await
            .with_context(|| format!("could not create {}", data_dir.display()))?;
        protect_directory(data_dir).await?;
        let trusted_path = data_dir.join("trusted-peers.json");
        let inbox_path = data_dir.join("inbox.json");

        Ok(Self {
            trusted: RwLock::new(read_json_or_default(&trusted_path).await?),
            inbox: RwLock::new(read_json_or_default(&inbox_path).await?),
            trusted_path,
            inbox_path,
        })
    }

    pub async fn is_trusted_peer(&self, peer: &Peer) -> bool {
        let trusted = self.trusted.read().await;
        let Some(trusted) = trusted
            .iter()
            .find(|entry| entry.fingerprint.eq_ignore_ascii_case(&peer.fingerprint))
        else {
            return false;
        };
        peer.protocol == PeerProtocol::Http
            || (trusted.public_key.is_some() && trusted.public_key == peer.public_key)
    }

    pub async fn pair(&self, peer: &Peer) -> Result<TrustedPeer> {
        let mut trusted = self.trusted.write().await;
        let paired = TrustedPeer {
            fingerprint: peer.fingerprint.clone(),
            alias: peer.alias.clone(),
            public_key: peer.public_key.clone(),
            paired_at: unix_timestamp(),
        };
        match trusted
            .iter_mut()
            .find(|entry| entry.fingerprint.eq_ignore_ascii_case(&peer.fingerprint))
        {
            Some(entry) => *entry = paired.clone(),
            None => trusted.push(paired.clone()),
        }
        write_json(&self.trusted_path, &*trusted).await?;
        Ok(paired)
    }

    pub async fn unpair(&self, fingerprint: &str) -> Result<bool> {
        let mut trusted = self.trusted.write().await;
        let before = trusted.len();
        trusted.retain(|peer| !peer.fingerprint.eq_ignore_ascii_case(fingerprint));
        let changed = trusted.len() != before;
        if changed {
            write_json(&self.trusted_path, &*trusted).await?;
        }
        Ok(changed)
    }

    pub async fn trusted_peers(&self) -> Vec<TrustedPeer> {
        self.trusted.read().await.clone()
    }

    pub async fn add_inbox(&self, item: InboxItem) -> Result<()> {
        let mut inbox = self.inbox.write().await;
        inbox.push(item);
        write_json(&self.inbox_path, &*inbox).await
    }

    pub async fn list_inbox(&self, unread_only: bool, limit: usize) -> Vec<InboxItem> {
        let inbox = self.inbox.read().await;
        inbox
            .iter()
            .rev()
            .filter(|item| !unread_only || !item.read)
            .take(limit)
            .cloned()
            .collect()
    }

    pub async fn read_inbox(&self, id: &str) -> Result<Option<InboxItem>> {
        let mut inbox = self.inbox.write().await;
        let Some(item) = inbox.iter_mut().find(|item| item.id == id) else {
            return Ok(None);
        };
        item.read = true;
        let result = item.clone();
        write_json(&self.inbox_path, &*inbox).await?;
        Ok(Some(result))
    }

    pub async fn update_file(
        &self,
        inbox_id: &str,
        file_id: &str,
        result: Result<(), String>,
    ) -> Result<()> {
        let mut inbox = self.inbox.write().await;
        let Some(item) = inbox.iter_mut().find(|item| item.id == inbox_id) else {
            return Ok(());
        };
        let Some(file) = item.files.iter_mut().find(|file| file.id == file_id) else {
            return Ok(());
        };
        file.status = match result {
            Ok(()) => InboxFileStatus::Complete,
            Err(error) => {
                tracing::warn!(inbox_id, file_id, %error, "failed to save incoming file");
                InboxFileStatus::Failed
            }
        };
        item.status = if item
            .files
            .iter()
            .any(|file| file.status == InboxFileStatus::Pending)
        {
            InboxStatus::Pending
        } else if item
            .files
            .iter()
            .any(|file| file.status == InboxFileStatus::Failed)
        {
            InboxStatus::Failed
        } else {
            InboxStatus::Complete
        };
        write_json(&self.inbox_path, &*inbox).await
    }

    pub async fn mark_failed(&self, inbox_id: &str) -> Result<()> {
        let mut inbox = self.inbox.write().await;
        let Some(item) = inbox.iter_mut().find(|item| item.id == inbox_id) else {
            return Ok(());
        };
        item.status = InboxStatus::Failed;
        for file in &mut item.files {
            if file.status == InboxFileStatus::Pending {
                file.status = InboxFileStatus::Failed;
            }
        }
        write_json(&self.inbox_path, &*inbox).await
    }
}

async fn read_json_or_default<T>(path: &Path) -> Result<T>
where
    T: DeserializeOwned + Default,
{
    match tokio::fs::read(path).await {
        Ok(bytes) => serde_json::from_slice(&bytes)
            .with_context(|| format!("could not parse {}", path.display())),
        Err(error) if error.kind() == std::io::ErrorKind::NotFound => Ok(T::default()),
        Err(error) => Err(error).with_context(|| format!("could not read {}", path.display())),
    }
}

async fn write_json<T>(path: &Path, value: &T) -> Result<()>
where
    T: Serialize + ?Sized,
{
    let bytes = serde_json::to_vec_pretty(value)?;
    tokio::fs::write(path, bytes)
        .await
        .with_context(|| format!("could not write {}", path.display()))?;
    protect_file(path).await
}

async fn protect_directory(path: &Path) -> Result<()> {
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        tokio::fs::set_permissions(path, std::fs::Permissions::from_mode(0o700))
            .await
            .with_context(|| format!("could not protect {}", path.display()))?;
    }
    Ok(())
}

async fn protect_file(path: &Path) -> Result<()> {
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        tokio::fs::set_permissions(path, std::fs::Permissions::from_mode(0o600))
            .await
            .with_context(|| format!("could not protect {}", path.display()))?;
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use std::net::{IpAddr, Ipv4Addr};

    use super::*;
    use crate::model::PeerProtocol;

    fn peer() -> Peer {
        Peer {
            fingerprint: "ABC".to_string(),
            alias: "Peer".to_string(),
            ip: IpAddr::V4(Ipv4Addr::LOCALHOST),
            port: 53_317,
            protocol: PeerProtocol::Https,
            device_model: None,
            device_type: None,
            public_key: Some("key".to_string()),
            last_seen_at: 1,
        }
    }

    #[tokio::test]
    async fn trust_is_persisted() {
        let dir = tempfile::tempdir().unwrap();
        let store = Store::open(dir.path()).await.unwrap();
        store.pair(&peer()).await.unwrap();
        drop(store);

        let reopened = Store::open(dir.path()).await.unwrap();
        assert!(reopened.is_trusted_peer(&peer()).await);

        let mut changed_certificate = peer();
        changed_certificate.public_key = Some("changed-key".to_string());
        assert!(!reopened.is_trusted_peer(&changed_certificate).await);
    }
}
