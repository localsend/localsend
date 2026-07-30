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

    /// Where the device was last seen; `None` for a paired device that has
    /// not been discovered in this run and therefore cannot be sent to.
    pub host: Option<String>,

    /// Paired devices offer the remove action.
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

    /// The user confirmed removing this paired device.
    Unpair { fingerprint: String },
}

/// A pending remove confirmation, answered with y/n.
struct Confirm {
    fingerprint: String,
    alias: String,
}

/// A modal list of the paired and discovered devices, rendered on the
/// alternate screen while the log UI is suspended.
///
/// Up/Down navigates, Enter sends to the highlighted device, Delete (or
/// Backspace) removes a paired device after a y/n confirmation, Esc or D
/// closes the list.
pub struct DeviceList {
    terminal: Terminal<CrosstermBackend<Stdout>>,
    rows: Vec<Row>,
    list_state: ListState,
    confirm: Option<Confirm>,
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
            confirm: None,
        };
        list.select_first_device();
        list.draw();
        Ok(list)
    }

    /// Leaves the alternate screen. Must be called exactly once.
    pub fn close(self) {
        util::leave_alternate_screen();
    }

    /// Replaces the rows (discovery goes on while the list is open), keeping
    /// the highlight on the same device where possible.
    pub fn set_rows(&mut self, rows: Vec<Row>) {
        let highlighted = self
            .selected_device()
            .map(|device| device.fingerprint.clone());
        self.rows = rows;
        if let Some(confirm) = &self.confirm
            && !self
                .device_rows()
                .any(|(_, device)| device.paired && device.fingerprint == confirm.fingerprint)
        {
            self.confirm = None;
        }
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
        // The confirmation prompt consumes every key.
        if self.confirm.is_some() {
            match key.code {
                KeyCode::Char(c) if c.eq_ignore_ascii_case(&'y') => {
                    let confirm = self.confirm.take().unwrap();
                    return DeviceListOutcome::Unpair {
                        fingerprint: confirm.fingerprint,
                    };
                }
                KeyCode::Esc => self.confirm = None,
                KeyCode::Char(c) if c.eq_ignore_ascii_case(&'n') => self.confirm = None,
                _ => {}
            }
            self.draw();
            return DeviceListOutcome::Open;
        }

        match key.code {
            KeyCode::Esc => return DeviceListOutcome::Closed,
            KeyCode::Char(c) if c.eq_ignore_ascii_case(&'d') => return DeviceListOutcome::Closed,
            KeyCode::Up => self.move_cursor(-1),
            KeyCode::Down => self.move_cursor(1),
            KeyCode::Enter => {
                // A paired device that was never discovered has no address.
                if let Some(device) = self.selected_device()
                    && device.host.is_some()
                {
                    return DeviceListOutcome::Send {
                        fingerprint: device.fingerprint.clone(),
                    };
                }
            }
            // Backspace, because that is what the key labeled "delete"
            // sends on macOS.
            KeyCode::Delete | KeyCode::Backspace => {
                if let Some(device) = self.selected_device()
                    && device.paired
                {
                    self.confirm = Some(Confirm {
                        fingerprint: device.fingerprint.clone(),
                        alias: device.alias.clone(),
                    });
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
            confirm,
        } = self;

        let help = match confirm {
            Some(confirm) => Span::styled(
                format!(" Remove {}? y/n", confirm.alias),
                Style::default().add_modifier(Modifier::BOLD),
            ),
            None => Span::raw(" ↑/↓: navigate  Enter: send  Del: remove (paired only)  Esc: close"),
        };
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
            match &device.host {
                Some(host) => {
                    ListItem::new(Span::raw(format!("  [{slot}] {} ({host})", device.alias)))
                }
                None => ListItem::new(Span::styled(
                    format!("  [{slot}] {} (offline)", device.alias),
                    Style::default().fg(Color::DarkGray),
                )),
            }
        }
    }
}
