use localsend::http::dto_v2::ProtocolTypeV2;

/// A discovered LocalSend device.
#[derive(Clone)]
pub struct Device {
    /// The hotkey (1-9) assigned to this device, if one was free.
    pub slot: Option<u8>,
    pub alias: String,

    /// The host to dial the device at: an IP address, or the scoped form
    /// `fe80::1%3` for link-local IPv6 (the HTTP client accepts both).
    pub host: String,
    pub port: u16,
    pub protocol: ProtocolTypeV2,
    pub fingerprint: String,
}

impl Device {
    pub fn slot_label(&self) -> String {
        match self.slot {
            Some(slot) => slot.to_string(),
            None => "-".to_string(),
        }
    }
}

/// All devices seen in this run, identified by fingerprint.
pub struct DeviceRegistry {
    devices: Vec<Device>,
}

impl DeviceRegistry {
    pub fn new() -> Self {
        Self {
            devices: Vec::new(),
        }
    }

    /// Adds or updates a device. Returns the device only when it is new
    /// (i.e. should be logged): a known device is updated silently, because
    /// multi-homed peers re-announce with a different address all the time.
    pub fn upsert(
        &mut self,
        alias: String,
        host: String,
        port: u16,
        protocol: ProtocolTypeV2,
        fingerprint: String,
    ) -> Option<Device> {
        if let Some(device) = self
            .devices
            .iter_mut()
            .find(|device| device.fingerprint == fingerprint)
        {
            device.alias = alias;
            device.host = host;
            device.port = port;
            device.protocol = protocol;
            return None;
        }

        let slot =
            (1..=9u8).find(|slot| !self.devices.iter().any(|device| device.slot == Some(*slot)));
        let device = Device {
            slot,
            alias,
            host,
            port,
            protocol,
            fingerprint,
        };
        self.devices.push(device.clone());
        Some(device)
    }

    pub fn by_slot(&self, slot: u8) -> Option<&Device> {
        self.devices.iter().find(|device| device.slot == Some(slot))
    }

    pub fn by_fingerprint(&self, fingerprint: &str) -> Option<&Device> {
        self.devices
            .iter()
            .find(|device| device.fingerprint == fingerprint)
    }

    /// All devices in discovery order.
    pub fn devices(&self) -> &[Device] {
        &self.devices
    }
}
