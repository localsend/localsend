use crossterm::event::{Event, KeyCode, KeyEvent, KeyModifiers};
use crossterm::terminal::{Clear, ClearType};
use crossterm::{cursor, execute};
use ratatui::Terminal;
use ratatui::backend::CrosstermBackend;
use ratatui::layout::{Constraint, Layout};
use ratatui::style::{Color, Style};
use ratatui::text::Span;
use ratatui::widgets::{Block, Borders, HighlightSpacing, List, ListState, Paragraph};
use ratatui_explorer::{File, FileExplorer};
use std::io::Stdout;
use std::path::PathBuf;

/// How far `PageUp` / `PageDown` jump, matching `ratatui_explorer`.
const SCROLL_COUNT: usize = 12;

/// A modal, terminal-native file picker rendered on the alternate screen
/// while the log UI is suspended.
///
/// Typing filters the listing, Space toggles files on and off, Enter confirms
/// (or descends into the highlighted directory), Esc clears the filter or
/// cancels. Confirming with an empty selection picks the highlighted file.
///
/// The explorer only supplies the directory listing; navigation and rendering
/// are done here so that the filter can hide entries.
pub struct Picker {
    /// The device slot the picked files will be sent to.
    pub slot: u8,

    explorer: FileExplorer,
    terminal: Terminal<CrosstermBackend<Stdout>>,
    selected: Vec<PathBuf>,

    /// The search query, matched as a case-insensitive subsequence against the
    /// entry names. Empty means "show everything".
    query: String,

    /// Indices into `explorer.files()` that match `query`, in listing order.
    matches: Vec<usize>,

    list_state: ListState,
}

/// What a key press did to the picker.
pub enum PickerOutcome {
    /// The picker stays open.
    Open,

    /// The user confirmed the selection.
    Picked(Vec<PathBuf>),

    /// The user cancelled.
    Cancelled,
}

impl Picker {
    /// Enters the alternate screen and shows the picker.
    /// The caller must suspend the log UI first and resume it after [Picker::close].
    pub fn open(slot: u8) -> anyhow::Result<Self> {
        let explorer = FileExplorer::new()?;
        execute!(
            std::io::stdout(),
            crossterm::terminal::EnterAlternateScreen,
            cursor::Hide
        )?;
        let terminal = Terminal::new(CrosstermBackend::new(std::io::stdout()))?;
        let mut picker = Self {
            slot,
            explorer,
            terminal,
            selected: Vec::new(),
            query: String::new(),
            matches: Vec::new(),
            list_state: ListState::default(),
        };
        picker.refresh_matches();
        picker.select_first_entry();
        picker.draw();
        Ok(picker)
    }

    /// Leaves the alternate screen. Must be called exactly once.
    pub fn close(self) {
        // Clears via crossterm, not `Terminal::clear`: the latter queries the
        // cursor position, whose response is read from the event stream but
        // the keyboard reader thread is parked in `crossterm::event::read()`,
        // so the query only ever returns after crossterm's 2s timeout.
        let _ = execute!(
            std::io::stdout(),
            Clear(ClearType::All),
            cursor::MoveTo(0, 0),
            crossterm::terminal::LeaveAlternateScreen,
            cursor::Show
        );
    }

    pub fn handle_key(&mut self, key: KeyEvent) -> PickerOutcome {
        match key.code {
            KeyCode::Esc => {
                if self.query.is_empty() {
                    return PickerOutcome::Cancelled;
                }
                self.query.clear();
                self.refresh_matches();
            }
            KeyCode::Up => self.move_cursor(-1, true),
            KeyCode::Down => self.move_cursor(1, true),
            KeyCode::PageUp => self.move_cursor(-(SCROLL_COUNT as isize), false),
            KeyCode::PageDown => self.move_cursor(SCROLL_COUNT as isize, false),
            KeyCode::Home => self.select_match(0),
            KeyCode::End => self.select_match(self.matches.len().saturating_sub(1)),
            KeyCode::Left => self.navigate(key),
            KeyCode::Right => {
                // Never act on a hidden entry: with no matches the explorer's
                // index still points at whatever was highlighted before.
                if self.current().is_some_and(|file| file.is_dir) {
                    self.navigate(key);
                }
            }
            KeyCode::Backspace => {
                // Purely an editing key: erasing one character too many must not
                // leave the directory. Left does that, and so does the `../` entry.
                if self.query.pop().is_some() {
                    self.refresh_matches();
                }
            }
            KeyCode::Char(' ') => {
                if let Some(current) = self.current()
                    && !current.is_dir
                {
                    let path = current.path.clone();
                    match self.selected.iter().position(|p| *p == path) {
                        Some(index) => {
                            self.selected.remove(index);
                        }
                        None => self.selected.push(path),
                    }
                }
            }
            KeyCode::Enter => match self
                .current()
                .map(|current| (current.is_dir, current.path.clone()))
            {
                Some((true, _)) => self.navigate(key),
                Some((false, path)) => {
                    let mut files = std::mem::take(&mut self.selected);
                    if files.is_empty() {
                        files.push(path);
                    }
                    return PickerOutcome::Picked(files);
                }
                None => {
                    let files = std::mem::take(&mut self.selected);
                    if !files.is_empty() {
                        return PickerOutcome::Picked(files);
                    }
                }
            },
            KeyCode::Char(c)
                if !key
                    .modifiers
                    .intersects(KeyModifiers::CONTROL | KeyModifiers::ALT) =>
            {
                self.query.push(c);
                self.refresh_matches();
            }
            _ => {}
        }
        self.draw();
        PickerOutcome::Open
    }

