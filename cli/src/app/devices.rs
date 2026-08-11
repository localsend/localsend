//! The device list overlay: paired and discovered devices, with the send
//! and unpair actions.

use super::App;
use crate::device_list::{DeviceList, DeviceListOutcome, DeviceRow, Row};
use crate::picker::PickerTarget;
use crate::storage::PairedChannel;
use crate::ui::Category;
use crossterm::event::KeyEvent;
use localsend::discovery::StatefulDevice;

impl App {
    pub(super) fn open_device_list(&mut self) {
        match DeviceList::open(self.device_rows()) {
            Ok(list) => {
                self.ui.suspend();
                self.device_list = Some(list);
            }
            Err(err) => {
                self.ui
                    .log_plain(&format!("Could not open the device list: {err}"));
            }
        }
    }

    /// Builds the rows of the device list: the paired devices (with the
    /// live address of those that are also discovered), then the discovered
    /// devices that are not paired.
    pub(super) fn device_rows(&self) -> Vec<Row> {
        let mut rows = vec![Row::Header("Paired")];
        let mut empty = true;
        for (fingerprint, paired) in self.storage.paired.iter() {
            empty = false;
            let discovered = self.discovery.device_by_fingerprint(fingerprint);
            rows.push(Row::Device(DeviceRow {
                fingerprint: fingerprint.clone(),
                alias: discovered
                    .as_ref()
                    .map(|stored| stored.device.alias.clone())
                    .unwrap_or_else(|| paired.alias.clone()),
                slot: self.slots.get(fingerprint),
                hosts: discovered.as_ref().map(channel_hosts).unwrap_or_default(),
                paired: true,
            }));
        }
        if empty {
            rows.push(Row::Empty);
        }

        rows.push(Row::Spacer);
        rows.push(Row::Header("Discovered"));
        let mut empty = true;
        for stored in self.discovery.devices() {
            if self.storage.paired.contains(&stored.device.fingerprint) {
                continue;
            }
            empty = false;
            rows.push(Row::Device(DeviceRow {
                fingerprint: stored.device.fingerprint.clone(),
                alias: stored.device.alias.clone(),
                slot: self.slots.get(&stored.device.fingerprint),
                hosts: channel_hosts(&stored),
                paired: false,
            }));
        }
        if empty {
            rows.push(Row::Empty);
        }
        rows
    }

    /// Handles a key while the list is open; returns `true` when the
    /// application should quit (the list was cancelled in `--file` mode).
    pub(super) fn handle_device_list_key(&mut self, key: KeyEvent) -> bool {
        let Some(list) = &mut self.device_list else {
            return false;
        };
        match list.handle_key(key) {
            DeviceListOutcome::Open => {}
            DeviceListOutcome::Closed => {
                self.close_device_list();
                return !self.preselected.is_empty();
            }
            DeviceListOutcome::Send { fingerprint } => {
                if self.preselected.is_empty()
                    && let Some(device) = self.discovery.device_by_fingerprint(&fingerprint)
                {
                    // The list stays open until the picker takes over its
                    // alternate screen, so the main screen never shows.
                    self.open_picker(PickerTarget::Device {
                        fingerprint: device.device.fingerprint.clone(),
                        alias: device.device.alias.clone(),
                    });
                } else {
                    self.close_device_list();
                    if !self.preselected.is_empty() {
                        self.start_send(&fingerprint, self.preselected.clone());
                    }
                }
            }
            DeviceListOutcome::Pair { fingerprint } => self.pair(&fingerprint),
            DeviceListOutcome::Unpair { fingerprint } => self.unpair(&fingerprint),
        }
        false
    }

    pub(super) fn close_device_list(&mut self) {
        if let Some(list) = self.device_list.take() {
            list.close();
            self.ui.resume();
        }
    }

    /// Pairs a discovered device; the list stays open and refreshes (the
    /// device moves up into "Paired"). The log line shows up once the list
    /// is closed.
    fn pair(&mut self, fingerprint: &str) {
        let Some(stored) = self.discovery.device_by_fingerprint(fingerprint) else {
            return;
        };
        let alias = stored.device.alias.clone();
        match self.storage.paired.insert(
            fingerprint.to_string(),
            alias.clone(),
            PairedChannel::channels_of(&stored),
        ) {
            Ok(()) => self.ui.log(
                Category::Discovery,
                &format!("{alias}: Paired. Future requests are auto-accepted."),
            ),
            Err(err) => self.ui.log(
                Category::Discovery,
                &format!("{alias}: Paired for this run, but saving failed: {err:#}"),
            ),
        }
        let rows = self.device_rows();
        if let Some(list) = &mut self.device_list {
            list.set_rows(rows);
            list.draw();
        }
    }

    /// Removes a paired device; the list stays open and refreshes (the
    /// device reappears under "Discovered" when it is still around). The
    /// log line shows up once the list is closed.
    fn unpair(&mut self, fingerprint: &str) {
        match self.storage.paired.remove(fingerprint) {
            Ok(Some(device)) => {
                self.ui
                    .log(Category::Discovery, &format!("{}: Unpaired", device.alias));
            }
            Ok(None) => {}
            Err(err) => {
                self.ui.log(
                    Category::Discovery,
                    &format!("Unpaired for this run, but saving failed: {err:#}"),
                );
            }
        }
        let rows = self.device_rows();
        if let Some(list) = &mut self.device_list {
            list.set_rows(rows);
            list.draw();
        }
    }
}

/// The addresses a stored device can be dialed at, best first.
fn channel_hosts(stored: &StatefulDevice) -> Vec<String> {
    stored
        .get_ranked_channels()
        .into_iter()
        .filter_map(|channel| channel.http())
        .map(|http| http.host.clone())
        .collect()
}
