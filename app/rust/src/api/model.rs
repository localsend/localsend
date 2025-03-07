use flutter_rust_bridge::frb;
pub use localsend::model::discovery::{DeviceType, ProtocolType, RegisterDto, RegisterResponseDto};
pub use localsend::model::transfer::{
    FileDto, FileMetadata, PrepareUploadRequestDto, PrepareUploadResponseDto,
};
use std::collections::HashMap;

#[frb(mirror(RegisterDto))]
pub struct _RegisterDto {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
    pub fingerprint: String,
    pub port: u16,
    pub protocol: ProtocolType,
    pub download: bool,
}

#[frb(mirror(RegisterResponseDto))]
pub struct _RegisterResponseDto {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
    pub fingerprint: String,
    pub download: bool,
}

#[frb(mirror(DeviceType))]
pub enum _DeviceType {
    Mobile,
    Desktop,
    Web,
    Headless,
    Server,
}

#[frb(mirror(ProtocolType))]
pub enum _ProtocolType {
    Http,
    Https,
}

#[frb(mirror(FileDto))]
pub struct _FileDto {
    pub id: String,
    pub file_name: String,
    pub size: u64,
    pub file_type: String,
    pub sha256: Option<String>,
    pub preview: Option<String>,
    pub metadata: Option<FileMetadata>,
}

#[frb(mirror(FileMetadata))]
pub struct _FileMetadata {
    pub modified: Option<String>,
    pub accessed: Option<String>,
}

#[frb(mirror(PrepareUploadRequestDto))]
pub struct _PrepareUploadRequestDto {
    pub info: RegisterDto,
    pub files: HashMap<String, FileDto>,
}

#[frb(mirror(PrepareUploadResponseDto))]
pub struct _PrepareUploadResponseDto {
    pub session_id: String,
    pub files: HashMap<String, String>,
}
