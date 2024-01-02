## 1.14.0 (unreleased)

- fix: picking many files should not freeze the UI (@Tienisto)
- i18n: add Danish (@Limfjorden)

## 1.13.1 (2023-12-08)

- feat: add a short delay when "Auto Finish" is enabled (@Tienisto)
- feat: automatically update the device name of favorite devices when they were unchanged by the user (@Tienisto)
- feat: expand file picker buttons if the button text is too long (@Tienisto)
- fix: various crash issues by downgrading Flutter from 3.16 to 3.13 (@Tienisto)

## 1.13.0 (2023-12-04)

- feat: add option to automatically finish after successful transfer (@Tienisto)
- feat: show favorite name in the device list if marked as favorite (@Tienisto)
- feat: ignore duplicate files when selected from file picker (@programmermager)
- feat: add donation options (@Tienisto)
- feat: add Yaru theme (@Tienisto)
- feat(desktop): uses `settings.json` located next to the executable if available for portable mode (@Tienisto)
- feat(windows): make windows icon sharper (@Tienisto, @sergd88)
- feat(macos): add Command+W shortcut to close the window (@Q1CHENL)
- fix: also show an OLED color mode option when dynamic colors are not supported by OS (@dhruvanbhalara)
- fix: sync button should spin right away when clicked (@Tienisto)
- fix(android): request permission when saving files outside of downloads folder (@Tienisto)
- fix(ios): fix permission error when picking directory (@Tienisto)
- fix(ios): clear cache when file is shared from another app (@Tienisto)
- i18n: add Greek (@multipetros), Khmer (@nidexingg)

## 1.12.0 (2023-10-25)

- feat: add favorites (@Tienisto)
- feat: add OLED color mode (@Tienisto)
- feat: show dialog before clearing history (@pantshaswat, @Tienisto)
- feat: show clear button in apk picker search bar (@Tienisto)
- feat: use better colors for the toggle switches in the settings (@gitstart)
- feat: drastically improve GPU usage by optimizing the spin animation (@Tienisto)
- feat(desktop): support pasting from clipboard (@gitstart, @Tienisto)
- feat(linux): allow disabling client side decorations on Wayland (@I-Want-ToBelieve)
- feat(android): use high framerate on devices that lock at 60 Hz like on some OnePlus phones (@Tienisto)
- fix(desktop): fallback to "$HOME/Downloads" when default downloads folder is unavailable (@Sqbika)
- i18n: add Vietnamese (@faea726), Thai (@watchakorn-18k), Basque (@xezpeleta)

## 1.11.1 (2023-09-04)

- feat: hide color setting when dynamic colors are not supported (@Tienisto)
- feat(linux): use white icon for the linux tray (@GaryElshaw, @Tienisto)
- fix: possible race condition leading to zero total files (@Tienisto)
- fix(android): navigation bar color on Android 9 and earlier (@Tienisto)
- fix(android): add `requestLegacyExternalStorage` again (that was removed in 1.11.0) (@Tienisto)
- fix(linux): do not use zenity dependency anymore for file picker (@Tienisto)

## 1.11.0 (2023-08-28)

- feat: optionally enable HTTPS (encryption) when share via link (@Tienisto)
- feat: use switches instead of dropdowns for settings (@forecaster-cyber)
- feat: tapping on scan button clears found devices (@Tienisto)
- feat: text message dialog is multiline only (@Tienisto)
- feat: add option to disable animations (@Tienisto)
- feat: add option to not save to history (@Tienisto)
- feat: add option to customize device model (@Tienisto)
- feat(desktop): bind "ESC" key to go to the previous page (@RiverTwilight, @Tienisto)
- feat(android, ios): open link in new browser tab (@Tienisto)
- feat(linux): enable autostart feature (@TheGB0077)
- fix(android, ios): Save GIFs and image metadata (@natsuk4ze)
- fix(android, ios): handle decline permission when picking files (@Tienisto)
- fix(desktop): GPU usage when hidden to tray (@Tienisto)

## 1.10.0 (2023-06-02)

- feat: dynamic colors (Material You) (@Tienisto)
- feat(android): sharing APKs includes version in file name (@Tienisto)
- feat(windows): restore Windows 7 support (@Tienisto)
- feat(windows): use specialized fonts for Chinese, Japanese and Korean (@graphemecluster, @Tienisto)
- fix: cancellation fixes during active file transfer (@SelaseKay)
- fix(windows): possible settings corruption (@TheGB0077, @Tienisto)
- fix(android): get downloads directory correctly (@Tienisto)
- fix(ios): could not save HEIC files (@Tienisto)

## 1.9.1 (2023-05-05)

- feat: add folder should include the folder itself
- fix: handle file names with special characters in link share mode
- fix(android): fix status bar icon color after picking a media file
- fix(linux): add libayatana-appindicator3-1 to AppImage dependencies (by @TheGB0077)

## 1.9.0 (2023-04-23)

