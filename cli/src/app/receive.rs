//! The receiving side: incoming transfer requests, the Y/N/P decision and the
//! active receive session.

use super::App;
use super::web_link::WebMode;
use crate::sanitize;
use crate::ui::Category;
use crate::util::{self, SpeedMeter};
use localsend::http::client::v2::LsHttpClientV2;
use localsend::http::server::common::save::FileUploadTarget;
use localsend::http::server::v2::{PrepareUploadDecisionV2, ServerEventV2, SessionEndReasonV2};
use localsend::model::discovery::ProtocolType;
use localsend::model::transfer::FileDto;
use std::collections::{HashMap, HashSet};
use std::sync::Arc;
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::{Duration, Instant};
use tokio::sync::{mpsc, oneshot};

/// Where to reach the device a receive session originates from, so a
/// receiver-side cancel can be delivered back to it over HTTP.
#[derive(Clone)]
pub(super) struct SenderTarget {
    pub(super) host: String,
    pub(super) port: u16,
    pub(super) protocol: ProtocolType,
    pub(super) fingerprint: String,
}

/// An incoming transfer request waiting for the user's Y/N/P decision.
pub(super) struct PendingReceive {
    pub(super) session_id: String,
    pub(super) alias: String,
    pub(super) sender: SenderTarget,
    pub(super) files: HashMap<String, FileDto>,
    pub(super) decision_tx: oneshot::Sender<PrepareUploadDecisionV2>,
}

/// An accepted upload session that is being received.
pub(super) struct ReceiveSession {
    pub(super) session_id: String,
    pub(super) alias: String,
    pub(super) sender: SenderTarget,
    pub(super) files: HashMap<String, FileDto>,
    pub(super) total_bytes: u64,
    pub(super) finished_files: usize,
    pub(super) failed_files: usize,
    pub(super) finalized_bytes: u64,
    pub(super) in_progress: HashMap<String, Arc<AtomicU64>>,
    pub(super) started: Instant,
    pub(super) speed: SpeedMeter,

    /// Set when the server reported the end of the session. The summary is
    /// deferred until the in-flight per-file results have all arrived.
    pub(super) ended: Option<SessionEndReasonV2>,
}

impl ReceiveSession {
    fn new(
        session_id: String,
        alias: String,
        sender: SenderTarget,
        files: HashMap<String, FileDto>,
    ) -> Self {
        let total_bytes = files.values().map(|file| file.size).sum();
        Self {
            session_id,
            alias,
            sender,
            files,
            total_bytes,
            finished_files: 0,
            failed_files: 0,
            finalized_bytes: 0,
            in_progress: HashMap::new(),
            started: Instant::now(),
            speed: SpeedMeter::new(),
            ended: None,
        }
    }

    pub(super) fn done_bytes(&self) -> u64 {
        self.finalized_bytes
            + self
                .in_progress
                .values()
                .map(|progress| progress.load(Ordering::Relaxed))
                .sum::<u64>()
    }
}

/// Returns the text of a "message request": a single text file whose content
/// is already included as a preview, so there is nothing left to transfer.
fn message_of(files: &HashMap<String, FileDto>) -> Option<&str> {
    if files.len() != 1 {
        return None;
    }
    let file = files.values().next()?;
    if file.file_type != "text" && !file.file_type.starts_with("text/") {
        return None;
    }
    file.preview.as_deref()
}

/// Maximum number of files listed in an incoming request prompt.
const MAX_LISTED_FILES: usize = 20;

/// The user's decision on a [`PendingReceive`].
#[derive(Debug, PartialEq)]
pub(super) enum Answer {
    Accept,
    Decline,
    AcceptAndPair,
}

