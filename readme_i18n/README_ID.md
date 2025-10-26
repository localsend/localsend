# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend adalah aplikasi gratis dan sumber terbuka yang memungkinkan Anda berbagi file dan pesan dengan aman ke perangkat terdekat melalui jaringan lokal tanpa memerlukan koneksi internet.

- [Tentang](#tentang)
- [Screenshots](#screenshots)
- [Unduh](#unduh)
- [Cara Kerja](#cara-kerja)
- [Memulai](#memulai)
- [Berkontribusi](#berkontribusi)
  - [Terjemahan](#terjemahan)
  - [Perbaikan Bug dan Peningkatan](#perbaikan-bug-dan-peningkatan)
- [Membangun](#membangun)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Tentang

LocalSend adalah aplikasi lintas platform yang memungkinkan komunikasi aman antar perangkat menggunakan REST API dan enkripsi HTTPS. Berbeda dengan aplikasi pesan lainnya yang mengandalkan server eksternal, LocalSend tidak memerlukan koneksi internet atau server pihak ketiga, menjadikannya solusi yang cepat dan andal untuk komunikasi lokal.

## Screenshots

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Unduh

Disarankan untuk mengunduh aplikasi ini melalui toko aplikasi atau manajer paket, karena aplikasi ini tidak memiliki fitur pembaruan otomatis.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Read more about [distribution channels][].

[windows store]: https://www.microsoft.com/store/apps/9NCB4Z0TZ6RR
[app store]: https://apps.apple.com/us/app/localsend/id1661733229
[play store]: https://play.google.com/store/apps/details?id=org.localsend.localsend_app
[f-droid]: https://f-droid.org/packages/org.localsend.localsend_app
[amazon]: https://www.amazon.com/dp/B0BW6MP732
[winget]: https://github.com/microsoft/winget-pkgs/tree/master/manifests/l/LocalSend/LocalSend
[scoop]: https://scoop.sh/#/apps?s=0&d=1&o=true&q=localsend&id=fb88113be361ca32c0dcac423cb4afdeda0b0c66
[chocolatey]: https://community.chocolatey.org/packages/localsend
[homebrew]: https://formulae.brew.sh/cask/localsend
[flathub]: https://flathub.org/apps/details/org.localsend.localsend_app
[nixpkgs]: https://search.nixos.org/packages?show=localsend
[snap]: https://snapcraft.io/localsend
[aur]: https://aur.archlinux.org/packages/localsend-bin
[latest]: https://github.com/localsend/localsend/releases/latest
[distribution channels]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

**Kompatibilitas**

| Platform | Versi Minimum | Catatan                                                                                                                     |
|----------|---------------|-----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0           | -                                                                                                                           |
| iOS      | 12.0          | -                                                                                                                           |
| macOS    | 11 Big Sur    | Gunakan OpenCore Legacy Patcher 2.0.2 (Lihat [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows  | 10            | Versi terakhir yang mendukung Windows 7 adalah v1.15.4. Mungkin ada backport versi lebih baru untuk Windows 7 di masa depan. |
| Linux    | N.A.          | Dependensi: Gnome: `xdg-desktop-portal` dan `xdg-desktop-portal-gtk`, KDE: `xdg-desktop-portal` dan `xdg-desktop-portal-kde` |

## Setup

Dalam kebanyakan kasus, LocalSend seharusnya berfungsi langsung tanpa konfigurasi. Namun, jika Anda mengalami masalah dalam mengirim atau menerima file, Anda mungkin perlu mengonfigurasi firewall Anda untuk mengizinkan LocalSend berkomunikasi melalui jaringan lokal Anda.

| Traffic Type | Protocol | Port  | Action |
|--------------|----------|-------|--------|
| Incoming     | TCP, UDP | 53317 | Allow  |
| Outgoing     | TCP, UDP | Any   | Allow  |

Pastikan juga untuk menonaktifkan AP isolation di router Anda. Fitur ini biasanya dinonaktifkan secara default, tetapi beberapa router mungkin mengaktifkannya (terutama pada jaringan tamu).

**Mode Portable**

(Diperkenalkan pada v1.13.0)

Buat file bernama `settings.json` yang terletak di direktori yang sama dengan file eksekusi aplikasi. File ini bisa dibiarkan kosong. Aplikasi akan menggunakan file ini untuk menyimpan pengaturan daripada lokasi default.

**Mulai tersembunyi**

(Diperbarui pada v1.15.0)

Untuk memulai aplikasi dalam mode tersembunyi (hanya muncul di tray), gunakan flag --hidden (contoh: localsend_app.exe --hidden).

Pada versi v1.14.0 dan sebelumnya, aplikasi dimulai dalam mode tersembunyi jika flag `autostart` diaktifkan dan pengaturan tersembunyi diaktifkan.

## Cara Kerja

LocalSend menggunakan protokol komunikasi yang aman, memungkinkan perangkat untuk berkomunikasi satu sama lain menggunakan REST API. Semua data dikirim dengan aman melalui HTTPS, dan sertifikat TLS/SSL dihasilkan secara langsung di setiap perangkat, memastikan keamanan maksimum.

Untuk informasi lebih lanjut tentang Protokol LocalSend, lihat [dokumentasi](https://github.com/localsend/protocol).

## Memulai

Untuk mengompilasi LocalSend dari kode sumber, ikuti langkah-langkah berikut:

1. Instal Flutter [langsung](https://flutter.dev) atau menggunakan [fvm](https://fvm.app) (lihat [versi yang diperlukan](.fvmrc))
2. Clone repositori `LocalSend`
3. Jalankan `cd app` untuk masuk ke direktori aplikasi
4. Jalankan `flutter pub get` untuk mengunduh dependensi
5. Jalankan `flutter run` untuk memulai aplikasi

> [!CATATAN]  
> Saat ini LocalSend memerlukan versi Flutter yang lebih lama (disebutkan dalam [.fvmrc](.fvmrc)) dan masalah build dapat terjadi karena ketidakcocokan antara versi Flutter yang diperlukan dan yang terinstal di sistem.  
> Untuk membuat pengembangan lebih konsisten, LocalSend menggunakan [fvm](https://fvm.app) untuk mengelola versi Flutter proyek.  
> Setelah menginstal `fvm`, jalankan `fvm flutter` alih-alih `flutter`.

## Berkontribusi

Kami menerima kontribusi dari siapa pun yang tertarik untuk membantu meningkatkan LocalSend. Jika Anda ingin berkontribusi, ada beberapa cara untuk terlibat:

### Terjemahan

Anda dapat membantu menerjemahkan LocalSend ke bahasa lain! **Cara yang direkomendasikan**: Gunakan platform [Weblate](https://hosted.weblate.org/projects/localsend/app) untuk mengelola terjemahan.

**Alternatif**: Anda juga dapat berkontribusi dengan mem-fork repository ini dan menambahkan terjemahan secara manual.

Terjemahan terletak di direktori [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). Edit file `_missing_translations_<locale>.json` atau `strings_<locale>.i18n.json` untuk menambah atau memperbarui terjemahan.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Status terjemahan" />
</a>

**_Catatan:_ Bidang yang dihiasi dengan `@` tidak dimaksudkan untuk diterjemahkan; mereka tidak digunakan dalam aplikasi dan hanya bersifat informatif untuk memberikan konteks kepada penerjemah.**

### Perbaikan Bug dan Peningkatan

- **Perbaikan Bug:** Jika Anda menemukan bug, silakan buat pull request dengan deskripsi jelas tentang masalah dan cara memperbaikinya.
- **Peningkatan:** Punya ide untuk meningkatkan LocalSend? Silakan buat isu terlebih dahulu untuk mendiskusikan mengapa peningkatan tersebut diperlukan.

Untuk informasi lebih lanjut, lihat [panduan kontribusi](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Pemecahan Masalah

| Masalah              | Platform (Pengirim) | Platform (Penerima) | Solusi                                                                                                                                  |
|----------------------|---------------------|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Perangkat tidak terlihat | Semua               | Semua               | Pastikan untuk menonaktifkan AP-Isolation pada router Anda. Jika diaktifkan, koneksi antar perangkat akan dilarang.                     |
| Perangkat tidak terlihat | Semua               | Windows             | Pastikan untuk mengonfigurasi jaringan Anda sebagai jaringan "pribadi". Windows mungkin lebih ketat saat jaringan dikonfigurasi sebagai publik. |
| Perangkat tidak terlihat | macOS, iOS          | Semua               | Anda dapat mencoba mengaktifkan/menonaktifkan izin "Local Network" di bawah "Privacy" di pengaturan OS.                                 |
| Kecepatan terlalu lambat | Semua               | Semua               | Gunakan 5 GHz; Nonaktifkan enkripsi pada kedua perangkat                                                                                |
| Kecepatan terlalu lambat | Semua               | Android             | Masalah yang diketahui. https://github.com/flutter-cavalry/saf_stream/issues/4                                                          |

