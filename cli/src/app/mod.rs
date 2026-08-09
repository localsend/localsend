mod devices;
mod discovery;
mod receive;
mod sending;
mod status;
mod web_link;

use crate::Args;
use crate::device_list::DeviceList;
use crate::picker::Picker;
use crate::slots::Slots;
use crate::storage;
use crate::ui::{Category, Ui};
use crossterm::event::{Event, KeyCode, KeyEvent, KeyEventKind, KeyModifiers};
use localsend::discovery::{
    DEFAULT_DISCOVERY_TIMEOUT, DeviceIdentity, DiscoveryConfig, DiscoveryEvent, DiscoveryHandle,
};
use localsend::http::server::v2::ServerEventV2;
use localsend::http::server::web::WebSendEvent;
use localsend::http::server::{ServerConfigV2, ServerHandle, start_with_port};
use localsend::model::discovery::ProtocolType;
use localsend::multicast::{DEFAULT_MULTICAST_GROUP, DEFAULT_MULTICAST_GROUP_V6, DEFAULT_PORT};
use localsend::util::interface::{InterfaceFilter, local_interface_addresses};
use receive::{Answer, PendingReceive, ReceiveSession};
use sending::SendState;
use std::path::PathBuf;
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::{mpsc, oneshot};

/// Events processed by the central application loop.
pub enum AppEvent {
    /// A key was pressed.
    Key(KeyEvent),

    /// A file of the active receive session finished (or failed).
    ReceiveFileResult {
        session_id: String,
        file_id: String,
        result: Result<(), String>,
    },

    /// The send task created its upload session.
    SendSessionStarted {
        session_id: String,
        accepted_bytes: u64,
    },

    /// The send task ended (successfully or not).
    SendEnded,

    /// A log line produced by a background task.
    Log { category: Category, text: String },
}

struct App {
    ui: Ui,
    server: Arc<ServerHandle>,

    /// Stops the running server. Consumed on shutdown and whenever the server
    /// is restarted for the web share toggle.
    server_stop_tx: Option<oneshot::Sender<()>>,

    /// Event senders handed to every (re)started server, so the receivers in
    /// [run]'s select loop survive server restarts.
    server_tx: mpsc::Sender<ServerEventV2>,
    web_tx: mpsc::Sender<WebSendEvent>,

    /// The active web link mode ("share via link" / "receive via link");
    /// `Some` while the server runs in plain-HTTP mode for browsers.
    web: Option<web_link::WebMode>,

    /// Whether the previously pressed key was `W`, the first half of the
    /// W+S / W+R chords toggling the web links.
    chord_w: bool,

    /// The core discovery: the store of confirmed devices, and the multicast
    /// side when it could be started.
    discovery: Arc<DiscoveryHandle>,

    /// The hotkeys (1-9) of the devices in the discovery store.
    slots: Slots,

    /// Config, identity and paired devices, see [`storage::Repository`].
    storage: storage::Repository,

    pending: Option<PendingReceive>,
    receive: Option<ReceiveSession>,
    send: Option<SendState>,
    picker: Option<Picker>,
    device_list: Option<DeviceList>,

    /// Files given via `-f`/`--file`; sending uses these instead of the picker.
    preselected: Vec<PathBuf>,

    events_tx: mpsc::Sender<AppEvent>,
}