impl App {
    pub(super) fn handle_server_event(&mut self, event: ServerEventV2) {
        match event {
            ServerEventV2::Register { ip, info } => {
                self.device_confirmed(ip.to_string(), info);
            }
            ServerEventV2::PrepareUpload {
                session_id,
                ip,
                info,
                cert_fingerprint,
                files,
                decision_tx,
            } => {
                // The sender is clearly reachable; make sure it has a slot.
                self.device_confirmed(ip.to_string(), info.clone());

                let alias = sanitize::single_line(&info.alias);
                if let Some(message) = message_of(&files) {
                    // Nothing to transfer: the text is the request. Accepting
                    // no file ends the session right away.
                    let _ = decision_tx.send(PrepareUploadDecisionV2::Accept(HashSet::new()));
                    self.ui.log(
                        Category::Receive,
                        &format!("{alias}: Message received\n{}", sanitize::multi_line(message)),
                    );
                    return;
                }

                let sender = SenderTarget {
                    host: ip.to_string(),
                    port: info.port,
                    protocol: info.protocol,
                    fingerprint: cert_fingerprint.unwrap_or_else(|| info.fingerprint.clone()),
                };

                if self.storage.paired.contains(&sender.fingerprint) {
                    let ids: HashSet<String> = files.keys().cloned().collect();
                    if decision_tx
                        .send(PrepareUploadDecisionV2::Accept(ids))
                        .is_ok()
                    {
                        // Nothing to confirm: the progress bar and the summary
                        // are the whole story for an auto-accepted request.
                        self.receive = Some(ReceiveSession::new(session_id, alias, sender, files));
                    }
                } else {
                    let total: u64 = files.values().map(|file| file.size).sum();
                    let mut lines = vec![
                        alias.clone(),
                        format!("\nFiles ({}, {}):", files.len(), util::format_bytes(total)),
                    ];
                    let mut sorted: Vec<&FileDto> = files.values().collect();
                    sorted.sort_by_key(|file| std::cmp::Reverse(file.size));
                    for file in sorted.iter().take(MAX_LISTED_FILES) {
                        lines.push(format!(
                            "  {} ({})",
                            sanitize::single_line(&file.file_name),
                            util::format_bytes(file.size)
                        ));
                    }
                    if sorted.len() > MAX_LISTED_FILES {
                        lines.push(format!(
                            "  ... and {} more",
                            sorted.len() - MAX_LISTED_FILES
                        ));
                    }
                    // Web senders have no stable identity worth pairing: the
                    // fingerprint is an unverified payload value.
                    let prompt = match self.web {
                        Some(WebMode::Receive) => "\nAccept? Y/N",
                        _ => "\nAccept? Y/N/P (P = accept and pair)",
                    };
                    lines.push(prompt.to_string());
                    self.ui.log(Category::Receive, &lines.join("\n"));
                    self.pending = Some(PendingReceive {
                        session_id,
                        alias,
                        sender,
                        files,
                        decision_tx,
                    });
                }
            }
            ServerEventV2::FileUpload {
                session_id,
                file_id,
                file,
                target_tx,
            } => self.handle_file_upload(session_id, file_id, file, target_tx),
            ServerEventV2::SessionEnd { session_id, reason } => {
                let Some(session) = self
                    .receive
                    .as_mut()
                    .filter(|session| session.session_id == session_id)
                else {
                    return;
                };
                // The per-file results race with this event (they arrive on
                // the app's own channel); print the summary only once the
                // last in-flight file has reported its outcome.
                session.ended = Some(reason);
                self.finish_receive_if_done();
            }
            ServerEventV2::PrepareUploadAborted { session_id } => {
                if let Some(pending) = &self.pending
                    && pending.session_id == session_id
                {
                    let pending = self.pending.take().unwrap();
                    self.ui.log(
                        Category::Receive,
                        &format!("{}: Aborted by sender", pending.alias),
                    );
                }
            }
            ServerEventV2::CancelReceived { ip, session_id } => {
                if let Some(send) = &self.send
                    && send.session_id.as_deref() == Some(session_id.as_str())
                    && send.host == ip.to_string()
                {
                    send.cancel.by_peer.store(true, Ordering::Relaxed);
                    send.cancel.token.cancel();
                }
            }
            ServerEventV2::ListenerFailed { error } => {
                self.ui.log(
                    Category::Receive,
                    &format!("Server stopped, no longer receiving: {error}"),
                );
            }
        }
    }

    fn handle_file_upload(
        &mut self,
        session_id: String,
        file_id: String,
        file: FileDto,
        target_tx: oneshot::Sender<FileUploadTarget>,
    ) {
        let Some(session) = self
            .receive
            .as_mut()
            .filter(|session| session.session_id == session_id)
        else {
            // Unknown session: dropping the responder fails the request.
            return;
        };

        let path = util::unique_path(&self.storage.destination, &file.file_name);

        let progress = Arc::new(AtomicU64::new(0));
        session
            .in_progress
            .insert(file_id.clone(), progress.clone());

        let (progress_tx, mut progress_rx) = mpsc::channel::<u64>(16);
        tokio::spawn(async move {
            while let Some(written) = progress_rx.recv().await {
                progress.store(written, Ordering::Relaxed);
            }
        });

        let (result_tx, result_rx) = oneshot::channel::<Result<(), String>>();
        tokio::spawn({
            let events_tx = self.events_tx.clone();
            async move {
                let result = match result_rx.await {
                    Ok(result) => result,
                    Err(_) => Err("Upload aborted".to_string()),
                };
                let _ = events_tx
                    .send(super::AppEvent::ReceiveFileResult {
                        session_id,
                        file_id,
                        result,
                    })
                    .await;
            }
        });

        let _ = target_tx.send(FileUploadTarget::Path {
            path,
            result_tx,
            progress_tx: Some(progress_tx),
        });
    }

    pub(super) fn receive_file_result(
        &mut self,
        session_id: String,
        file_id: String,
        result: Result<(), String>,
    ) {
        let Some(session) = self
            .receive
            .as_mut()
            .filter(|session| session.session_id == session_id)
        else {
            return;
        };
        session.in_progress.remove(&file_id);
        match result {
            Ok(()) => {
                session.finished_files += 1;
                session.finalized_bytes += session
                    .files
                    .get(&file_id)
                    .map(|file| file.size)
                    .unwrap_or(0);
            }
            Err(err) => {
                session.failed_files += 1;
                let name = session
                    .files
                    .get(&file_id)
                    .map(|file| sanitize::single_line(&file.file_name))
                    .unwrap_or_else(|| sanitize::single_line(&file_id));
                let alias = session.alias.clone();
                self.ui.log(
                    Category::Receive,
                    &format!("{alias}: Failed to receive {name}: {err}"),
                );
            }
        }
        self.finish_receive_if_done();
    }

