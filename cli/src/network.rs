use std::collections::{HashMap, HashSet};
use std::net::{IpAddr, Ipv4Addr, SocketAddrV4};
use std::path::{Path, PathBuf};
use std::sync::Arc;
use std::time::Duration;

use anyhow::{Context, Result, anyhow, bail};
use bytes::Bytes;
use localsend::http::client::LsHttpClientV2;
use localsend::http::dto::ProtocolType;
use localsend::http::dto_v2::{
    MulticastMessageV2, PROTOCOL_VERSION_V2, PrepareUploadRequestDtoV2, RegisterDtoV2,
};
use localsend::http::server::common::save::FileUploadTarget;
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2, SessionEndReasonV2};
use localsend::http::server::{ServerConfigV2, TlsConfig, start_with_port};
use localsend::http::state::ClientInfo;
use localsend::model::discovery::DeviceType;
use localsend::model::transfer::{FileContent, FileDto};
use socket2::{Domain, Protocol, Socket, Type};
use tokio::net::UdpSocket;
use tokio::sync::{Mutex, RwLock, mpsc, oneshot};
use tokio::task::JoinHandle;
use tokio_util::sync::CancellationToken;
use uuid::Uuid;

use crate::config::RuntimeConfig;
use crate::identity::Identity;
use crate::model::{
    InboxFile, InboxFileStatus, InboxItem, InboxStatus, Peer, PeerProtocol, PeerView,
    PendingTransfer, TransferResult, TrustedPeer, unix_timestamp,
};
use crate::store::Store;

const MAX_FILES_PER_TRANSFER: usize = 32;

#[derive(Default)]
struct Lifecycle {
    stop_tx: Option<oneshot::Sender<()>>,
    tasks: Vec<JoinHandle<()>>,
}

pub struct NetworkService {
    config: RuntimeConfig,
    identity: Identity,
    store: Arc<Store>,
    client: Arc<LsHttpClientV2>,
    peers: RwLock<HashMap<String, Peer>>,
    pending: Mutex<Option<PendingTransfer>>,
    lifecycle: Mutex<Lifecycle>,
}

impl NetworkService {
    pub async fn new(config: RuntimeConfig) -> Result<Self> {
        let identity = Identity::load_or_create(&config.data_dir).await?;
        let store = Arc::new(Store::open(&config.data_dir).await?);
        let client = Arc::new(LsHttpClientV2::try_new(
            &identity.private_key,
            &identity.certificate,
            Some(Duration::from_secs(10)),
        )?);

        Ok(Self {
            config,
            identity,
            store,
            client,
            peers: RwLock::new(HashMap::new()),
            pending: Mutex::new(None),
            lifecycle: Mutex::new(Lifecycle::default()),
        })
    }

    pub async fn start(self: &Arc<Self>) -> Result<()> {
        let mut lifecycle = self.lifecycle.lock().await;
        if lifecycle.stop_tx.is_some() {
            return Ok(());
        }

        let (event_tx, mut event_rx) = mpsc::channel(32);
        let (stop_tx, stop_rx) = oneshot::channel();
        start_with_port(
            self.config.port,
            Some(TlsConfig {
                cert: self.identity.certificate.clone(),
                private_key: self.identity.private_key.clone(),
            }),
            self.client_info(),
            Some(ServerConfigV2 {
                pin: self.config.receive_pin.clone(),
                event_tx,
            }),
            None,
            stop_rx,
        )
        .await
        .with_context(|| format!("could not start LocalSend on port {}", self.config.port))?;

        let socket = create_multicast_socket(self.config.port, self.config.multicast_group)?;
        let events = Arc::clone(self);
        lifecycle.tasks.push(tokio::spawn(async move {
            while let Some(event) = event_rx.recv().await {
                if let Err(error) = events.handle_server_event(event).await {
                    tracing::warn!(%error, "failed to handle LocalSend event");
                }
            }
        }));

        let discovery = Arc::clone(self);
        lifecycle.tasks.push(tokio::spawn(async move {
            discovery.receive_announcements(socket).await;
        }));
        lifecycle.stop_tx = Some(stop_tx);
        drop(lifecycle);

        self.announce(true).await?;
        tracing::info!(
            alias = %self.config.alias,
            fingerprint = %self.identity.fingerprint,
            port = self.config.port,
            "LocalSend MCP peer started"
        );
        Ok(())
    }