pub async fn run(args: Args) -> anyhow::Result<()> {
    for path in &args.file {
        anyhow::ensure!(path.is_file(), "Not a file: {}", path.display());
    }
    let storage = storage::Repository::load(&args)?;
    let identity = storage.identity.clone();
    let (events_tx, mut events_rx) = mpsc::channel::<AppEvent>(64);

    // HTTP server (TLS, like the app, until "share via link" drops it).
    let (server_tx, mut server_rx) = mpsc::channel::<ServerEventV2>(16);
    let (web_tx, mut web_rx) = mpsc::channel::<WebSendEvent>(16);
    let (server_stop_tx, server_stop_rx) = oneshot::channel::<()>();
    let server = start_with_port(
        identity.port,
        Some(identity.tls_config()),
        identity.client_info(),
        None,
        Some(ServerConfigV2 {
            pin: None,
            verify_checksums: true,
            event_tx: server_tx.clone(),
        }),
        None,
        server_stop_rx,
    )
    .await?;
    let server = Arc::new(server);

    // Discovery: multicast, plus the register requests answering other
    // devices' announcements. Multicast failure is not fatal: the store keeps
    // collecting the devices that contact this device over HTTP.
    let (discovery_tx, mut discovery_rx) = mpsc::channel::<DiscoveryEvent>(16);
    let (discovery_stop_tx, discovery_stop_rx) = oneshot::channel::<()>();
    let discovery = Arc::new(
        localsend::discovery::start(
            DiscoveryConfig {
                group: DEFAULT_MULTICAST_GROUP,
                group_v6: Some(DEFAULT_MULTICAST_GROUP_V6),
                port: DEFAULT_PORT,
                interface_filter: InterfaceFilter::default(),
                device: identity.multicast_device(),
                identity: DeviceIdentity {
                    cert_pem: identity.cert_pem.clone(),
                    private_key_pem: identity.key_pem.clone(),
                },
                timeout: DEFAULT_DISCOVERY_TIMEOUT,
                event_tx: Some(discovery_tx),
            },
            discovery_stop_rx,
        )
        .await,
    );
    if let Some(err) = discovery.multicast_error() {
        eprintln!("Multicast unavailable: {err:#}");
    }
    {
        // Discover in stages: announce this device (peers answer with an HTTP
        // register request), probe the paired devices' stored addresses, and
        // fall back to scanning the local subnets when nothing was confirmed.
        let discovery = discovery.clone();
        let events_tx = events_tx.clone();
        let port = identity.port;
        let known_channels = storage.paired.known_http_channels();
        let interface_ips =
            local_interface_addresses(&InterfaceFilter::default()).unwrap_or_default();
        tokio::spawn(async move {
            let result = discovery
                .discover_staged(
                    known_channels,
                    interface_ips,
                    port,
                    ProtocolType::Https,
                    Duration::from_secs(1),
                )
                .await;
            if let Err(err) = result {
                let _ = events_tx
                    .send(AppEvent::Log {
                        category: Category::Discovery,
                        text: format!("Discovery failed: {err}"),
                    })
                    .await;
            }
        });
    }

    crossterm::terminal::enable_raw_mode()?;

    // Keyboard reader. The blocking thread ends with the process.
    std::thread::spawn({
        let events_tx = events_tx.clone();
        move || {
            loop {
                match crossterm::event::read() {
                    Ok(Event::Key(key)) if key.kind == KeyEventKind::Press => {
                        if events_tx.blocking_send(AppEvent::Key(key)).is_err() {
                            return;
                        }
                    }
                    Ok(_) => {}
                    Err(_) => return,
                }
            }
        }
    });

    let mut app = App {
        ui: Ui::new(),
        server,
        server_stop_tx: Some(server_stop_tx),
        server_tx,
        web_tx,
        web: None,
        chord_w: false,
        discovery: discovery.clone(),
        slots: Slots::new(),
        storage,
        pending: None,
        receive: None,
        send: None,
        picker: None,
        device_list: None,
        preselected: args.file,
        events_tx: events_tx.clone(),
    };

    match app.preselected.is_empty() {
        true => app
            .ui
            .log_plain(&crate::banner::render(&app.storage, &app.server)),
        false => app.open_device_list(),
    }

    let mut tick = tokio::time::interval(Duration::from_millis(250));
    tick.set_missed_tick_behavior(tokio::time::MissedTickBehavior::Skip);

    let mut quit = false;
    while !quit {
        tokio::select! {
            Some(event) = events_rx.recv() => {
                quit = app.handle_event(event).await;
            }
            Some(event) = server_rx.recv() => {
                app.handle_server_event(event);
            }
            Some(event) = web_rx.recv() => {
                app.handle_web_event(event);
            }
            Some(event) = discovery_rx.recv() => {
                app.handle_discovery(event);
            }
            _ = tick.tick() => {
                app.tick();
            }
        }
    }

    // Shutdown: leave a possibly open modal, restore the terminal, stop the
    // network tasks (briefly, so the ports are released cleanly).
    if let Some(picker) = app.picker.take() {
        picker.close();
        app.ui.resume();
    }
    app.close_device_list();
    app.ui.set_status(None);
    let _ = crossterm::terminal::disable_raw_mode();
    if let Some(stop_tx) = app.server_stop_tx.take() {
        let _ = stop_tx.send(());
    }
    let _ = discovery_stop_tx.send(());
    let _ = tokio::time::timeout(Duration::from_secs(1), app.server.wait_stopped()).await;
    let _ = tokio::time::timeout(Duration::from_secs(1), discovery.wait_stopped()).await;
    Ok(())
}

