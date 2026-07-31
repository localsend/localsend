use crate::util;
use crossterm::event::{KeyCode, KeyEvent};
use ratatui::Terminal;
use ratatui::backend::CrosstermBackend;
use ratatui::layout::{Constraint, Layout};
use ratatui::style::{Color, Modifier, Style};
use ratatui::text::Span;
use ratatui::widgets::{Block, Borders, HighlightSpacing, List, ListItem, ListState, Paragraph};
use std::io::Stdout;

/// One row of the device list: the section headlines, the devices and the
/// filler rows around them.
pub enum Row {
    Header(&'static str),

    /// The placeholder shown instead of an empty section.
    Empty,

    /// A blank line between the sections.
    Spacer,

    Device(DeviceRow),
}

/// A selectable device entry.
pub struct DeviceRow {
    pub fingerprint: String,
    pub alias: String,

    /// The send hotkey (1-9) of the discovered device, if one was free.
    pub slot: Option<u8>,

    /// The addresses the device was seen on, the best first; empty for a paired
    /// device that has not been discovered in this run and therefore cannot
    /// be sent to.
    pub hosts: Vec<String>,

    /// Whether the device is paired; the pair hotkey toggles it.
    pub paired: bool,
}

/// What a key press did to the device list.
pub enum DeviceListOutcome {
    /// The list stays open.
    Open,

    /// The user closed the list.
    Closed,

    /// The user wants to send files to this device.
    Send { fingerprint: String },

    /// The user wants to pair this discovered device.
    Pair { fingerprint: String },

    /// The user wants to remove this paired device.
    Unpair { fingerprint: String },
}

/// A modal list of the paired and discovered devices, rendered on the
/// alternate screen while the log UI is suspended.
pub struct DeviceList {
    terminal: Terminal<CrosstermBackend<Stdout>>,
    rows: Vec<Row>,
    list_state: ListState,
}

impl DeviceList {
    /// Enters the alternate screen and shows the list.
    /// The caller must suspend the log UI first and resume it after [DeviceList::close].
    pub fn open(rows: Vec<Row>) -> anyhow::Result<Self> {
        util::enter_alternate_screen()?;
        let terminal = Terminal::new(CrosstermBackend::new(std::io::stdout()))?;
        let mut list = Self {
            terminal,
            rows,
            list_state: ListState::default(),
        };
        list.select_first_device();
        list.draw();
        Ok(list)
    }

    /// Leaves the alternate screen. Must be called exactly once.
    pub fn close(self) {
        util::leave_alternate_screen();
    }

    /// Drops the list but stays on the (cleared) alternate screen, handing it
    /// over to the next modal (see [crate::picker::Picker::open_on_alternate_screen]).
    /// That modal's close leaves the screen.
    pub fn close_keeping_screen(self) {
        util::clear_alternate_screen();
    }

    /// Replaces the rows (discovery goes on while the list is open), keeping
    /// the highlight on the same device where possible.
    pub fn set_rows(&mut self, rows: Vec<Row>) {
        let highlighted = self
            .selected_device()
            .map(|device| device.fingerprint.clone());
        self.rows = rows;
        let index = highlighted.and_then(|fingerprint| {
            self.device_rows()
                .find(|(_, device)| device.fingerprint == fingerprint)
                .map(|(index, _)| index)
        });
        match index {
            Some(index) => self.list_state.select(Some(index)),
            None => self.select_first_device(),
        }
    }

    pub fn handle_key(&mut self, key: KeyEvent) -> DeviceListOutcome {
        match key.code {
            KeyCode::Esc => return DeviceListOutcome::Closed,
            KeyCode::Char(c) if c.eq_ignore_ascii_case(&'d') => return DeviceListOutcome::Closed,
            KeyCode::Up => self.move_cursor(-1),
            KeyCode::Down => self.move_cursor(1),
            KeyCode::Enter => {
                // A paired device that was never discovered has no address.
                if let Some(device) = self.selected_device()
                    && !device.hosts.is_empty()
                {
                    return DeviceListOutcome::Send {
                        fingerprint: device.fingerprint.clone(),
                    };
                }
            }
            KeyCode::Char(c) if c.eq_ignore_ascii_case(&'p') => {
                if let Some(device) = self.selected_device() {
                    let fingerprint = device.fingerprint.clone();
                    return match device.paired {
                        true => DeviceListOutcome::Unpair { fingerprint },
                        false => DeviceListOutcome::Pair { fingerprint },
                    };
                }
            }
            _ => {}
        }
        self.draw();
        DeviceListOutcome::Open
    }

