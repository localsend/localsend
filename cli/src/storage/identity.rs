//! `identity.pem`: this device's certificate and private key.

use anyhow::Context;
use localsend::crypto::cert::fingerprint_from_cert_der;
use localsend::http::dto_v2::RegisterDtoV2;
use localsend::http::server::TlsConfig;
use localsend::http::state::ClientInfo;
use localsend::model::discovery::DeviceType;
use localsend::model::discovery::{PROTOCOL_VERSION_V2, ProtocolType};
use localsend::multicast::MulticastDevice;
use std::path::Path;

/// This device's identity: a self-signed certificate whose SHA-256
/// fingerprint identifies the device. The certificate is persisted as
/// `identity.pem` so the fingerprint — and thereby pairings, on both
/// sides — survives restarts.
pub struct Identity {
    pub alias: String,
    pub port: u16,
    pub cert_pem: String,
    pub key_pem: String,
    pub fingerprint: String,
}

impl Identity {
    /// Loads the identity from `identity.pem` in `dir`, generating and
    /// saving a fresh one when the file does not exist yet.
    pub fn load_or_generate(dir: &Path, alias: String, port: u16) -> anyhow::Result<Self> {
        let path = dir.join("identity.pem");
        match std::fs::read_to_string(&path) {
            Ok(text) => Self::from_pem(&text, alias, port).with_context(|| {
                format!(
                    "Invalid identity file: {} (delete it to generate a new identity; \
                     other devices will then see this device as unpaired)",
                    path.display()
                )
            }),
            Err(err) if err.kind() == std::io::ErrorKind::NotFound => {
                let identity = Self::generate(alias, port)?;
                identity
                    .save(&path)
                    .with_context(|| format!("Could not save {}", path.display()))?;
                Ok(identity)
            }
            Err(err) => Err(err).context(format!("Could not read {}", path.display())),
        }
    }

    fn from_pem(text: &str, alias: String, port: u16) -> anyhow::Result<Self> {
        let blocks = pem::parse_many(text)?;
        let cert = blocks
            .iter()
            .find(|block| block.tag() == "CERTIFICATE")
            .context("missing CERTIFICATE block")?;
        let key = blocks
            .iter()
            .find(|block| block.tag().ends_with("PRIVATE KEY"))
            .context("missing PRIVATE KEY block")?;
        let key_pem = pem::encode(key);
        rcgen::KeyPair::from_pem(&key_pem).context("unusable private key")?;
        Ok(Self {
            alias,
            port,
            fingerprint: fingerprint_from_cert_der(cert.contents()),
            cert_pem: pem::encode(cert),
            key_pem,
        })
    }

    fn save(&self, path: &Path) -> anyhow::Result<()> {
        let contents = format!("{}{}", self.cert_pem, self.key_pem);
        #[cfg(unix)]
        {
            // The file contains the private key; keep it owner-readable only.
            use std::io::Write;
            use std::os::unix::fs::OpenOptionsExt;
            let mut file = std::fs::OpenOptions::new()
                .write(true)
                .create_new(true)
                .mode(0o600)
                .open(path)?;
            file.write_all(contents.as_bytes())?;
        }
        #[cfg(not(unix))]
        std::fs::write(path, contents)?;
        Ok(())
    }

    fn generate(alias: String, port: u16) -> anyhow::Result<Self> {
        let cert = localsend::crypto::cert::generate_self_signed()?;

        Ok(Self {
            alias,
            port,
            fingerprint: cert.fingerprint,
            cert_pem: cert.certificate_pem,
            key_pem: cert.private_key_pem,
        })
    }

    pub fn tls_config(&self) -> TlsConfig {
        TlsConfig {
            cert: self.cert_pem.clone(),
            private_key: self.key_pem.clone(),
        }
    }

    pub fn client_info(&self) -> ClientInfo {
        ClientInfo {
            alias: self.alias.clone(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some("CLI".to_string()),
            device_type: Some(DeviceType::Headless),
            token: self.fingerprint.clone(),
        }
    }

    pub fn register_dto(&self) -> RegisterDtoV2 {
        RegisterDtoV2 {
            alias: self.alias.clone(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some("CLI".to_string()),
            device_type: Some(DeviceType::Headless),
            fingerprint: self.fingerprint.clone(),
            port: self.port,
            protocol: ProtocolType::Https,
            download: false,
        }
    }

    pub fn multicast_device(&self) -> MulticastDevice {
        MulticastDevice {
            alias: self.alias.clone(),
            version: PROTOCOL_VERSION_V2.to_string(),
            device_model: Some("CLI".to_string()),
            device_type: Some(DeviceType::Headless),
            fingerprint: self.fingerprint.clone(),
            port: self.port,
            protocol: ProtocolType::Https,
            download: false,
        }
    }
}
