use crate::frb_generated::StreamSink;
use flutter_rust_bridge::frb;
use localsend::model::discovery::DeviceType;
pub use localsend::model::discovery::{MulticastMessageV2, ProtocolTypeV2};
use localsend::multicast::{
    DEFAULT_MULTICAST_GROUP_V6, InterfaceFilter, MulticastConfig, MulticastDevice, MulticastEvent,
    MulticastHandle,
};
use tokio::sync::{Mutex, mpsc, oneshot};

/// Another device announced itself via UDP multicast.
///
/// The peer expects to be answered with an HTTP register request.
pub struct RsMulticastDiscovered {
    /// The address the announcement was sent from. The peer's HTTP server is
    /// reachable at this address on `message.port`.
    ///
    /// A link-local IPv6 source carries its interface scope as `fe80::1%3`,
    /// which the Rust HTTP client accepts back as a host.
    pub ip: String,

    /// The announcement as it was received.
    pub message: MulticastMessageV2,
}

pub struct RsMulticast {
    handle: MulticastHandle,
    event_rx: Mutex<Option<mpsc::Receiver<MulticastEvent>>>,
    stop_tx: Mutex<Option<oneshot::Sender<()>>>,
}

/// Starts UDP multicast discovery: binds the multicast sockets on all usable
/// network interfaces and listens for announcements of other devices.
///
/// Announcements are sent to the IPv4 [group] and, as a LocalSend extension,
/// to the (currently hardcoded) IPv6 group `ff12::fd3a:e420`.
///
/// [port] is used both to bind the multicast sockets and as the HTTP server
/// port announced to other devices.
///
/// Nothing is announced until [RsMulticast::announce] is called.
///
/// Fails when [group] is not a valid IPv4 address or when no network
/// interface could be used at all.
pub async fn start_multicast(
    group: String,
    port: u16,
    network_whitelist: Option<Vec<String>>,
    network_blacklist: Option<Vec<String>>,
    alias: String,
    version: String,
    device_model: Option<String>,
    device_type: Option<DeviceType>,
    fingerprint: String,
    protocol: ProtocolTypeV2,
    download: bool,
) -> anyhow::Result<RsMulticast> {
    let group = group
        .parse()
        .map_err(|_| anyhow::anyhow!("Invalid multicast group: {group}"))?;

    let (event_tx, event_rx) = mpsc::channel::<MulticastEvent>(16);
    let (stop_tx, stop_rx) = oneshot::channel::<()>();

    let handle = localsend::multicast::start(
        MulticastConfig {
            group,
            // Hardcoded for now; becomes a parameter once the app exposes it.
            group_v6: Some(DEFAULT_MULTICAST_GROUP_V6),
            port,
            interface_filter: InterfaceFilter {
                whitelist: network_whitelist,
                blacklist: network_blacklist,
            },
            device: MulticastDevice {
                alias,
                version,
                device_model,
                device_type,
                fingerprint,
                port,
                protocol,
                download,
            },
            event_tx,
        },
        stop_rx,
    )
    .await?;

    Ok(RsMulticast {
        handle,
        event_rx: Mutex::new(Some(event_rx)),
        stop_tx: Mutex::new(Some(stop_tx)),
    })
}

impl RsMulticast {
    /// Emits a [RsMulticastDiscovered] for every announcement received from
    /// another device until discovery is stopped.
    /// Can only be listened to once.
    pub async fn listen(&self, sink: StreamSink<RsMulticastDiscovered>) {
        let Some(mut event_rx) = self.event_rx.lock().await.take() else {
            let _ = sink.add_error(anyhow::anyhow!("Multicast events already listened to"));
            return;
        };

        while let Some(event) = event_rx.recv().await {
            let MulticastEvent::Discovered {
                ip,
                scope_id,
                message,
            } = event;

            let _ = sink.add(RsMulticastDiscovered {
                ip: match scope_id {
                    // A link-local source is unreachable without its scope.
                    Some(scope_id) => format!("{ip}%{scope_id}"),
                    None => ip.to_string(),
                },
                message,
            });
        }
    }

    /// Announces this device to the network, which makes every other LocalSend
    /// device on it register with this device over HTTP.
    ///
    /// Returns once the whole announcement burst has been sent, which takes a
    /// few seconds, or immediately once discovery has been stopped.
    pub async fn announce(&self) {
        self.handle.announce().await;
    }

    /// Stops discovery, which also ends the [RsMulticast::listen] stream.
    /// Returns after all sockets are closed, so the port can be bound again.
    pub async fn stop(&self) {
        if let Some(stop_tx) = self.stop_tx.lock().await.take() {
            let _ = stop_tx.send(());
            self.handle.wait_stopped().await;
        }
    }
}

#[frb(mirror(MulticastMessageV2))]
pub struct _MulticastMessageV2 {
    pub alias: String,
    pub version: String,
    pub device_model: Option<String>,
    pub device_type: Option<DeviceType>,
    pub fingerprint: String,
    pub port: u16,
    pub protocol: ProtocolTypeV2,
    pub download: bool,
}