    pub async fn shutdown(&self) {
        let mut lifecycle = self.lifecycle.lock().await;
        if let Some(stop_tx) = lifecycle.stop_tx.take() {
            let _ = stop_tx.send(());
        }
        for task in lifecycle.tasks.drain(..) {
            task.abort();
        }
    }

    pub fn fingerprint(&self) -> &str {
        &self.identity.fingerprint
    }

    pub fn alias(&self) -> &str {
        &self.config.alias
    }

    pub fn port(&self) -> u16 {
        self.config.port
    }

    pub async fn discover_devices(&self, wait: Duration) -> Result<Vec<PeerView>> {
        self.announce(true).await?;
        tokio::time::sleep(wait).await;
        Ok(self.list_peers().await)
    }

    pub async fn probe_device(
        &self,
        ip: IpAddr,
        port: u16,
        protocol: PeerProtocol,
    ) -> Result<PeerView> {
        if port == 0 {
            bail!("port must be non-zero");
        }
        let peer = self.probe_peer(ip, port, protocol).await?;
        let paired = self.store.is_trusted_peer(&peer).await;
        Ok(peer.view(paired))
    }

    pub async fn pair_device(&self, fingerprint: &str) -> Result<TrustedPeer> {
        let peer = self.find_peer(fingerprint).await?;
        if peer.protocol == PeerProtocol::Http && !self.config.allow_unencrypted {
            bail!("refusing to pair an unencrypted peer; use --allow-unencrypted to opt in");
        }
        if peer.protocol == PeerProtocol::Https && peer.public_key.is_none() {
            bail!("the peer certificate has not been verified yet; probe the device first");
        }
        self.store.pair(&peer).await
    }

    pub async fn unpair_device(&self, fingerprint: &str) -> Result<bool> {
        self.store.unpair(fingerprint).await
    }

    pub async fn trusted_devices(&self) -> Vec<TrustedPeer> {
        self.store.trusted_peers().await
    }

    pub async fn list_inbox(&self, unread_only: bool, limit: usize) -> Vec<InboxItem> {
        self.store.list_inbox(unread_only, limit).await
    }

    pub async fn read_inbox(&self, id: &str) -> Result<Option<InboxItem>> {
        self.store.read_inbox(id).await
    }

    pub async fn send_message(
        &self,
        target_fingerprint: &str,
        message: &str,
        pin: Option<&str>,
    ) -> Result<TransferResult> {
        if message.is_empty() {
            bail!("message must not be empty");
        }
        let size = u64::try_from(message.len()).unwrap_or(u64::MAX);
        if size > self.config.max_transfer_bytes {
            bail!("message exceeds the configured transfer limit");
        }

        let peer = self.trusted_peer(target_fingerprint).await?;
        let file_id = Uuid::new_v4().to_string();
        let file = FileDto {
            id: file_id.clone(),
            file_name: "message.txt".to_string(),
            size,
            file_type: "text/plain".to_string(),
            sha256: None,
            preview: Some(message.to_string()),
            metadata: None,
        };
        let result = self
            .client
            .prepare_upload(
                protocol_type(peer.protocol),
                &peer.ip.to_string(),
                peer.port,
                peer.public_key.clone(),
                PrepareUploadRequestDtoV2 {
                    info: self.register_dto(),
                    files: HashMap::from([(file_id.clone(), file)]),
                },
                pin,
            )
            .await?;

        if let Some(response) = result.response {
            if let Some(token) = response.files.get(&file_id) {
                let (tx, rx) = mpsc::channel(1);
                tx.send(Bytes::copy_from_slice(message.as_bytes())).await?;
                drop(tx);
                if let Err(error) = self
                    .client
                    .upload(
                        protocol_type(peer.protocol),
                        &peer.ip.to_string(),
                        peer.port,
                        peer.public_key.clone(),
                        &response.session_id,
                        &file_id,
                        token,
                        FileContent::Stream(rx),
                        CancellationToken::new(),
                    )
                    .await
                {
                    let _ = self
                        .client
                        .cancel(
                            protocol_type(peer.protocol),
                            &peer.ip.to_string(),
                            peer.port,
                            &response.session_id,
                        )
                        .await;
                    return Err(error.into());
                }
            }
            return Ok(TransferResult {
                target_fingerprint: peer.fingerprint,
                target_alias: peer.alias,
                session_id: Some(response.session_id),
                accepted_files: vec!["message.txt".to_string()],
                skipped_files: Vec::new(),
            });
        }

        Ok(TransferResult {
            target_fingerprint: peer.fingerprint,
            target_alias: peer.alias,
            session_id: None,
            accepted_files: vec!["message.txt".to_string()],
            skipped_files: Vec::new(),
        })
    }