impl App {
    /// Handles an event; returns `true` when the application should quit.
    async fn handle_event(&mut self, event: AppEvent) -> bool {
        match event {
            AppEvent::Key(key) => return self.handle_key(key).await,
            AppEvent::ReceiveFileResult {
                session_id,
                file_id,
                result,
            } => self.receive_file_result(session_id, file_id, result),
            AppEvent::SendSessionStarted {
                session_id,
                accepted_bytes,
            } => {
                if let Some(send) = &mut self.send {
                    send.session_id = Some(session_id);
                    send.total_bytes = accepted_bytes;
                }
            }
            AppEvent::SendEnded => {
                self.send = None;
                self.render_status();
                // In `--file` mode the transfer is the whole program.
                return !self.preselected.is_empty();
            }
            AppEvent::Log { category, text } => self.ui.log(category, &text),
        }
        false
    }

    async fn handle_key(&mut self, key: KeyEvent) -> bool {
        if key.code == KeyCode::Char('c') && key.modifiers.contains(KeyModifiers::CONTROL) {
            self.chord_w = false;
            return self.handle_ctrl_c();
        }

        // While the picker or the device list is open it consumes every key.
        if self.picker.is_some() {
            self.handle_picker_key(key).await;
            return false;
        }
        if self.device_list.is_some() {
            return self.handle_device_list_key(key);
        }

        if let KeyCode::Char(c) = key.code {
            let chord_w = std::mem::replace(&mut self.chord_w, false);
            match c.to_ascii_lowercase() {
                's' if chord_w => self.toggle_web_share().await,
                'r' if chord_w => self.toggle_web_receive().await,
                'w' => self.chord_w = true,
                'y' => self.answer_pending(Answer::Accept),
                'n' => self.answer_pending(Answer::Decline),
                'p' => self.answer_pending(Answer::AcceptAndPair),
                'd' => self.open_device_list(),
                '1'..='9' => self.start_picking(c as u8 - b'0'),
                _ => {}
            }
        }
        false
    }

    /// Cancels the current activity: the open modal, the pending request and
    /// the active transfers. Returns `true` (quit) only when there was
    /// nothing to cancel.
    fn handle_ctrl_c(&mut self) -> bool {
        if let Some(picker) = self.picker.take() {
            picker.close();
            self.ui.resume();
            return false;
        }
        if self.device_list.is_some() {
            self.close_device_list();
            // In `--file` mode the device list is the whole program.
            return !self.preselected.is_empty();
        }
        let mut cancelled = false;
        if self.pending.is_some() {
            self.answer_pending(Answer::Decline);
            cancelled = true;
        }
        if let Some(send) = &self.send {
            // The send task notices the token, notifies the receiver and
            // reports back via [AppEvent::SendEnded].
            send.cancel.token.cancel();
            cancelled = true;
        }
        if self.receive.is_some() {
            self.cancel_receive();
            cancelled = true;
        }
        !cancelled
    }
}
