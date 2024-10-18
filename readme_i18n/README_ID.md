# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](/README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Tiếng Việt](README_VI.md) • [Portugês Brasil](README_PT_BR.md) • [Italiano](README_IT.md) • [Indonesia](README_ID.md)

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

## Setup

Dalam kebanyakan kasus, LocalSend seharusnya berfungsi langsung tanpa konfigurasi. Namun, jika Anda mengalami masalah dalam mengirim atau menerima file, Anda mungkin perlu mengonfigurasi firewall Anda untuk mengizinkan LocalSend berkomunikasi melalui jaringan lokal Anda.

| Traffic Type | Protocol | Port  | Action |
|--------------|----------|-------|--------|
| Incoming     | TCP, UDP | 53317 | Allow  |
| Outgoing     | TCP, UDP | Any   | Allow  |

Pastikan juga untuk menonaktifkan AP isolation di router Anda. Fitur ini biasanya dinonaktifkan secara default, tetapi beberapa router mungkin mengaktifkannya (terutama pada jaringan tamu).

**Mode Portable**

(Diperkenalkan pada v1.13.0)

Buat file bernama settings.json yang terletak di direktori yang sama dengan file eksekusi aplikasi. File ini bisa dibiarkan kosong. Aplikasi akan menggunakan file ini untuk menyimpan pengaturan daripada lokasi default.

**Start hidden**

(Diperbarui pada v1.15.0)

Untuk memulai aplikasi dalam mode tersembunyi (hanya muncul di tray), gunakan flag --hidden (contoh: localsend_app.exe --hidden).

Pada versi v1.14.0 dan sebelumnya, aplikasi dimulai dalam mode tersembunyi jika flag `autostart` diaktifkan dan pengaturan tersembunyi diaktifkan.

## Cara Kerja

LocalSend menggunakan protokol komunikasi yang aman, memungkinkan perangkat untuk berkomunikasi satu sama lain menggunakan REST API. Semua data dikirim dengan aman melalui HTTPS, dan sertifikat TLS/SSL dihasilkan secara langsung di setiap perangkat, memastikan keamanan maksimum.

Untuk informasi lebih lanjut tentang Protokol LocalSend, lihat [dokumentasi](https://github.com/localsend/protocol).

Berikut terjemahan bagian **Getting Started**, **Contributing**, dan **Building** dari laman README:

---

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

Anda bisa membantu menerjemahkan aplikasi ini ke bahasa lain!

1. Fork repositori ini
2. Pilih salah satu:
   - Menambahkan terjemahan yang hilang dalam bahasa yang ada: Hanya perbarui `_missing_translations_<locale>.json` di [app/assets/i18n][i18n]
   - Memperbaiki terjemahan yang sudah ada: Perbarui `strings_<locale>.i18n.json` di [app/assets/i18n][i18n]
   - Menambahkan bahasa baru: Buat file baru; lihat juga: [kode lokal][].
3. Opsional: Jalankan ulang aplikasi ini
   1. Jalankan `cd app` untuk masuk ke direktori aplikasi.
   2. Pastikan Anda sudah [menjalankan](#memulai) aplikasi ini sekali.
   3. Perbarui terjemahan melalui `flutter pub run slang`
   4. Jalankan aplikasi melalui `flutter run`
   5. Buka pull request

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n  
[kode lokal]: https://saimana.com/list-of-country-locale-code/

**_Catatan:_ Bidang yang dihiasi dengan `@` tidak dimaksudkan untuk diterjemahkan; mereka tidak digunakan dalam aplikasi dan hanya bersifat informatif untuk memberikan konteks kepada penerjemah.**

### Perbaikan Bug dan Peningkatan

- **Perbaikan Bug:** Jika Anda menemukan bug, silakan buat pull request dengan deskripsi jelas tentang masalah dan cara memperbaikinya.
- **Peningkatan:** Punya ide untuk meningkatkan LocalSend? Silakan buat isu terlebih dahulu untuk mendiskusikan mengapa peningkatan tersebut diperlukan.

Untuk informasi lebih lanjut, lihat [panduan kontribusi](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Membangun

Perintah ini ditujukan untuk pemelihara saja.

### Android

APK Tradisional

```bash
flutter build apk
```

AppBundle untuk Google Play

```bash
flutter build appbundle
```

### iOS

```bash
flutter build ipa
```

### macOS

```bash
flutter build macos
```

### Windows

**Tradisional**

```bash
flutter build windows
```

**Aplikasi MSIX Lokal**

```bash
flutter pub run msix:create
```

**Siap untuk Store**

```bash
flutter pub run msix:create --store
```

### Linux

**Tradisional**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Silakan buka pull request. Ada cabang `snap` untuk eksperimen.

## Kontributor

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend" alt="Kontributor LocalSend"/>
</a>

--- 

Jika ada penyesuaian yang diperlukan atau tambahan yang ingin disertakan, beri tahu saya!