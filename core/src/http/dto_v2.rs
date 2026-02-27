use crate::model::discovery::DeviceType;
use crate::model::transfer::FileDto;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

/// Protocol type for HTTP or HTTPS connections.
#[derive(Clone, Debug, Deserialize, Eq, Serialize, PartialEq)]
#[serde(rename_all = "lowercase")]
pub enum ProtocolTypeV2 {
    Http,
    Https,
}

impl ProtocolTypeV2 {
    pub fn as_str(&self) -> &'static str {
        match self {
            ProtocolTypeV2::Http => "http",
            ProtocolTypeV2::Https => "https",
        }
    }
}

/// Multicast announcement/response message for UDP discovery (v2.1).
///
/// Used for both sending announcements and responding to announcements.
/// When `announce` is true, other devices should respond.
/// When `announce` is false, this is a response to an announcement.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct MulticastMessageV2 {
    /// The display name of the device.
    pub alias: String,

    /// Protocol version (e.g., "2.1").
    pub version: String,

    /// Device model (e.g., "Samsung", "Windows"). Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    /// Device type category. Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    /// Fingerprint for device identification.
    /// In HTTPS mode: SHA-256 hash of the certificate.
    /// In HTTP mode: randomly generated string.
    pub fingerprint: String,

    /// Port number the device is listening on.
    pub port: u16,

    /// Protocol type (http or https).
    pub protocol: ProtocolTypeV2,

    /// Whether the download API (sections 5.2, 5.3) is active.
    #[serde(default)]
    pub download: bool,

    /// Whether this is an announcement (true) or a response (false).
    /// Other devices should only respond when this is true.
    pub announce: bool,
}

/// Register request DTO for v2.1 protocol.
///
/// Sent to POST /api/localsend/v2/register for device discovery.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RegisterDtoV2 {
    /// The display name of the device.
    pub alias: String,

    /// Protocol version (e.g., "2.0", "2.1").
    pub version: String,

    /// Device model (e.g., "Samsung", "Windows"). Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    /// Device type category. Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    /// Fingerprint for device identification.
    /// Ignored in HTTPS mode (certificate is used instead).
    pub fingerprint: String,

    /// Port number the device is listening on.
    pub port: u16,

    /// Protocol type (http or https).
    pub protocol: ProtocolTypeV2,

    /// Whether the download API (sections 5.2, 5.3) is active.
    #[serde(default)]
    pub download: bool,
}

/// Register response DTO for v2.1 protocol.
///
/// Response from POST /api/localsend/v2/register.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RegisterResponseDtoV2 {
    /// The display name of the device.
    pub alias: String,

    /// Protocol version (e.g., "2.0", "2.1").
    pub version: String,

    /// Device model. Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    /// Device type category. Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    /// Fingerprint for device identification.
    /// Ignored in HTTPS mode (certificate is used instead).
    #[serde(default)]
    pub fingerprint: String,

    /// Whether the download API (sections 5.2, 5.3) is active.
    #[serde(default)]
    pub download: bool,
}

/// Prepare upload request DTO for v2.1 protocol.
///
/// Sent to POST /api/localsend/v2/prepare-upload to initiate a file transfer.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PrepareUploadRequestDtoV2 {
    /// Sender's device information.
    pub info: RegisterDtoV2,

    /// Map of file ID to file metadata.
    pub files: HashMap<String, FileDto>,
}

/// Prepare upload response DTO for v2.1 protocol.
///
/// Response from POST /api/localsend/v2/prepare-upload.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PrepareUploadResponseDtoV2 {
    /// Session ID for the file transfer.
    pub session_id: String,

    /// Map of file ID to file token.
    /// Only contains files that were accepted by the receiver.
    pub files: HashMap<String, String>,
}

/// Prepare download response DTO for v2.1 protocol (Download API).
///
/// Response from POST /api/localsend/v2/prepare-download.
/// Used when the sender provides files for others to download.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PrepareDownloadResponseDtoV2 {
    /// Sender's device information.
    pub info: InfoResponseDtoV2,

    /// Session ID for the download session.
    pub session_id: String,

    /// Map of file ID to file metadata.
    pub files: HashMap<String, FileDto>,
}

