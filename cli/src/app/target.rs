use localsend::discovery::{HttpChannel, StatefulDevice};
use localsend::model::discovery::ProtocolType;
use localsend::multicast::DEFAULT_PORT;
use std::net::IpAddr;

#[derive(Clone, Debug, Eq, PartialEq)]
pub(super) enum TargetSelector {
    Alias(String),
    Ip(IpAddr),
}

impl TargetSelector {
    pub(super) fn parse(value: &str) -> anyhow::Result<Self> {
        let value = value.trim();
        anyhow::ensure!(!value.is_empty(), "Destination cannot be empty");
        Ok(match value.parse::<IpAddr>() {
            Ok(ip) => Self::Ip(ip),
            Err(_) => Self::Alias(value.to_string()),
        })
    }

    pub(super) fn direct_channel(&self) -> Option<HttpChannel> {
        let Self::Ip(ip) = self else {
            return None;
        };
        Some(HttpChannel {
            host: ip.to_string(),
            port: DEFAULT_PORT,
            protocol: ProtocolType::Https,
        })
    }

    pub(super) fn resolve(&self, devices: &[StatefulDevice]) -> Result<String, String> {
        let matching: Vec<&StatefulDevice> = devices
            .iter()
            .filter(|device| self.matches(device))
            .collect();
        match matching.as_slice() {
            [] => Err(format!("Destination {self} was not discovered")),
            [device] => Ok(device.device.fingerprint.clone()),
            devices => Err(format!(
                "Destination {self} is ambiguous ({} devices matched); use an IP address",
                devices.len()
            )),
        }
    }

    fn matches(&self, device: &StatefulDevice) -> bool {
        match self {
            Self::Alias(alias) => device.device.alias == *alias,
            Self::Ip(ip) => device.get_ranked_channels().into_iter().any(|channel| {
                channel.http().is_some_and(|http| {
                    http.host
                        .split('%')
                        .next()
                        .and_then(|host| host.parse::<IpAddr>().ok())
                        == Some(*ip)
                })
            }),
        }
    }
}

impl std::fmt::Display for TargetSelector {
    fn fmt(&self, formatter: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::Alias(alias) => write!(formatter, "alias {alias:?}"),
            Self::Ip(ip) => write!(formatter, "IP address {ip}"),
        }
    }
}

#[cfg(test)]
mod tests {
    use super::TargetSelector;
    use localsend::discovery::{
        ChannelStatus, DeviceChannel, DiscoveredDevice, HttpChannel, StatefulDevice,
    };
    use localsend::model::discovery::ProtocolType;
    use std::collections::HashMap;
    use std::net::{IpAddr, Ipv4Addr};

    fn device(alias: &str, fingerprint: &str, host: &str) -> StatefulDevice {
        let channel = DeviceChannel::Http(HttpChannel {
            host: host.to_string(),
            port: 53317,
            protocol: ProtocolType::Https,
        });
        StatefulDevice {
            device: DiscoveredDevice {
                alias: alias.to_string(),
                version: "2.2".to_string(),
                device_model: None,
                device_type: None,
                fingerprint: fingerprint.to_string(),
                channel: channel.clone(),
                download: false,
            },
            channels: HashMap::from([(channel, ChannelStatus::Available)]),
            logs: Vec::new(),
        }
    }

    #[test]
    fn parses_aliases_and_ip_addresses() {
        assert_eq!(
            TargetSelector::parse("Cute Tomato").unwrap(),
            TargetSelector::Alias("Cute Tomato".to_string())
        );
        assert_eq!(
            TargetSelector::parse("192.168.27.26").unwrap(),
            TargetSelector::Ip(IpAddr::V4(Ipv4Addr::new(192, 168, 27, 26)))
        );
    }

    #[test]
    fn rejects_an_empty_destination() {
        assert!(TargetSelector::parse("  ").is_err());
    }

    #[test]
    fn creates_a_direct_https_channel_for_an_ip() {
        let selector = TargetSelector::parse("192.168.27.26").unwrap();

        assert_eq!(
            selector.direct_channel(),
            Some(HttpChannel {
                host: "192.168.27.26".to_string(),
                port: 53317,
                protocol: ProtocolType::Https,
            })
        );
    }

    #[test]
    fn resolves_an_exact_alias() {
        let devices = vec![
            device("Cute Tomato", "windows", "192.168.27.26"),
            device("Wise Cherry", "linux", "192.168.27.33"),
        ];

        assert_eq!(
            TargetSelector::parse("Cute Tomato")
                .unwrap()
                .resolve(&devices),
            Ok("windows".to_string())
        );
    }

    #[test]
    fn resolves_an_ip_address() {
        let devices = vec![device("Cute Tomato", "windows", "192.168.27.26")];

        assert_eq!(
            TargetSelector::parse("192.168.27.26")
                .unwrap()
                .resolve(&devices),
            Ok("windows".to_string())
        );
    }

    #[test]
    fn rejects_an_ambiguous_alias() {
        let devices = vec![
            device("Cute Tomato", "first", "192.168.27.26"),
            device("Cute Tomato", "second", "192.168.27.27"),
        ];

        assert!(
            TargetSelector::parse("Cute Tomato")
                .unwrap()
                .resolve(&devices)
                .unwrap_err()
                .contains("ambiguous")
        );
    }

    #[test]
    fn rejects_a_destination_that_was_not_discovered() {
        let devices = vec![device("Wise Cherry", "linux", "192.168.27.33")];

        assert!(
            TargetSelector::parse("Cute Tomato")
                .unwrap()
                .resolve(&devices)
                .unwrap_err()
                .contains("was not discovered")
        );
    }
}
