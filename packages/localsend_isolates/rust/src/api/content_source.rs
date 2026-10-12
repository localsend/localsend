use crate::api::content_stream::RsContentStreamReceiver;
use crate::frb_generated::RustOpaque;
use flutter_rust_bridge::frb;
use localsend::model::content_source::{BytesSource, FileSource};
use localsend::model::transfer::FileContent;
use std::{io, sync::Arc};

/// Serializable recipes used only at the application bridge boundary.
pub enum ContentSource {
    Path { path: String },
    Bytes { bytes: Vec<u8> },
    FileDescriptor { fd: i32 },
    Generated { descriptor: String },
}

impl ContentSource {
    #[frb(ignore)]
    fn into_content(self) -> io::Result<FileContent> {
        match self {
            Self::Path { path } => Ok(FileContent::Source(Arc::new(FileSource {
                path: path.into(),
            }))),
            Self::Bytes { bytes } => Ok(FileContent::Source(Arc::new(BytesSource {
                bytes: bytes.into(),
            }))),
            Self::Generated { descriptor } => {
                crate::api::macos_app_archive::decode_source(&descriptor)
            }
            Self::FileDescriptor { fd } => {
                #[cfg(target_os = "android")]
                {
                    if fd < 0 {
                        return Err(io::Error::new(
                            io::ErrorKind::InvalidInput,
                            "Invalid file descriptor",
                        ));
                    }
                    Ok(FileContent::Fd(fd))
                }
                #[cfg(not(target_os = "android"))]
                {
                    let _ = fd;
                    Err(io::Error::new(
                        io::ErrorKind::Unsupported,
                        "File descriptors are only supported on Android",
                    ))
                }
            }
        }
    }
}

/// The source supplied to a transfer. Native sources can be reopened by Rust;
/// a Dart stream passes its receiver to a single transfer.
pub enum RsContentSource {
    Native {
        source: ContentSource,
    },
    Stream {
        receiver: RustOpaque<RsContentStreamReceiver>,
    },
}

impl RsContentSource {
    #[frb(ignore)]
    pub async fn into_content(self) -> std::io::Result<FileContent> {
        match self {
            Self::Native { source } => source.into_content(),
            Self::Stream { receiver } => receiver.take_content().await,
        }
    }
}