    pub async fn send_files(
        &self,
        target_fingerprint: &str,
        paths: Vec<PathBuf>,
        pin: Option<&str>,
    ) -> Result<TransferResult> {
        if paths.is_empty() {
            bail!("at least one path is required");
        }
        if paths.len() > MAX_FILES_PER_TRANSFER {
            bail!("a transfer may contain at most {MAX_FILES_PER_TRANSFER} files");
        }

        let peer = self.trusted_peer(target_fingerprint).await?;
        let mut files = HashMap::new();
        let mut sources = HashMap::new();
        let mut names = HashMap::new();
        let mut total_size = 0_u64;
        for path in paths {
            let path = path
                .canonicalize()
                .with_context(|| format!("could not resolve {}", path.display()))?;
            if !self.path_is_allowed(&path) {
                bail!(
                    "path is outside the configured allowed roots: {}",
                    path.display()
                );
            }
            let metadata = tokio::fs::metadata(&path)
                .await
                .with_context(|| format!("could not inspect {}", path.display()))?;
            if !metadata.is_file() {
                bail!("path is not a regular file: {}", path.display());
            }
            total_size = total_size
                .checked_add(metadata.len())
                .ok_or_else(|| anyhow!("transfer size overflow"))?;
            if total_size > self.config.max_transfer_bytes {
                bail!("files exceed the configured transfer limit");
            }

            let name = path
                .file_name()
                .and_then(|name| name.to_str())
                .ok_or_else(|| anyhow!("file name is not valid UTF-8: {}", path.display()))?
                .to_string();
            let id = Uuid::new_v4().to_string();
            files.insert(
                id.clone(),
                FileDto {
                    id: id.clone(),
                    file_name: name.clone(),
                    size: metadata.len(),
                    file_type: mime_guess::from_path(&path)
                        .first_or_octet_stream()
                        .essence_str()
                        .to_string(),
                    sha256: None,
                    preview: None,
                    metadata: None,
                },
            );
            sources.insert(id.clone(), path);
            names.insert(id, name);
        }

        let result = self
            .client
            .prepare_upload(
                protocol_type(peer.protocol),
                &peer.ip.to_string(),
                peer.port,
                peer.public_key.clone(),
                PrepareUploadRequestDtoV2 {
                    info: self.register_dto(),
                    files,
                },
                pin,
            )
            .await?;
        let Some(response) = result.response else {
            bail!("receiver accepted no file content");
        };

        let mut accepted_files = Vec::new();
        for (file_id, token) in &response.files {
            let Some(path) = sources.get(file_id) else {
                continue;
            };
            if let Err(error) = self
                .client
                .upload(
                    protocol_type(peer.protocol),
                    &peer.ip.to_string(),
                    peer.port,
                    peer.public_key.clone(),
                    &response.session_id,
                    file_id,
                    token,
                    FileContent::Path(path.clone()),
                    CancellationToken::new(),
                )
                .await
            {
                let _ = self
                    .client
                    .cancel(
                        protocol_type(peer.protocol),
                        &peer.ip.to_string(),
                        peer.port,
                        &response.session_id,
                    )
                    .await;
                return Err(error.into());
            }
            if let Some(name) = names.get(file_id) {
                accepted_files.push(name.clone());
            }
        }
        let accepted_ids = response.files.keys().collect::<HashSet<_>>();
        let skipped_files = names
            .iter()
            .filter(|(id, _)| !accepted_ids.contains(id))
            .map(|(_, name)| name.clone())
            .collect();

        Ok(TransferResult {
            target_fingerprint: peer.fingerprint,
            target_alias: peer.alias,
            session_id: Some(response.session_id),
            accepted_files,
            skipped_files,
        })
    }