    /// Prints the session summary and clears the session once the server
    /// reported its end and no per-file result is outstanding.
    fn finish_receive_if_done(&mut self) {
        let done = self
            .receive
            .as_ref()
            .is_some_and(|session| session.ended.is_some() && session.in_progress.is_empty());
        if !done {
            return;
        }
        let session = self.receive.take().unwrap();
        match session.ended.unwrap() {
            SessionEndReasonV2::Finished => {
                let mut text = format!(
                    "{}: Received {} file{} ({}, took {})",
                    session.alias,
                    session.finished_files,
                    if session.finished_files == 1 { "" } else { "s" },
                    util::format_bytes(session.finalized_bytes),
                    util::format_duration(session.started.elapsed()),
                );
                if session.failed_files > 0 {
                    text.push_str(&format!(", {} failed", session.failed_files));
                }
                self.ui.log(Category::Receive, &text);
            }
            SessionEndReasonV2::Cancelled => {
                self.ui.log(
                    Category::Receive,
                    &format!(
                        "{}: Cancelled by sender ({} of {} files received)",
                        session.alias,
                        session.finished_files,
                        session.files.len(),
                    ),
                );
            }
        }
        self.render_status();
    }

    /// Cancels the active receive session: rejects further uploads on the
    /// server, notifies the sender and prints the summary. Late per-file
    /// results are dropped by the session-id filters.
    pub(super) fn cancel_receive(&mut self) {
        let Some(session) = self.receive.take() else {
            return;
        };
        let server = self.server.clone();
        let identity = self.storage.identity.clone();
        let sender = session.sender.clone();
        let session_id = session.session_id.clone();
        tokio::spawn(async move {
            server.cancel_v2_session(&session_id).await;

            // Best effort: without it the sender only notices through its
            // failing upload requests.
            let expected_fingerprint = match sender.protocol {
                ProtocolType::Https => Some(sender.fingerprint.clone()),
                ProtocolType::Http => None,
            };
            let Ok(client) = LsHttpClientV2::try_new(
                &identity.key_pem,
                &identity.cert_pem,
                expected_fingerprint,
                Some(Duration::from_secs(5)),
            ) else {
                return;
            };
            let protocol = match sender.protocol {
                ProtocolType::Http => ProtocolType::Http,
                ProtocolType::Https => ProtocolType::Https,
            };
            let _ = client
                .cancel(protocol, &sender.host, sender.port, &session_id)
                .await;
        });
        self.ui.log(
            Category::Receive,
            &format!(
                "{}: cancelled ({} of {} files received)",
                session.alias,
                session.finished_files,
                session.files.len(),
            ),
        );
        self.render_status();
    }

    pub(super) fn answer_pending(&mut self, answer: Answer) {
        let Some(pending) = self.pending.take() else {
            return;
        };
        match answer {
            Answer::Decline => {
                let _ = pending.decision_tx.send(PrepareUploadDecisionV2::Decline);
                self.ui.log(
                    Category::Receive,
                    &format!("{}: You declined", pending.alias),
                );
            }
            Answer::Accept | Answer::AcceptAndPair => {
                self.ui.log(
                    Category::Receive,
                    &format!("{}: You accepted", pending.alias),
                );
                // While "receive via link" is on, P was not offered; a stray
                // press still accepts, but never pairs.
                if matches!(answer, Answer::AcceptAndPair)
                    && !matches!(self.web, Some(WebMode::Receive))
                {
                    let channels = self
                        .discovery
                        .device_by_fingerprint(&pending.sender.fingerprint)
                        .map(|stored| crate::storage::PairedChannel::channels_of(&stored))
                        .unwrap_or_default();
                    match self.storage.paired.insert(
                        pending.sender.fingerprint.clone(),
                        pending.alias.clone(),
                        channels,
                    ) {
                        Ok(()) => self.ui.log(
                            Category::Receive,
                            &format!(
                                "{}: Paired. Future requests are auto-accepted.",
                                pending.alias
                            ),
                        ),
                        Err(err) => self.ui.log(
                            Category::Receive,
                            &format!(
                                "{}: Paired for this run, but saving failed: {err:#}",
                                pending.alias
                            ),
                        ),
                    }
                }
                let ids: HashSet<String> = pending.files.keys().cloned().collect();
                if pending
                    .decision_tx
                    .send(PrepareUploadDecisionV2::Accept(ids))
                    .is_err()
                {
                    self.ui.log(
                        Category::Receive,
                        &format!("{}: request already ended", pending.alias),
                    );
                    return;
                }
                self.receive = Some(ReceiveSession::new(
                    pending.session_id,
                    pending.alias,
                    pending.sender,
                    pending.files,
                ));
            }
        }
    }
}