    /// The highlighted entry, or `None` while nothing matches the query.
    fn current(&self) -> Option<&File> {
        self.cursor().map(|_| self.explorer.current())
    }

    /// Position of the highlighted entry within [Picker::matches].
    fn cursor(&self) -> Option<usize> {
        self.matches
            .iter()
            .position(|&index| index == self.explorer.selected_idx())
    }

    /// Changes the directory via the explorer and drops the query, since it was
    /// only ever meant for the listing that is now gone.
    fn navigate(&mut self, key: KeyEvent) {
        let previous = self.explorer.cwd().clone();
        let _ = self.explorer.handle(&Event::Key(key));
        if *self.explorer.cwd() == previous {
            // Nothing to navigate into — keep the query and the highlight.
            return;
        }
        self.query.clear();
        self.refresh_matches();
        self.select_first_entry();
    }

    /// Highlights the first real entry, skipping the `../` link the explorer
    /// lands on after every directory change — otherwise Right, pressed twice,
    /// descends and then bounces straight back up.
    fn select_first_entry(&mut self) {
        let skip_parent = self.explorer.cwd().parent().is_some() && self.matches.len() > 1;
        self.select_match(usize::from(skip_parent));
    }

    fn move_cursor(&mut self, delta: isize, wrap: bool) {
        if self.matches.is_empty() {
            return;
        }
        let len = self.matches.len() as isize;
        let cursor = self.cursor().unwrap_or_default() as isize + delta;
        let cursor = match wrap {
            true => cursor.rem_euclid(len),
            false => cursor.clamp(0, len - 1),
        };
        self.select_match(cursor as usize);
    }

    fn select_match(&mut self, cursor: usize) {
        match self.matches.get(cursor) {
            Some(&index) => {
                self.explorer.set_selected_idx(index);
                self.list_state.select(Some(cursor));
            }
            None => self.list_state.select(None),
        }
    }

    /// Recomputes the visible entries. Keeps the highlighted entry if it still
    /// matches, otherwise falls back to the first match.
    fn refresh_matches(&mut self) {
        self.matches = self
            .explorer
            .files()
            .iter()
            .enumerate()
            .filter(|(_, file)| matches_query(&self.query, &file.name))
            .map(|(index, _)| index)
            .collect();
        let cursor = self.cursor().unwrap_or_default();
        self.select_match(cursor);
    }

    pub fn draw(&mut self) {
        let Self {
            explorer,
            terminal,
            selected,
            query,
            matches,
            list_state,
            ..
        } = self;

        let help = format!(
            " Type: filter  ←/→: folder  Space: select ({})  Enter: confirm  Esc: clear/cancel",
            selected.len()
        );
        let _ = terminal.draw(|frame| {
            let [main_area, selected_area, help_area] = Layout::vertical([
                Constraint::Fill(1),
                Constraint::Length(1),
                Constraint::Length(1),
            ])
            .areas(frame.area());

            let mut block = Block::default()
                .borders(Borders::ALL)
                .title_top(format!(" {} ", explorer.cwd().display()));
            if !query.is_empty() {
                let hits = match matches.is_empty() {
                    true => " no matches".to_string(),
                    false => format!(" {} of {}", matches.len(), explorer.files().len()),
                };
                block = block.title_bottom(format!(" Filter: {query} ({hits}) "));
            }

            let items = matches
                .iter()
                .filter_map(|&index| explorer.files().get(index))
                .map(|file| {
                    let style = match file.is_dir {
                        true => Style::default().fg(Color::LightBlue),
                        false => Style::default().fg(Color::White),
                    };
                    Span::styled(file.name.clone(), style)
                });
            let list = List::new(items)
                .block(block)
                .highlight_spacing(HighlightSpacing::Always)
                .highlight_style(Style::default().bg(Color::DarkGray));
            frame.render_stateful_widget(list, main_area, list_state);

            let selected_line = match selected.is_empty() {
                true => " No files selected".to_string(),
                false => format!(
                    " Selected: {}",
                    selected
                        .iter()
                        .filter_map(|path| path.file_name())
                        .map(|name| name.to_string_lossy().into_owned())
                        .collect::<Vec<_>>()
                        .join(", ")
                ),
            };
            frame.render_widget(Paragraph::new(selected_line), selected_area);
            frame.render_widget(Paragraph::new(help), help_area);
        });
    }
}

/// Case-insensitive subsequence match, so `myrep` finds `My Report.pdf`
/// even though Space cannot be typed into the query.
fn matches_query(query: &str, name: &str) -> bool {
    let name = name.to_lowercase();
    let mut name = name.chars();
    query
        .to_lowercase()
        .chars()
        .all(|needle| name.any(|c| c == needle))
}