    async fn list_peers(&self) -> Vec<PeerView> {
        let peers = self
            .peers
            .read()
            .await
            .values()
            .cloned()
            .collect::<Vec<_>>();
        let mut result = Vec::with_capacity(peers.len());
        for peer in peers {
            let paired = self.store.is_trusted_peer(&peer).await;
            result.push(peer.view(paired));
        }
        result.sort_by(|left, right| left.alias.to_lowercase().cmp(&right.alias.to_lowercase()));
        result
    }

    async fn trusted_peer(&self, fingerprint: &str) -> Result<Peer> {
        let peer = self.find_peer(fingerprint).await?;
        let trusted = self
            .store
            .trusted_peers()
            .await
            .into_iter()
            .find(|entry| entry.fingerprint.eq_ignore_ascii_case(&peer.fingerprint))
            .ok_or_else(|| anyhow!("peer is not paired: {}", peer.alias))?;
        if peer.protocol == PeerProtocol::Https && trusted.public_key != peer.public_key {
            bail!("the peer certificate changed; unpair and verify the device again");
        }
        if peer.protocol == PeerProtocol::Http && !self.config.allow_unencrypted {
            bail!("refusing to send over unencrypted HTTP");
        }
        Ok(peer)
    }

    async fn find_peer(&self, fingerprint: &str) -> Result<Peer> {
        self.peers
            .read()
            .await
            .values()
            .find(|peer| peer.fingerprint.eq_ignore_ascii_case(fingerprint))
            .cloned()
            .ok_or_else(|| anyhow!("unknown peer fingerprint: {fingerprint}"))
    }

    async fn probe_peer(&self, ip: IpAddr, port: u16, protocol: PeerProtocol) -> Result<Peer> {
        let response = self
            .client
            .register(
                protocol_type(protocol),
                &ip.to_string(),
                port,
                self.register_dto(),
            )
            .await?;
        if protocol == PeerProtocol::Https
            && response
                .certificate_fingerprint
                .as_deref()
                .is_none_or(|fingerprint| {
                    !fingerprint.eq_ignore_ascii_case(&response.body.fingerprint)
                })
        {
            bail!("peer certificate does not match its advertised fingerprint");
        }

        let peer = Peer {
            fingerprint: response.body.fingerprint,
            alias: response.body.alias,
            ip,
            port,
            protocol,
            device_model: response.body.device_model,
            device_type: response
                .body
                .device_type
                .map(|value| format!("{value:?}").to_lowercase()),
            public_key: response.public_key,
            last_seen_at: unix_timestamp(),
        };
        self.upsert_peer(peer.clone()).await;
        Ok(peer)
    }

    async fn handle_server_event(self: &Arc<Self>, event: ServerEventV2) -> Result<()> {
        match event {
            ServerEventV2::Register {
                ip,
                certificate_fingerprint,
                public_key,
                info,
            } => match self.incoming_peer(ip, certificate_fingerprint, public_key, info) {
                Ok(peer) => self.upsert_peer(peer).await,
                Err(error) => tracing::warn!(%ip, %error, "ignored invalid registration"),
            },
            ServerEventV2::PrepareUpload {
                ip,
                certificate_fingerprint,
                public_key,
                info,
                files,
                decision_tx,
            } => {
                self.handle_prepare_upload(
                    ip,
                    certificate_fingerprint,
                    public_key,
                    info,
                    files,
                    decision_tx,
                )
                .await?;
            }
            ServerEventV2::FileUpload {
                file_id, target_tx, ..
            } => {
                let target = self.pending.lock().await.as_ref().and_then(|pending| {
                    pending
                        .destinations
                        .get(&file_id)
                        .cloned()
                        .map(|path| (pending.inbox_id.clone(), path))
                });
                if let Some((inbox_id, path)) = target {
                    let (result_tx, result_rx) = oneshot::channel();
                    target_tx
                        .send(FileUploadTarget::Path { path, result_tx })
                        .map_err(|_| anyhow!("upload request was dropped"))?;
                    let store = Arc::clone(&self.store);
                    tokio::spawn(async move {
                        let result = result_rx.await.unwrap_or_else(|_| {
                            Err("file writer stopped unexpectedly".to_string())
                        });
                        if let Err(error) = store.update_file(&inbox_id, &file_id, result).await {
                            tracing::warn!(%error, "could not update inbox file status");
                        }
                    });
                }
            }
            ServerEventV2::SessionEnd { reason, .. } => {
                let pending = self.pending.lock().await.take();
                if reason == SessionEndReasonV2::Cancelled
                    && let Some(pending) = pending
                {
                    self.store.mark_failed(&pending.inbox_id).await?;
                }
            }
        }
        Ok(())
    }

