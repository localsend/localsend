mod devices;
mod discovery;
mod receive;
mod sending;
mod status;

use crate::Args;
use crate::device_list::DeviceList;
use crate::devices::DeviceRegistry;
use crate::picker::Picker;
use crate::storage;
use crate::ui::{Category, Ui};
use crossterm::event::{Event, KeyCode, KeyEvent, KeyEventKind, KeyModifiers};
use localsend::http::dto_v2::ProtocolTypeV2;
use localsend::http::server::v2::ServerEventV2;
use localsend::http::server::{ServerConfigV2, ServerHandle, start_with_port};
use localsend::multicast::{
    self, DEFAULT_MULTICAST_GROUP, DEFAULT_MULTICAST_GROUP_V6, DEFAULT_PORT, InterfaceFilter,
    MulticastConfig, MulticastEvent,
};
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

    /// A device was confirmed reachable (it registered with us, or it
    /// announced itself and answered our register request).
    DeviceUp {
        alias: String,
        host: String,
        port: u16,
        protocol: ProtocolTypeV2,
        fingerprint: String,
    },

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
    registry: DeviceRegistry,

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

    // HTTP server (always TLS, like the app).
    let (server_tx, mut server_rx) = mpsc::channel::<ServerEventV2>(16);
    let (server_stop_tx, server_stop_rx) = oneshot::channel::<()>();
    let server = start_with_port(
        identity.port,
        Some(identity.tls_config()),
        identity.client_info(),
        None,
        Some(ServerConfigV2 {
            pin: None,
            event_tx: server_tx,
        }),
        None,
        server_stop_rx,
    )
    .await?;
    let server = Arc::new(server);

    // Multicast discovery. Failure is not fatal: transfers to this device
    // still work for peers that know its address.
    let (multicast_tx, multicast_rx) = mpsc::channel::<MulticastEvent>(16);
    let (multicast_stop_tx, multicast_stop_rx) = oneshot::channel::<()>();
    let multicast = multicast::start(
        MulticastConfig {
            group: DEFAULT_MULTICAST_GROUP,
            group_v6: Some(DEFAULT_MULTICAST_GROUP_V6),
            port: DEFAULT_PORT,
            interface_filter: InterfaceFilter::default(),
            device: identity.multicast_device(),
            event_tx: multicast_tx,
        },
        multicast_stop_rx,
    )
    .await;
    let multicast = match multicast {
        Ok(handle) => Some(Arc::new(handle)),
        Err(err) => {
            eprintln!("Multicast discovery unavailable: {err:#}");
            None
        }
    };
    let mut multicast_rx = multicast.is_some().then_some(multicast_rx);
    if let Some(handle) = &multicast {
        // Announce this device; peers answer with an HTTP register request.
        let handle = handle.clone();
        tokio::spawn(async move { handle.announce().await });
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
        server: server.clone(),
        registry: DeviceRegistry::new(),
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
        true => app.ui.log_plain(&crate::banner::render(&app.storage)),
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
            Some(event) = recv_opt(&mut multicast_rx) => {
                app.handle_multicast(event);
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
    let _ = server_stop_tx.send(());
    let _ = multicast_stop_tx.send(());
    let _ = tokio::time::timeout(Duration::from_secs(1), server.wait_stopped()).await;
    if let Some(multicast) = &multicast {
        let _ = tokio::time::timeout(Duration::from_secs(1), multicast.wait_stopped()).await;
    }
    Ok(())
}

/// Receives from an optional channel, pending forever when there is none.
async fn recv_opt<T>(rx: &mut Option<mpsc::Receiver<T>>) -> Option<T> {
    match rx {
        Some(rx) => rx.recv().await,
        None => std::future::pending().await,
    }
}

impl App {
    /// Handles an event; returns `true` when the application should quit.
    async fn handle_event(&mut self, event: AppEvent) -> bool {
        match event {
            AppEvent::Key(key) => return self.handle_key(key),
            AppEvent::DeviceUp {
                alias,
                host,
                port,
                protocol,
                fingerprint,
            } => self.device_up(alias, host, port, protocol, fingerprint),
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

    fn handle_key(&mut self, key: KeyEvent) -> bool {
        if key.code == KeyCode::Char('c') && key.modifiers.contains(KeyModifiers::CONTROL) {
            return self.handle_ctrl_c();
        }

        // While the picker or the device list is open it consumes every key.
        if self.picker.is_some() {
            self.handle_picker_key(key);
            return false;
        }
        if self.device_list.is_some() {
            return self.handle_device_list_key(key);
        }

        if let KeyCode::Char(c) = key.code {
            match c.to_ascii_lowercase() {
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