- feat: directory share
- feat: share via browser link (for non-LocalSend users)
- feat: add "delete from history" button when file could not be opened (by @TheGB0077)
- feat: close message request when copied / opened link
- feat: slightly improve transfer speed
- feat: implement LocalSend protocol v2 with v1 fallback
- feat: scan (sync) button automatically scans all network interfaces when count < 3
- feat(android, ios): add "Save to gallery" setting button in file receive options
- feat(desktop): move troubleshoot out of navigation into send page
- feat(desktop): save last window position (by @TheGB0077)
- feat(android): enable edge-to-edge mode
- feat(android): add monochrome app icons for Android 13 (by @h9419)
- feat(android): set custom download path
- feat(linux): enable system tray (by @TheGB0077)
- fix: in multi-recipient mode, retrying causes a "canceled by sender" on the recipient device
- fix: clear selection after finished message transfer
- fix(ios): could not scan local network on iOS 14+ (by @TheGB0077)
- fix(android, ios): fallback asset picker strings to English translation (by @TheGB0077)
- fix(linux): header bar glitches
- i18n: add fa

## 1.8.0 (2023-03-05)

- feat: add send modes (single recipient, multiple recipients)
- feat: selection gets cleared after finish by default (part of send modes feature)
- feat: share to multiple recipients in parallel
- feat: add troubleshoot page
- feat: add 2 buttons to receive history: open folder + delete history
- feat: cleanup scan UI by hiding multiple network interfaces inside the scan button
- feat: edit text message in selected files
- feat: improve device discovery by answering with TCP instead of UDP
- feat(ex. iOS): pressing destination directory in progress page will open the directory
- feat(android): share apk and install apk
- feat(android): Android TV support
- feat(android): show loading indicator when picking (large) files
- feat(windows): left click on tray icon opens app
- feat(linux): add Control+Q shortcut to exit app
- fix: handshake error in unencrypted mode
- fix: also scan multicast when pressing on a subnet sync button
- fix(android): missing app icon on Android 7
- fix(android,ios): show error message when saving to gallery failed
- i18n: add bn, nl, uk

## 1.7.0 (2023-02-11)

- feat: improve device discovery by enabling multicast
- feat: received files history
- feat: show recent IP addresses in manual IP input
- feat: separate language settings page
- feat: message input is horizontally scrollable when multiline is unselected
- feat: open message normally in QuickSave mode (instead of saving it into a file)
- feat: improve error handling and add possibility to show exact error message for debugging
- feat: add unencrypted HTTP mode (for debugging)
- feat(android): keep file name when saving to photos
- feat(desktop): use bigger default window size if display is big enough
- feat(windows): use "Microsoft YaHei UI" font in Windows which works better with Chinese characters
- fix: cache cleanup on iOS
- i18n: add ar, es-ES, fr-FR, hu, in, it, iw, ja, ko, ne, pl, pt-BR, ru, sv, tr, zh-Hant-HK, zh-Hant-TW (Thanks to all the contributors!)

## 1.6.2 (2023-01-28)

- fix(desktop): close current instance when another is already open
- fix: cannot receive files when Chinese language is active
- fix(android, ios): share files with non-English names

## 1.6.1 (2023-01-27)

- fix(windows): app crashes when minimized to tray
- fix(android, ios): share intent sometimes not working
- fix(android, ios): scan not triggered when coming from share intent
- fix(android, ios): share intent produced duplicates after finishing a transfer

## 1.6.0 (2023-01-27)

- feat: show thumbnail in progress page
- feat: improve cache clearing mechanism
- feat: hashtag input now tries all combinations when multiple subnets are given
- feat(desktop): show dialog instead of bottom sheet when adding files
- feat(windows, mac): minimize to tray
- feat(windows): launch on login
- feat: add multiline toggle to message input
- fix: show correct file count in progress page
- fix: add self-discovering prevention
- i18n: add Simplified Chinese

## 1.5.2 (2023-01-14)

- F-Droid Release

## 1.5.1 (2023-01-10)

- fix(windows): app sometimes crash on start

## 1.5.0 (2023-01-09)

- feat: quick save mode
- feat: accept requests partially
- feat: set destination directory during accept phase
- feat: rename incoming files
- feat: keep screen on during file transfer
- feat: tap to open selected file before sending

## 1.4.0 (2023-01-06)

- feat: support multiple local IP addresses
- feat: detect if message is a link and add a button to open the link

## 1.3.1 (2023-01-03)

- fix: local IP sometimes not found

## 1.3.0 (2023-01-03)

- feat: enter custom target address
- feat: tap to open received file
- feat: responsive UI
- feat(ios): receive share intent
- feat(windows): set destination folder
- fix: update nearby device attributes when scan again

## 1.2.0 (2022-12-31)

- feat: drag and drop files
- feat: share plain messages
- feat(android): receive share intent

## 1.1.0 (2022-12-30)

- feat(android): add media picker
- feat(ios): merge image and video to common media picker
- fix(android): missing internet permission

## 1.0.0 (2022-12-29)

- Initial Release