/// Info response DTO for v2.1 protocol.
///
/// Response from GET /api/localsend/v2/info.
/// Also used as the `info` field in PrepareDownloadResponseDtoV2.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct InfoResponseDtoV2 {
    /// The display name of the device.
    pub alias: String,

    /// Protocol version (e.g., "2.0", "2.1").
    pub version: String,

    /// Device model. Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_model: Option<String>,

    /// Device type category. Optional.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub device_type: Option<DeviceType>,

    /// Fingerprint for device identification.
    pub fingerprint: String,

    /// Whether the download API (sections 5.2, 5.3) is active.
    #[serde(default)]
    pub download: bool,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_multicast_message_serialization() {
        let msg = MulticastMessageV2 {
            alias: "Nice Orange".to_string(),
            version: "2.1".to_string(),
            device_model: Some("Samsung".to_string()),
            device_type: Some(DeviceType::Mobile),
            fingerprint: "random string".to_string(),
            port: 53317,
            protocol: ProtocolTypeV2::Https,
            download: true,
            announce: true,
        };

        let json = serde_json::to_string(&msg).unwrap();
        assert!(json.contains("\"alias\":\"Nice Orange\""));
        assert!(json.contains("\"version\":\"2.1\""));
        assert!(json.contains("\"fingerprint\":\"random string\""));
        assert!(json.contains("\"announce\":true"));
        assert!(json.contains("\"download\":true"));
        assert!(json.contains("\"protocol\":\"https\""));
    }

    #[test]
    fn test_register_dto_v2_deserialization() {
        let json = r#"{
            "alias": "Secret Banana",
            "version": "2.0",
            "deviceModel": "Windows",
            "deviceType": "DESKTOP",
            "fingerprint": "random string",
            "port": 53317,
            "protocol": "https",
            "download": true
        }"#;

        let dto: RegisterDtoV2 = serde_json::from_str(json).unwrap();
        assert_eq!(dto.alias, "Secret Banana");
        assert_eq!(dto.version, "2.0");
        assert_eq!(dto.device_model, Some("Windows".to_string()));
        assert_eq!(dto.device_type, Some(DeviceType::Desktop));
        assert_eq!(dto.fingerprint, "random string");
        assert_eq!(dto.port, 53317);
        assert_eq!(dto.protocol, ProtocolTypeV2::Https);
        assert!(dto.download);
    }

    #[test]
    fn test_register_response_without_download_field() {
        // Test that download defaults to false when not present
        let json = r#"{
            "alias": "Test Device",
            "version": "2.0",
            "fingerprint": "abc123"
        }"#;

        let dto: RegisterResponseDtoV2 = serde_json::from_str(json).unwrap();
        assert_eq!(dto.alias, "Test Device");
        assert!(!dto.download);
    }

    #[test]
    fn test_prepare_upload_request_v2() {
        let request = PrepareUploadRequestDtoV2 {
            info: RegisterDtoV2 {
                alias: "Sender".to_string(),
                version: "2.1".to_string(),
                device_model: None,
                device_type: None,
                fingerprint: "sender-fingerprint".to_string(),
                port: 53317,
                protocol: ProtocolTypeV2::Https,
                download: false,
            },
            files: HashMap::from([(
                "file1".to_string(),
                FileDto {
                    id: "file1".to_string(),
                    file_name: "test.png".to_string(),
                    size: 1024,
                    file_type: "image/png".to_string(),
                    sha256: None,
                    preview: None,
                    metadata: None,
                },
            )]),
        };

        let json = serde_json::to_string(&request).unwrap();
        assert!(json.contains("\"info\""));
        assert!(json.contains("\"files\""));
        assert!(json.contains("\"fingerprint\":\"sender-fingerprint\""));
    }
}