    #[allow(clippy::too_many_arguments)]
    async fn handle_prepare_upload(
        &self,
        ip: IpAddr,
        certificate_fingerprint: Option<String>,
        public_key: Option<String>,
        info: RegisterDtoV2,
        files: HashMap<String, FileDto>,
        decision_tx: oneshot::Sender<PrepareUploadDecisionV2>,
    ) -> Result<()> {
        let peer = match self.incoming_peer(ip, certificate_fingerprint, public_key, info) {
            Ok(peer) => peer,
            Err(error) => {
                tracing::warn!(%ip, %error, "declined transfer with invalid identity");
                let _ = decision_tx.send(PrepareUploadDecisionV2::Decline);
                return Ok(());
            }
        };
        self.upsert_peer(peer.clone()).await;

        if files.len() > MAX_FILES_PER_TRANSFER
            || files
                .values()
                .try_fold(0_u64, |total, file| total.checked_add(file.size))
                .is_none_or(|total| total > self.config.max_transfer_bytes)
            || !self.incoming_peer_is_trusted(&peer).await
        {
            let _ = decision_tx.send(PrepareUploadDecisionV2::Decline);
            return Ok(());
        }

        if files.len() == 1 {
            let file = files.values().next().expect("one file");
            if file.file_type.starts_with("text/")
                && let Some(message) = &file.preview
                && u64::try_from(message.len()).ok() == Some(file.size)
            {
                self.store
                    .add_inbox(InboxItem {
                        id: Uuid::new_v4().to_string(),
                        received_at: unix_timestamp(),
                        sender_alias: peer.alias,
                        sender_fingerprint: peer.fingerprint,
                        sender_ip: peer.ip.to_string(),
                        message: Some(message.clone()),
                        files: Vec::new(),
                        status: InboxStatus::Complete,
                        read: false,
                    })
                    .await?;
                let _ = decision_tx.send(PrepareUploadDecisionV2::Accept(HashSet::new()));
                return Ok(());
            }
        }

        let inbox_id = Uuid::new_v4().to_string();
        let inbox_dir = self.config.data_dir.join("inbox-files").join(&inbox_id);
        tokio::fs::create_dir_all(&inbox_dir).await?;
        protect_directory(&inbox_dir).await?;
        let mut destinations = HashMap::new();
        let mut inbox_files = Vec::with_capacity(files.len());
        for (file_id, file) in &files {
            let path = inbox_dir.join(file_id);
            destinations.insert(file_id.clone(), path.clone());
            inbox_files.push(InboxFile {
                id: file_id.clone(),
                name: file.file_name.clone(),
                size: file.size,
                mime_type: file.file_type.clone(),
                path: path.to_string_lossy().into_owned(),
                status: InboxFileStatus::Pending,
            });
        }
        self.store
            .add_inbox(InboxItem {
                id: inbox_id.clone(),
                received_at: unix_timestamp(),
                sender_alias: peer.alias,
                sender_fingerprint: peer.fingerprint,
                sender_ip: peer.ip.to_string(),
                message: None,
                files: inbox_files,
                status: InboxStatus::Pending,
                read: false,
            })
            .await?;
        *self.pending.lock().await = Some(PendingTransfer {
            inbox_id: inbox_id.clone(),
            destinations,
        });

        if decision_tx
            .send(PrepareUploadDecisionV2::Accept(
                files.keys().cloned().collect(),
            ))
            .is_err()
        {
            self.pending.lock().await.take();
            self.store.mark_failed(&inbox_id).await?;
        }
        Ok(())
    }

