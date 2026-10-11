use crate::api::cancel::RsCancellationToken;
use crate::frb_generated::StreamSink;

pub fn verify_cert(cert: String, public_key: String) -> anyhow::Result<()> {
    localsend::crypto::cert::verify_cert_from_pem(cert, Some(&public_key))
}

pub fn generate_key_pair() -> anyhow::Result<KeyPair> {
    let signing_key = localsend::crypto::token::generate_key();
    let private_key = localsend::crypto::token::export_private_key(&signing_key)?;
    let public_key = localsend::crypto::token::export_public_key(&signing_key)?;

    Ok(KeyPair {
        private_key: private_key.to_string(),
        public_key,
    })
}

pub struct KeyPair {
    pub private_key: String,
    pub public_key: String,
}

/// Generates a new device identity: an RSA-2048 key pair and a self-signed
/// certificate whose SHA-256 fingerprint identifies the device.
pub fn generate_security_context() -> anyhow::Result<SecurityContext> {
    let cert = localsend::crypto::cert::generate_self_signed()?;

    Ok(SecurityContext {
        private_key: cert.private_key_pem,
        public_key: cert.public_key_pem,
        certificate: cert.certificate_pem,
        certificate_hash: cert.fingerprint,
    })
}

pub struct SecurityContext {
    pub private_key: String,
    pub public_key: String,
    pub certificate: String,
    pub certificate_hash: String,
}

/// An event emitted while a file is being hashed by [hash_file].
#[derive(Clone)]
pub enum RsHashFileEvent {
    /// Cumulative number of bytes hashed so far.
    /// Throttled, so not every hashed chunk is reported.
    Progress { bytes: u64 },

    /// Hashing has finished; [hash] is the checksum, encoded as lowercase hex.
    /// Always the last event of the stream.
    Done { hash: String },
}

/// Computes the SHA-256 checksum of a file, reported as the final
/// [RsHashFileEvent::Done] event of the returned stream.
///
/// The file is read chunk by chunk, so it is never fully loaded into memory.
/// Cancelling [cancel_token] aborts the read, so hashing a large file does not
/// have to be waited out.
///
/// Failures (including cancellation) are emitted as errors on the stream:
/// flutter_rust_bridge discards the returned `Result` of functions taking a
/// [StreamSink], so a returned error would become an uncaught async error
/// killing the calling isolate.
///
/// Exactly one content source must be provided:
/// a [path] to a regular file, a [file_descriptor] (Android only), or [bytes]
/// for a file that only lives in memory.
pub async fn hash_file(
    sink: StreamSink<RsHashFileEvent>,
    path: Option<String>,
    file_descriptor: Option<i32>,
    bytes: Option<Vec<u8>>,
    cancel_token: &RsCancellationToken,
) {
    let result = async {
        let content = match (path, file_descriptor, bytes) {
            (Some(path), None, None) => localsend::model::transfer::FileContent::Path(path.into()),
            (None, Some(file_descriptor), None) => {
                #[cfg(target_os = "android")]
                {
                    localsend::model::transfer::FileContent::Fd(file_descriptor)
                }
                #[cfg(not(target_os = "android"))]
                {
                    let _ = file_descriptor;
                    anyhow::bail!("File descriptors are only supported on Android");
                }
            }
            (None, None, Some(bytes)) => {
                let hash = localsend::crypto::hash::sha256_hex(&bytes);
                let _ = sink.add(RsHashFileEvent::Done { hash });
                return Ok(());
            }
            _ => anyhow::bail!("Exactly one content source must be provided"),
        };

        // Progress events with throttling
        let last_emit = std::cell::Cell::new(None::<std::time::Instant>);
        let progress = {
            let sink = sink.clone();
            move |hashed| {
                let now = std::time::Instant::now();
                if let Some(last) = last_emit.get() {
                    if now.duration_since(last) < std::time::Duration::from_millis(20) {
                        return;
                    }
                }
                last_emit.set(Some(now));
                let _ = sink.add(RsHashFileEvent::Progress { bytes: hashed });
            }
        };

        let hash =
            localsend::crypto::hash::sha256_file_content(content, &cancel_token.inner, progress)
                .await?;
        let _ = sink.add(RsHashFileEvent::Done { hash });
        Ok(())
    }
    .await;

    if let Err(err) = result {
        let _ = sink.add_error(err);
    }
}
