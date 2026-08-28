//! The headless `send --to` mode: discover the destination, send the files,
//! exit with the transfer result. There is no keyboard and no overlay — only
//! the network events a send needs are handled, and incoming transfer
//! requests are declined.

use super::sending::{self, SendState};
use super::status;
use super::target::TargetSelector;
use super::{AppEvent, Network, discovery, spawn_staged_discovery, start_network, stop_network};
use crate::sanitize;
use crate::storage::Repository;
use crate::ui::{Category, Ui};
use crate::util;
use localsend::discovery::{DiscoveryEvent, DiscoveryHandle};
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2};
use std::path::PathBuf;
use std::sync::Arc;
use std::sync::atomic::Ordering;
use std::time::Duration;
use tokio::sync::mpsc;

pub(super) async fn run(
    mut storage: Repository,
    target: TargetSelector,
    paths: Vec<PathBuf>,
) -> anyhow::Result<()> {
    let mut ui = Ui::new();
    let identity = storage.identity.clone();
    let (events_tx, mut events_rx) = mpsc::channel::<AppEvent>(64);
    let Network {
        server,
        server_stop_tx,
        server_tx: _,
        mut server_rx,
        discovery,
        mut discovery_rx,
        discovery_stop_tx,
    } = start_network(&identity).await?;

    // Probe the destination's address directly when `--to` is an IP.
    let mut known_channels = storage.paired.known_http_channels();
    if let Some(channel) = target.direct_channel()
        && !known_channels.contains(&channel)
    {
        known_channels.insert(0, channel);
    }
    spawn_staged_discovery(
        discovery.clone(),
        events_tx.clone(),
        known_channels,
        identity.port,
    );
    ui.log_plain(&format!("Discovering destination {target}..."));

    let mut tick = tokio::time::interval(Duration::from_millis(250));
    tick.set_missed_tick_behavior(tokio::time::MissedTickBehavior::Skip);

    let mut send: Option<SendState> = None;
    let result = loop {
        let event = tokio::select! {
            Some(event) = events_rx.recv() => event,
            Some(event) = server_rx.recv() => AppEvent::Server(event),
            Some(event) = discovery_rx.recv() => AppEvent::Discovery(event),
            _ = tick.tick() => AppEvent::Tick,
        };
        match event {
            AppEvent::Server(event) => {
                handle_server_event(&mut ui, &storage, &discovery, &mut send, event)
            }
            AppEvent::Discovery(event) => {
                handle_discovery(&mut ui, &mut storage, &discovery, event)
            }
            AppEvent::Tick => render_progress(&mut ui, &mut send),
            AppEvent::Log { category, text } => ui.log(category, &text),
            AppEvent::DiscoveryFinished => {
                match start_send(
                    &mut ui,
                    &storage,
                    &discovery,
                    &target,
                    paths.clone(),
                    &events_tx,
                ) {
                    Ok(state) => send = Some(state),
                    Err(reason) => break Err(anyhow::anyhow!(reason)),
                }
            }
            AppEvent::SendSessionStarted {
                session_id,
                accepted_bytes,
            } => {
                if let Some(send) = &mut send {
                    send.session_id = Some(session_id);
                    send.total_bytes = accepted_bytes;
                }
            }
            AppEvent::SendEnded { success } => {
                break match success {
                    true => Ok(()),
                    false => Err(anyhow::anyhow!("Transfer failed")),
                };
            }
            // No keyboard, no accepted receive sessions and no web links in
            // this mode.
            AppEvent::Key(_) | AppEvent::ReceiveFileResult { .. } | AppEvent::Web(_) => {}
        }
    };
    ui.set_status(None);
    stop_network(&server, Some(server_stop_tx), &discovery, discovery_stop_tx).await;
    result
}

/// Resolves the destination among the discovered devices and spawns the send
/// task towards it.
fn start_send(
    ui: &mut Ui,
    storage: &Repository,
    discovery: &DiscoveryHandle,
    target: &TargetSelector,
    paths: Vec<PathBuf>,
    events_tx: &mpsc::Sender<AppEvent>,
) -> Result<SendState, String> {
    let fingerprint = target.resolve(&discovery.devices())?;
    let device = discovery
        .device_by_fingerprint(&fingerprint)
        .ok_or_else(|| format!("Destination {target} was not discovered"))?;
    sending::spawn_send(
        ui,
        storage.identity.clone(),
        device,
        paths,
        events_tx.clone(),
    )
}

fn handle_server_event(
    ui: &mut Ui,
    storage: &Repository,
    discovery: &Arc<DiscoveryHandle>,
    send: &mut Option<SendState>,
    event: ServerEventV2,
) {
    match event {
        // Peers answer the startup announcement by registering here; this is
        // how the destination usually enters the device store.
        ServerEventV2::Register { ip, info } => {
            discovery::device_confirmed(
                discovery,
                &storage.identity.fingerprint,
                ip.to_string(),
                info,
            );
        }
        ServerEventV2::PrepareUpload {
            info, decision_tx, ..
        } => {
            // Receiving needs the interactive Y/N prompt; decline instead of
            // leaving the sender hanging.
            let _ = decision_tx.send(PrepareUploadDecisionV2::Decline);
            ui.log(
                Category::Receive,
                &format!(
                    "{}: Declined the incoming request (busy sending)",
                    sanitize::single_line(&info.alias)
                ),
            );
        }
        ServerEventV2::CancelReceived { ip, session_id } => {
            if let Some(send) = send
                && send.session_id.as_deref() == Some(session_id.as_str())
                && send.host == ip.to_string()
            {
                send.cancel.by_peer.store(true, Ordering::Relaxed);
                send.cancel.token.cancel();
            }
        }
        ServerEventV2::ListenerFailed { error } => {
            ui.log(Category::Receive, &format!("Server stopped: {error}"));
        }
        // No receive session is ever accepted; dropping the responders
        // rejects the requests.
        ServerEventV2::FileUpload { .. }
        | ServerEventV2::SessionEnd { .. }
        | ServerEventV2::PrepareUploadAborted { .. } => {}
    }
}

fn handle_discovery(
    ui: &mut Ui,
    storage: &mut Repository,
    discovery: &DiscoveryHandle,
    event: DiscoveryEvent,
) {
    let device = match &event {
        DiscoveryEvent::Discovered { device } | DiscoveryEvent::Updated { device } => device,
        DiscoveryEvent::MulticastFailed => {
            ui.log(
                Category::Discovery,
                "Multicast stopped, no longer hearing announcements",
            );
            return;
        }
    };
    discovery::refresh_paired_channels(ui, &mut storage.paired, discovery, &device.fingerprint);

    let DiscoveryEvent::Discovered { device } = event else {
        // Re-confirmations update the store silently.
        return;
    };
    let host = device
        .http()
        .map(|http| http.host.as_str())
        .unwrap_or("unknown address");
    ui.log(
        Category::Discovery,
        &format!("{} ({host})", sanitize::single_line(&device.alias)),
    );
}

/// The status line: the progress bar of the running transfer.
fn render_progress(ui: &mut Ui, send: &mut Option<SendState>) {
    let Some(send) = send else {
        ui.set_status(None);
        return;
    };
    let done = send.sent.load(Ordering::Relaxed);
    let speed = send.speed.update(done);
    let width = util::terminal_width().saturating_sub(1);
    ui.set_status(Some(status::transfer_status(
        Category::Send,
        &send.alias,
        done,
        send.total_bytes,
        speed,
        width,
    )));
}
