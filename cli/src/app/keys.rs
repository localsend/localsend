//! Decoding raw key presses into semantic [Intent]s, so the handlers act on
//! what the user meant and the chord bookkeeping stays out of them.

use super::receive::Answer;
use crossterm::event::{KeyCode, KeyEvent, KeyModifiers};

/// A semantic action decoded from a key press.
#[derive(Debug, PartialEq)]
pub(super) enum Intent {
    /// Ctrl+C: cancel the open overlay, the pending request, or the active
    /// transfers, or quit when idle.
    Cancel,

    /// While an overlay is open, it consumes every key.
    Overlay(KeyEvent),

    /// W+S: toggle "share via link".
    ToggleWebShare,

    /// W+R: toggle "receive via link".
    ToggleWebReceive,

    /// Y/N/P: answer the pending transfer request.
    Answer(Answer),

    /// D: open the device list overlay.
    OpenDeviceList,

    /// 1-9: send files to the device on that hotkey slot.
    PickDevice(u8),
}

/// Decodes key presses into [Intent]s, tracking the `W` half of the W+S /
/// W+R chords across presses.
pub(super) struct KeyDecoder {
    /// Whether the previously pressed key was `W`.
    chord_w: bool,
}

impl KeyDecoder {
    pub(super) fn new() -> Self {
        Self { chord_w: false }
    }

    /// Decodes a key press; keys without a meaning decode to `None`.
    pub(super) fn decode(&mut self, key: KeyEvent, overlay_open: bool) -> Option<Intent> {
        if key.code == KeyCode::Char('c') && key.modifiers.contains(KeyModifiers::CONTROL) {
            self.chord_w = false;
            return Some(Intent::Cancel);
        }
        if overlay_open {
            return Some(Intent::Overlay(key));
        }
        let KeyCode::Char(c) = key.code else {
            return None;
        };
        let chord_w = std::mem::replace(&mut self.chord_w, false);
        match c.to_ascii_lowercase() {
            's' if chord_w => Some(Intent::ToggleWebShare),
            'r' if chord_w => Some(Intent::ToggleWebReceive),
            'w' => {
                self.chord_w = true;
                None
            }
            'y' => Some(Intent::Answer(Answer::Accept)),
            'n' => Some(Intent::Answer(Answer::Decline)),
            'p' => Some(Intent::Answer(Answer::AcceptAndPair)),
            'd' => Some(Intent::OpenDeviceList),
            '1'..='9' => Some(Intent::PickDevice(c as u8 - b'0')),
            _ => None,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::{Intent, KeyDecoder};
    use crate::app::receive::Answer;
    use crossterm::event::{KeyCode, KeyEvent, KeyModifiers};

    fn char_key(c: char) -> KeyEvent {
        KeyEvent::new(KeyCode::Char(c), KeyModifiers::NONE)
    }

    #[test]
    fn decodes_the_web_chords() {
        let mut decoder = KeyDecoder::new();

        assert_eq!(decoder.decode(char_key('w'), false), None);
        assert_eq!(
            decoder.decode(char_key('s'), false),
            Some(Intent::ToggleWebShare)
        );

        assert_eq!(decoder.decode(char_key('w'), false), None);
        assert_eq!(
            decoder.decode(char_key('r'), false),
            Some(Intent::ToggleWebReceive)
        );
    }

    #[test]
    fn any_other_key_ends_the_chord() {
        let mut decoder = KeyDecoder::new();

        assert_eq!(decoder.decode(char_key('w'), false), None);
        assert_eq!(
            decoder.decode(char_key('y'), false),
            Some(Intent::Answer(Answer::Accept))
        );
        // The chord was consumed: a plain S means nothing.
        assert_eq!(decoder.decode(char_key('s'), false), None);
    }

    #[test]
    fn ctrl_c_cancels_and_resets_the_chord() {
        let mut decoder = KeyDecoder::new();
        let ctrl_c = KeyEvent::new(KeyCode::Char('c'), KeyModifiers::CONTROL);

        assert_eq!(decoder.decode(char_key('w'), false), None);
        assert_eq!(decoder.decode(ctrl_c, false), Some(Intent::Cancel));
        assert_eq!(decoder.decode(char_key('s'), false), None);
    }

    #[test]
    fn an_open_overlay_consumes_every_key_except_ctrl_c() {
        let mut decoder = KeyDecoder::new();
        let ctrl_c = KeyEvent::new(KeyCode::Char('c'), KeyModifiers::CONTROL);

        assert_eq!(
            decoder.decode(char_key('d'), true),
            Some(Intent::Overlay(char_key('d')))
        );
        assert_eq!(decoder.decode(ctrl_c, true), Some(Intent::Cancel));
    }

    #[test]
    fn decodes_the_device_slots() {
        let mut decoder = KeyDecoder::new();

        assert_eq!(
            decoder.decode(char_key('1'), false),
            Some(Intent::PickDevice(1))
        );
        assert_eq!(
            decoder.decode(char_key('9'), false),
            Some(Intent::PickDevice(9))
        );
        assert_eq!(decoder.decode(char_key('0'), false), None);
    }
}