    /// The device rows with their positions in [DeviceList::rows].
    fn device_rows(&self) -> impl Iterator<Item = (usize, &DeviceRow)> {
        self.rows
            .iter()
            .enumerate()
            .filter_map(|(index, row)| match row {
                Row::Device(device) => Some((index, device)),
                _ => None,
            })
    }

    /// The highlighted device, or `None` when there are no devices.
    fn selected_device(&self) -> Option<&DeviceRow> {
        match self
            .list_state
            .selected()
            .and_then(|index| self.rows.get(index))
        {
            Some(Row::Device(device)) => Some(device),
            _ => None,
        }
    }

    fn select_first_device(&mut self) {
        let first = self.device_rows().next().map(|(index, _)| index);
        self.list_state.select(first);
    }

    fn move_cursor(&mut self, delta: isize) {
        let indices: Vec<usize> = self.device_rows().map(|(index, _)| index).collect();
        if indices.is_empty() {
            return;
        }
        let cursor = self
            .list_state
            .selected()
            .and_then(|selected| indices.iter().position(|&index| index == selected))
            .unwrap_or_default() as isize;
        let cursor = (cursor + delta).rem_euclid(indices.len() as isize);
        self.list_state.select(Some(indices[cursor as usize]));
    }

    pub fn draw(&mut self) {
        let Self {
            terminal,
            rows,
            list_state,
        } = self;

        let help = Span::raw(" ↑/↓: navigate  Enter: send  P: pair/unpair  Esc: close");
        let _ = terminal.draw(|frame| {
            let [main_area, help_area] =
                Layout::vertical([Constraint::Fill(1), Constraint::Length(1)]).areas(frame.area());

            let list = List::new(rows.iter().map(row_item))
                .block(
                    Block::default()
                        .borders(Borders::ALL)
                        .title_top(" Devices "),
                )
                .highlight_spacing(HighlightSpacing::Always)
                .highlight_style(Style::default().bg(Color::DarkGray).fg(Color::White));
            frame.render_stateful_widget(list, main_area, list_state);

            frame.render_widget(Paragraph::new(help), help_area);
        });
    }
}

fn row_item(row: &Row) -> ListItem<'_> {
    match row {
        Row::Header(title) => ListItem::new(Span::styled(
            *title,
            Style::default()
                .fg(Color::Green)
                .add_modifier(Modifier::BOLD),
        )),
        Row::Empty => ListItem::new(Span::styled(
            "  (none)",
            Style::default().fg(Color::DarkGray),
        )),
        Row::Spacer => ListItem::new(""),
        Row::Device(device) => {
            let slot = match device.slot {
                Some(slot) => slot.to_string(),
                None => "-".to_string(),
            };
            match device.hosts.is_empty() {
                false => {
                    let hosts: Vec<String> =
                        device.hosts.iter().map(|host| shorten_host(host)).collect();
                    ListItem::new(Span::raw(format!(
                        "  [{slot}] {} ({})",
                        device.alias,
                        hosts.join(", ")
                    )))
                }
                true => ListItem::new(Span::styled(
                    format!("  [{slot}] {} (offline)", device.alias),
                    Style::default().fg(Color::DarkGray),
                )),
            }
        }
    }
}

/// Shortens a host for the row: an IPv6 address is reduced to its last group
/// (keeping the scope), so `fe80::6888:8aff:febd:8578%15` renders as
/// `::8578%15`. Display only; sending always uses the full address.
fn shorten_host(host: &str) -> String {
    let (address, scope) = match host.split_once('%') {
        Some((address, scope)) => (address, Some(scope)),
        None => (host, None),
    };
    if !address.contains(':') {
        return host.to_string();
    }
    let last_group = address.rsplit(':').next().unwrap_or_default();
    match scope {
        Some(scope) => format!("::{last_group}%{scope}"),
        None => format!("::{last_group}"),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_shorten_host() {
        assert_eq!(shorten_host("fe80::6888:8aff:febd:8578%15"), "::8578%15");
        assert_eq!(shorten_host("fe80::6888:8aff:febd:8578%7"), "::8578%7");
        assert_eq!(shorten_host("fe80::1%3"), "::1%3");
        assert_eq!(shorten_host("2a00:1450:4001:829::200e"), "::200e");
        assert_eq!(
            shorten_host("192.168.178.183"),
            "192.168.178.183",
            "IPv4 must stay untouched"
        );
    }
}
