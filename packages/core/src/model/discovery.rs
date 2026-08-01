use serde::{Deserialize, Serialize};

/// The protocol version (major.minor) implemented by this crate for the v2 protocol.
pub const PROTOCOL_VERSION_V2: &str = "2.1";

#[derive(Clone, Debug, Deserialize, Eq, Serialize, PartialEq)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum DeviceType {
    Mobile,
    Desktop,
    Web,
    Headless,
    Server,
}

/// Protocol type for HTTP or HTTPS connections.
#[derive(Clone, Copy, Debug, Deserialize, Eq, Hash, Serialize, PartialEq)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum ProtocolType {
    Http,
    Https,
}

impl ProtocolType {
    pub fn as_str(&self) -> &'static str {
        match self {
            ProtocolType::Http => "http",
            ProtocolType::Https => "https",
        }
    }
}

/// Serde helpers for `ProtocolType` in the v2 protocol.
///
/// The v2 protocol uses lowercase values ("http"/"https") on the wire.
pub(crate) mod protocol_type_v2 {
    use super::ProtocolType;
    use serde::{Deserialize, Deserializer, Serializer};

    pub fn serialize<S: Serializer>(
        value: &ProtocolType,
        serializer: S,
    ) -> Result<S::Ok, S::Error> {
        serializer.serialize_str(value.as_str())
    }

    pub fn deserialize<'de, D: Deserializer<'de>>(
        deserializer: D,
    ) -> Result<ProtocolType, D::Error> {
        let value = String::deserialize(deserializer)?;
        match value.as_str() {
            "http" => Ok(ProtocolType::Http),
            "https" => Ok(ProtocolType::Https),
            _ => Err(serde::de::Error::unknown_variant(
                &value,
                &["http", "https"],
            )),
        }
    }
}

/// Serde helpers for `DeviceType` in the v2 protocol.
///
/// The v2 protocol uses lowercase values (e.g. "desktop") on the wire.
/// Unknown values fall back to `Desktop` as required by the protocol (section 7.1).
pub(crate) mod device_type_v2 {
    use super::DeviceType;
    use serde::{Deserialize, Deserializer, Serializer};

    pub fn serialize<S: Serializer>(
        value: &Option<DeviceType>,
        serializer: S,
    ) -> Result<S::Ok, S::Error> {
        match value {
            Some(device_type) => serializer.serialize_str(match device_type {
                DeviceType::Mobile => "mobile",
                DeviceType::Desktop => "desktop",
                DeviceType::Web => "web",
                DeviceType::Headless => "headless",
                DeviceType::Server => "server",
            }),
            None => serializer.serialize_none(),
        }
    }

    pub fn deserialize<'de, D: Deserializer<'de>>(
        deserializer: D,
    ) -> Result<Option<DeviceType>, D::Error> {
        let value = Option::<String>::deserialize(deserializer)?;
        Ok(value.map(|value| match value.to_lowercase().as_str() {
            "mobile" => DeviceType::Mobile,
            "desktop" => DeviceType::Desktop,
            "web" => DeviceType::Web,
            "headless" => DeviceType::Headless,
            "server" => DeviceType::Server,
            _ => DeviceType::Desktop,
        }))
    }
}

/// Multicast announcement message for UDP discovery (v2.1).
///
/// Devices that receive an announcement respond over HTTP, so this message is
/// only ever an announcement and never a response.
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
    #[serde(
        default,
        with = "device_type_v2",
        skip_serializing_if = "Option::is_none"
    )]
    pub device_type: Option<DeviceType>,

    /// Fingerprint for device identification.
    /// In HTTPS mode: SHA-256 hash of the certificate.
    /// In HTTP mode: randomly generated string.
    pub fingerprint: String,

    /// Port number the device is listening on.
    pub port: u16,

    /// Protocol type (http or https).
    #[serde(with = "protocol_type_v2")]
    pub protocol: ProtocolType,

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
            protocol: ProtocolType::Https,
            download: true,
        };

        let json = serde_json::to_string(&msg).unwrap();
        assert!(json.contains("\"alias\":\"Nice Orange\""));
        assert!(json.contains("\"version\":\"2.1\""));
        assert!(json.contains("\"fingerprint\":\"random string\""));
        assert!(json.contains("\"download\":true"));
        assert!(json.contains("\"protocol\":\"https\""));
        assert!(json.contains("\"deviceType\":\"mobile\""));
    }

    #[test]
    fn test_multicast_message_deserialization() {
        let json = r#"{
            "alias": "Secret Banana",
            "version": "2.1",
            "deviceModel": "Windows",
            "deviceType": "desktop",
            "fingerprint": "random string",
            "port": 53317,
            "protocol": "https",
            "download": true
        }"#;

        let msg: MulticastMessageV2 = serde_json::from_str(json).unwrap();
        assert_eq!(msg.alias, "Secret Banana");
        assert_eq!(msg.version, "2.1");
        assert_eq!(msg.device_model, Some("Windows".to_string()));
        assert_eq!(msg.device_type, Some(DeviceType::Desktop));
        assert_eq!(msg.port, 53317);
        assert_eq!(msg.protocol, ProtocolType::Https);
        assert!(msg.download);
    }

    #[test]
    fn test_multicast_message_without_optional_fields() {
        let json = r#"{
            "alias": "Secret Banana",
            "version": "2.1",
            "fingerprint": "random string",
            "port": 53317,
            "protocol": "http"
        }"#;

        let msg: MulticastMessageV2 = serde_json::from_str(json).unwrap();
        assert_eq!(msg.device_model, None);
        assert_eq!(msg.device_type, None);
        assert_eq!(msg.protocol, ProtocolType::Http);
        assert!(!msg.download);
    }
}