    fn incoming_peer(
        &self,
        ip: IpAddr,
        certificate_fingerprint: Option<String>,
        public_key: Option<String>,
        info: RegisterDtoV2,
    ) -> Result<Peer> {
        let protocol = PeerProtocol::from(info.protocol.clone());
        match protocol {
            PeerProtocol::Https => {
                let certificate_fingerprint = certificate_fingerprint
                    .ok_or_else(|| anyhow!("HTTPS peer did not present a certificate"))?;
                if !certificate_fingerprint.eq_ignore_ascii_case(&info.fingerprint) {
                    bail!("declared fingerprint does not match the client certificate");
                }
                if public_key.is_none() {
                    bail!("could not extract the client public key");
                }
            }
            PeerProtocol::Http if !self.config.allow_unencrypted => {
                bail!("unencrypted peers are disabled");
            }
            PeerProtocol::Http => {}
        }

        Ok(Peer {
            fingerprint: info.fingerprint,
            alias: info.alias,
            ip,
            port: info.port,
            protocol,
            device_model: info.device_model,
            device_type: info
                .device_type
                .map(|value| format!("{value:?}").to_lowercase()),
            public_key,
            last_seen_at: unix_timestamp(),
        })
    }

    async fn incoming_peer_is_trusted(&self, peer: &Peer) -> bool {
        let trusted = self
            .store
            .trusted_peers()
            .await
            .into_iter()
            .find(|entry| entry.fingerprint.eq_ignore_ascii_case(&peer.fingerprint));
        match trusted {
            Some(trusted) if peer.protocol == PeerProtocol::Https => {
                trusted.public_key.is_some() && trusted.public_key == peer.public_key
            }
            Some(_) => self.config.allow_unencrypted,
            None => false,
        }
    }

    async fn upsert_peer(&self, peer: Peer) {
        self.peers
            .write()
            .await
            .insert(peer.fingerprint.to_ascii_uppercase(), peer);
    }

    async fn receive_announcements(self: Arc<Self>, socket: UdpSocket) {
        let mut buffer = vec![0_u8; 64 * 1024];
        loop {
            let (size, source) = match socket.recv_from(&mut buffer).await {
                Ok(value) => value,
                Err(error) => {
                    tracing::warn!(%error, "LocalSend multicast receive failed");
                    return;
                }
            };
            let Ok(message) = serde_json::from_slice::<MulticastMessageV2>(&buffer[..size]) else {
                continue;
            };
            if message
                .fingerprint
                .eq_ignore_ascii_case(&self.identity.fingerprint)
            {
                continue;
            }

            let protocol = PeerProtocol::from(message.protocol);
            let provisional = Peer {
                fingerprint: message.fingerprint,
                alias: message.alias,
                ip: source.ip(),
                port: message.port,
                protocol,
                device_model: message.device_model,
                device_type: message
                    .device_type
                    .map(|value| format!("{value:?}").to_lowercase()),
                public_key: None,
                last_seen_at: unix_timestamp(),
            };
            self.upsert_peer(provisional.clone()).await;
            if message.announce {
                let service = Arc::clone(&self);
                tokio::spawn(async move {
                    if let Err(error) = service
                        .probe_peer(provisional.ip, provisional.port, provisional.protocol)
                        .await
                    {
                        tracing::debug!(%error, "could not register with announced peer");
                    }
                });
            }
        }
    }

