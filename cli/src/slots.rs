/// The hotkeys (1-9) assigned to discovered devices, in discovery order.
pub struct Slots {
    /// One entry per discovered fingerprint. A device beyond the ninth gets
    /// `None` and keeps it: slots are never released, so a hotkey means the
    /// same device for the whole run.
    assigned: Vec<(String, Option<u8>)>,
}

impl Slots {
    pub fn new() -> Self {
        Self {
            assigned: Vec::new(),
        }
    }

    /// Assigns the next free slot to a fingerprint; returns the assigned
    /// slot, also when the fingerprint already has one.
    pub fn assign(&mut self, fingerprint: &str) -> Option<u8> {
        if let Some((_, slot)) = self.assigned.iter().find(|(known, _)| known == fingerprint) {
            return *slot;
        }
        let slot = (1..=9u8).find(|slot| {
            !self
                .assigned
                .iter()
                .any(|(_, assigned)| *assigned == Some(*slot))
        });
        self.assigned.push((fingerprint.to_string(), slot));
        slot
    }

    pub fn get(&self, fingerprint: &str) -> Option<u8> {
        self.assigned
            .iter()
            .find(|(known, _)| known == fingerprint)
            .and_then(|(_, slot)| *slot)
    }

    pub fn fingerprint_by_slot(&self, slot: u8) -> Option<&str> {
        self.assigned
            .iter()
            .find(|(_, assigned)| *assigned == Some(slot))
            .map(|(fingerprint, _)| fingerprint.as_str())
    }
}

pub fn slot_label(slot: Option<u8>) -> String {
    match slot {
        Some(slot) => slot.to_string(),
        None => "-".to_string(),
    }
}
