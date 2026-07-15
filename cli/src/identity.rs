use std::path::Path;

use anyhow::{Context, Result};
use rcgen::{CertifiedKey, generate_simple_self_signed};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

#[derive(Clone, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct Identity {
    pub private_key: String,
    pub certificate: String,
    pub fingerprint: String,
}

impl Identity {
    pub async fn load_or_create(data_dir: &Path) -> Result<Self> {
        tokio::fs::create_dir_all(data_dir)
            .await
            .with_context(|| format!("could not create {}", data_dir.display()))?;
        let path = data_dir.join("identity.json");

        match tokio::fs::read(&path).await {
            Ok(bytes) => serde_json::from_slice(&bytes)
                .with_context(|| format!("could not parse {}", path.display())),
            Err(error) if error.kind() == std::io::ErrorKind::NotFound => {
                let identity = Self::generate()?;
                let bytes = serde_json::to_vec_pretty(&identity)?;
                write_private_file(&path, &bytes).await?;
                Ok(identity)
            }
            Err(error) => Err(error).with_context(|| format!("could not read {}", path.display())),
        }
    }

    fn generate() -> Result<Self> {
        let CertifiedKey { cert, signing_key } =
            generate_simple_self_signed(vec!["localhost".to_string()])?;
        let fingerprint = Sha256::digest(cert.der().as_ref())
            .iter()
            .map(|byte| format!("{byte:02X}"))
            .collect();

        Ok(Self {
            private_key: signing_key.serialize_pem(),
            certificate: cert.pem(),
            fingerprint,
        })
    }
}

async fn write_private_file(path: &Path, bytes: &[u8]) -> Result<()> {
    tokio::fs::write(path, bytes)
        .await
        .with_context(|| format!("could not write {}", path.display()))?;

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
    use super::*;

    #[tokio::test]
    async fn identity_is_persisted() {
        let dir = tempfile::tempdir().unwrap();
        let first = Identity::load_or_create(dir.path()).await.unwrap();
        let second = Identity::load_or_create(dir.path()).await.unwrap();

        assert_eq!(first.fingerprint, second.fingerprint);
        assert_eq!(first.certificate, second.certificate);
        assert_eq!(first.fingerprint.len(), 64);
    }
}