    async fn announce(&self, announce: bool) -> Result<()> {
        let bytes = serde_json::to_vec(&MulticastMessageV2 {
            alias: self.config.alias.clone(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some(std::env::consts::OS.to_string()),
            device_type: Some(DeviceType::Headless),
            fingerprint: self.identity.fingerprint.clone(),
            port: self.config.port,
            protocol: localsend::http::dto_v2::ProtocolTypeV2::Https,
            download: false,
            announce,
        })?;
        let socket = UdpSocket::bind((Ipv4Addr::UNSPECIFIED, 0)).await?;
        socket.set_multicast_loop_v4(true)?;
        for port in &self.config.discovery_ports {
            if let Err(error) = socket
                .send_to(
                    &bytes,
                    SocketAddrV4::new(self.config.multicast_group, *port),
                )
                .await
            {
                tracing::debug!(%error, port, "could not send LocalSend announcement");
            }
        }
        Ok(())
    }

    fn client_info(&self) -> ClientInfo {
        ClientInfo {
            alias: self.config.alias.clone(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some(std::env::consts::OS.to_string()),
            device_type: Some(DeviceType::Headless),
            token: self.identity.fingerprint.clone(),
        }
    }

    fn register_dto(&self) -> RegisterDtoV2 {
        RegisterDtoV2 {
            alias: self.config.alias.clone(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some(std::env::consts::OS.to_string()),
            device_type: Some(DeviceType::Headless),
            fingerprint: self.identity.fingerprint.clone(),
            port: self.config.port,
            protocol: localsend::http::dto_v2::ProtocolTypeV2::Https,
            download: false,
        }
    }

    fn path_is_allowed(&self, path: &Path) -> bool {
        self.config
            .allowed_roots
            .iter()
            .any(|root| path.starts_with(root))
    }
}

fn protocol_type(protocol: PeerProtocol) -> ProtocolType {
    match protocol {
        PeerProtocol::Http => ProtocolType::Http,
        PeerProtocol::Https => ProtocolType::Https,
    }
}

fn create_multicast_socket(port: u16, group: Ipv4Addr) -> Result<UdpSocket> {
    let socket = Socket::new(Domain::IPV4, Type::DGRAM, Some(Protocol::UDP))?;
    socket.set_reuse_address(true)?;
    socket.bind(&SocketAddrV4::new(Ipv4Addr::UNSPECIFIED, port).into())?;

    let mut joined = false;
    for interface in if_addrs::get_if_addrs()? {
        let IpAddr::V4(ip) = interface.ip() else {
            continue;
        };
        if interface.is_loopback() {
            continue;
        }
        if socket.join_multicast_v4(&group, &ip).is_ok() {
            joined = true;
        }
    }
    if !joined {
        socket.join_multicast_v4(&group, &Ipv4Addr::UNSPECIFIED)?;
    }
    socket.set_nonblocking(true)?;
    UdpSocket::from_std(socket.into()).context("could not create multicast socket")
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

#[cfg(test)]
mod tests {
    use std::net::TcpListener;

    use super::*;

    fn unused_port() -> u16 {
        TcpListener::bind((Ipv4Addr::LOCALHOST, 0))
            .unwrap()
            .local_addr()
            .unwrap()
            .port()
    }

    #[tokio::test]
    async fn paired_peers_exchange_messages_and_files() {
        let first_dir = tempfile::tempdir().unwrap();
        let second_dir = tempfile::tempdir().unwrap();
        let first = Arc::new(
            NetworkService::new(RuntimeConfig::for_test(
                first_dir.path().to_path_buf(),
                unused_port(),
                "First Agent",
            ))
            .await
            .unwrap(),
        );
        let second = Arc::new(
            NetworkService::new(RuntimeConfig::for_test(
                second_dir.path().to_path_buf(),
                unused_port(),
                "Second Agent",
            ))
            .await
            .unwrap(),
        );
        first.start().await.unwrap();
        second.start().await.unwrap();

        first
            .probe_device(
                IpAddr::V4(Ipv4Addr::LOCALHOST),
                second.port(),
                PeerProtocol::Https,
            )
            .await
            .unwrap();
        second
            .probe_device(
                IpAddr::V4(Ipv4Addr::LOCALHOST),
                first.port(),
                PeerProtocol::Https,
            )
            .await
            .unwrap();
        first.pair_device(second.fingerprint()).await.unwrap();

        let rejected = first
            .send_message(second.fingerprint(), "not paired by receiver", None)
            .await;
        assert!(rejected.is_err());

        second.pair_device(first.fingerprint()).await.unwrap();

        first
            .send_message(second.fingerprint(), "hello from an agent", None)
            .await
            .unwrap();
        let messages = second.list_inbox(false, 10).await;
        assert_eq!(messages[0].message.as_deref(), Some("hello from an agent"));

        let source = first_dir.path().join("payload.txt");
        tokio::fs::write(&source, b"agent payload").await.unwrap();
        first
            .send_files(second.fingerprint(), vec![source], None)
            .await
            .unwrap();
        tokio::time::timeout(Duration::from_secs(2), async {
            loop {
                let inbox = second.list_inbox(false, 10).await;
                if inbox
                    .iter()
                    .any(|item| item.status == InboxStatus::Complete && !item.files.is_empty())
                {
                    break;
                }
                tokio::time::sleep(Duration::from_millis(20)).await;
            }
        })
        .await
        .unwrap();
        let inbox = second.list_inbox(false, 10).await;
        let file = inbox
            .iter()
            .flat_map(|item| &item.files)
            .find(|file| file.name == "payload.txt")
            .unwrap();
        assert_eq!(tokio::fs::read(&file.path).await.unwrap(), b"agent payload");

        first.shutdown().await;
        second.shutdown().await;
    }
}
