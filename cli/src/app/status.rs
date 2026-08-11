//! The status line at the bottom of the screen: one progress bar per active
//! transfer, refreshed by the tick of the main loop.

use super::App;
use crate::ui::Category;
use crate::util;
use std::sync::atomic::Ordering;
use std::time::Duration;

impl App {
    pub(super) fn tick(&mut self) {
        if let Some(picker) = &mut self.picker {
            // Covers terminal resizes; key presses redraw on their own.
            picker.draw();
            return;
        }
        if self.device_list.is_some() {
            // Also picks up devices discovered while the list is open.
            let rows = self.device_rows();
            if let Some(list) = &mut self.device_list {
                list.set_rows(rows);
                list.draw();
            }
            return;
        }
        self.render_status();
    }

    pub(super) fn render_status(&mut self) {
        const SEPARATOR: &str = "  |  ";
        let mut transfers = Vec::new();
        if let Some(session) = &mut self.receive {
            let done = session.done_bytes();
            let speed = session.speed.update(done);
            transfers.push((
                Category::Receive,
                session.alias.clone(),
                done,
                session.total_bytes,
                speed,
            ));
        }
        if let Some(send) = &mut self.send {
            let done = send.sent.load(Ordering::Relaxed);
            let speed = send.speed.update(done);
            transfers.push((
                Category::Send,
                send.alias.clone(),
                done,
                send.total_bytes,
                speed,
            ));
        }
        if transfers.is_empty() {
            self.ui.set_status(None);
            return;
        }
        // Split the terminal width among the transfers so the status line
        // (mostly the flexible progress bars) spans the whole screen.
        let width = util::terminal_width();
        let part_width =
            width.saturating_sub(1 + SEPARATOR.len() * (transfers.len() - 1)) / transfers.len();
        let parts: Vec<String> = transfers
            .iter()
            .map(|(category, alias, done, total, speed)| {
                transfer_status(*category, alias, *done, *total, *speed, part_width)
            })
            .collect();
        self.ui.set_status(Some(parts.join(SEPARATOR)));
    }
}

/// Formats one transfer for the status line, sizing the progress bar so the
/// whole entry occupies `width` visible columns.
fn transfer_status(
    category: Category,
    alias: &str,
    done: u64,
    total: u64,
    speed: f64,
    width: usize,
) -> String {
    let fraction = match total {
        0 => 1.0,
        total => done as f64 / total as f64,
    };
    let eta = match speed > 1.0 && done < total {
        true => util::format_duration(Duration::from_secs(((total - done) as f64 / speed) as u64)),
        false => "--".to_string(),
    };
    let tail = format!(
        " {} / {} [{}] [ETA: {eta}]",
        util::format_bytes(done),
        util::format_bytes(total),
        util::format_speed(speed),
    );
    // Visible columns besides the bar: "T alias [" + "]" + tail, tag = 1 column.
    let bar_width = width
        .saturating_sub(alias.chars().count() + 5 + tail.chars().count())
        .max(10);
    format!(
        "{} {alias} [{}]{tail}",
        category.colored_tag(),
        util::progress_bar(fraction, bar_width),
    )
}
