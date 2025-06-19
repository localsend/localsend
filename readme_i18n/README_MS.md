# LocalSend

[![Status CI][ci-badge]][ci-workflow]
[![Penterjemahan][translate-badge]][translate-link]
[![Status pembungkusan][packaging-badge]][packaging-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/
[packaging-badge]: https://repology.org/badge/tiny-repos/localsend.svg
[packaging-link]: https://repology.org/project/localsend/versions

[Laman Utama][laman utama] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[Bahasa Inggeris (Lalai)](/README.md) • [Bahasa Melayu](README_MS.md) • [Bahasa Sepanyol](README_ES.md) • [Bahasa Parsi](README_FA.md) • [Bahasa Filipino](README_PH.md) • [Bahasa Perancis](README_FR.md) • [Bahasa Indonesia](README_ID.md) • [Bahasa Itali](README_IT.md) • [Bahasa Jepun](README_JA.md) • [Bahasa Khmer](README_KM.md) • [Bahasa Korea](README_KO.md) • [Bahasa Poland](README_PL.md) • [Bahasa Portugis Brazil](README_PT_BR.md) • [Bahasa Rusia](README_RU.md) • [Bahasa Thai](README_TH.md) • [Bahasa Türkiye](README_TR.md) • [Bahasa Ukraine](README_UK.md) • [Bahasa Vietnam](README_VI.md) • [Bahasa Cina](README_ZH.md)

[laman utama]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend adalah aplikasi sumber terbuka percuma yang membolehkan anda berkongsi fail dan mesej secara terjamin dengan peranti berdekatan melalui rangkaian tempatan anda tanpa memerlukan sambungan internet.

- [Tentang](#tentang)
- [Syot-syot Layar](#syot-syot-layar)
- [Muat Turun](#muat-turun)
- [Bagaimana ia Berfungsi](#bagaimana-ia-berfungsi)
- [Cara Mula](#cara-mula)
- [Mengambil Bahagian](#mengambil-bahagian)
  - [Penterjemahan](#penterjemahan)
  - [Pembetulan Pepijat dan Penambahbaikan](#pembetulan-pepijat-dan-penambahbaikan)
- [Menyelesaikan Masalah](#menyelesaikan-masalah)
- [Membina](#membina)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Tentang

LocalSend adalah aplikasi merentas platform yang membolehkan komunikasi selamat antara peranti-peranti menggunakan REST API dan penyulitan HTTPS. Bukan seperti aplikasi pemesejan lain yang bergantung pada pelayan luaran, LocalSend tidak memerlukan sambungan internet atau pelayan pihak ketiga, menjadikannya penyelesaian yang pantas dan boleh dipercayai untuk komunikasi tempatan.

## Syot-syot Layar

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Muat Turun

[![Status pembungkusan](https://repology.org/badge/tiny-repos/localsend.svg)](https://repology.org/project/localsend/versions)

Adalah digalakkan untuk memuat turun aplikasi sama ada dari gedung aplikasi atau dari pengurus pakej kerana aplikasi ini tidak mempunyai pengemaskinian automatik.

| Windows                  | macOS                    | Linux               | Android         | iOS           | Fire OS    |
|--------------------------|--------------------------|---------------------|-----------------|---------------|------------|
| [Winget][]               | [App Store][]            | [Flathub][]         | [Play Store][]  | [App Store][] | [Amazon][] |
| [Scoop][]                | [Homebrew][]             | [Nixpkgs][]         | [F-Droid][]     |               |            |
| [Chocolatey][]           | [DMG Installer][terkini] | [Snap][]            | [APK][terkini]  |               |            |
| [EXE Installer][terkini] |                          | [AUR][]             |                 |               |            |
| [Portable ZIP][terkini]  |                          | [TAR][terkini]      |                 |               |            |
|                          |                          | [DEB][terkini]      |                 |               |            |
|                          |                          | [AppImage][terkini] |                 |               |            |

Baca lebih lanjut tentang [saluran pengedaran][].

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
[terkini]: https://github.com/localsend/localsend/releases/latest
[saluran pengedaran]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

**Keserasian**

| Platform | Versi Minimum | Nota                                                                                                                                        |
|----------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0           | -                                                                                                                                           |
| iOS      | 12.0          | -                                                                                                                                           |
| macOS    | 11 Big Sur    | Gunakan OpenCore Legacy Patcher 2.0.2 (Lihat [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384))           |
| Windows  | 10            | Versi terakhir yang menyokong Windows 7 ialah v1.15.4. Mungkin terdapat sokongan versi yang lebih baharu untuk Windows 7 pada masa hadapan. |
| Linux    | N.A.          | -                                                                                                                                           |

## Penyediaan

Dalam kebanyakan kes, LocalSend akan berfungsi terus. Walau bagaimanapun, jika anda menghadapi masalah menghantar atau menerima fail, anda mungkin perlu mengkonfigurasi tembok api (_firewall_) anda untuk membenarkan LocalSend berkomunikasi melalui rangkaian tempatan anda.

| Jenis Trafik | Protokol | Port        | Tindakan |
|--------------|----------|-------------|----------|
| Masuk        | TCP, UDP | 53317       | Allow    |
| Keluar       | TCP, UDP | Mana-mana   | Allow    |

Juga pastikan untuk melumpuhkan pengasingan AP pada penghala anda. Ia biasanya dilumpuhkan secara lalai tetapi sesetengah penghala mungkin mendayakannya (terutamanya rangkaian tetamu).
Lihat [penyelesaian masalah](#menyelesaikan-masalah) untuk mendapatkan maklumat lanjut.

**Mod Mudah Alih**

(Diperkenalkan dalam v1.13.0)

Cipta fail bernama `settings.json` yang terletak dalam direktori yang sama dengan atur cara boleh laku.
Fail ini boleh kosong.
Apl akan menggunakan fail ini untuk menyimpan tetapan, bukannya lokasi lalai.

**Memulakan secara tersembunyi**

(Dikemas kini dalam v1.15.0)

Untuk memulakan apl tersembunyi (hanya dalam dulang (_tray_)), gunakan bendera (_flag_) `--hidden` (contoh: `localsend_app.exe --hidden`).

Pada v1.14.0 dan lebih awal, apl mula disembunyikan jika bendera `autostart` ditetapkan dan tetapan tersembunyi didayakan.

## Bagaimana ia Berfungsi

LocalSend menggunakan protokol komunikasi terjamin yang membolehkan peranti berkomunikasi antara satu sama lain menggunakan API REST. Semua data dihantar dengan selamat melalui HTTPS dan sijil TLS/SSL dijana dengan segera pada setiap peranti, memastikan keterjaminan maksimum.

Untuk mendapatkan maklumat lanjut tentang Protokol LocalSend, lihat [dokumentasi](https://github.com/localsend/protocol).

## Cara Mula

Untuk kompil LocalSend daripada kod sumber, ikuti langkah berikut:

1. Pasang Flutter [secara langsung](https://flutter.dev) atau gunakan [fvm](https://fvm.app) (lihat [versi diperlukan](.fvmrc))
2. Pasang [Rust](https://www.rust-lang.org/tools/install)
3. Klon repositori `LocalSend`
4. Jalankan `cd app` untuk memasuki direktori apl
5. Jalankan `flutter pub get` untuk memuat turun kebergantungan
6. Jalankan `flutter run` untuk memulakan apl

> [!NOTA]
> LocalSend pada masa ini memerlukan versi Flutter lama (dinyatakan dalam [.fvmrc](.fvmrc))
> dan dengan itu, isu binaan (_build issue_) mungkin disebabkan oleh ketidakpadanan antara versi Flutter yang diperlukan dan (seluruh sistem) yang dipasang.  
> Untuk menjadikan pembangunan lebih konsisten, LocalSend menggunakan [fvm](https://fvm.app) untuk mengurus versi projek Flutter.
> Selepas memasang `fvm`, jalankan `fvm flutter` dan bukannya `flutter`.

## Mengambil Bahagian

Kami mengalu-alukan sumbangan daripada sesiapa sahaja yang berminat untuk bantu memperbaiki LocalSend. Jika anda ingin menyumbang, terdapat beberapa cara untuk menglibatkan diri:

### Penterjemahan

Anda boleh membantu menterjemahkan LocalSend ke dalam bahasa-bahasa lain. Kami menggunakan platform [Weblate](https://hosted.weblate.org/projects/localsend/app) untuk mengurus penterjemahan.

Secara alternatif, anda juga boleh menyumbang atau mengambil bahagian dengan forking repositori ini dan menambah penterjemahan secara manual.

Terjemahan-terjemahan berada di dalam direktori [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). Sunting fail `_missing_translations_<locale>.json` atau `strings_<locale>.i18n.json` untuk menambah atau mengemas kini terjemahan.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_Ambil perhatian:_ Medan yang dihiasi dengan `@` tidak dimaksudkan untuk diterjemahkan; ia tidak digunakan dalam apl dalam apa jua cara, hanya sebagai teks bermaklumat tentang fail atau untuk memberikan konteks kepada penterjemah.**

### Pembetulan Pepijat dan Penambahbaikan

- **Pembetulan Pepijat:** Jika anda menjumpai pepijat, sila buat permintaan tarik (_pull request_) dengan penerangan yang jelas tentang isu itu dan cara membetulkannya.
- **Penambahbaikan:** Mempunyai idea untuk menambah baik LocalSend? Sila buat isu dahulu untuk membincangkan mengapa penambahbaikan itu diperlukan.

Untuk mengetahui dengan lebih lanjut, rujuk pada [panduan menyumbang](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Menyelesaikan Masalah

| Isu                     | Platform (Menghantar) | Platform (Menerima) | Penyelesaian                                                                                                                                         |
|-------------------------|-----------------------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Peranti tidak kelihatan | Mana-mana             | Mana-mana           | Pastikan untuk melumpuhkan AP-Isolation pada penghala anda. Jika ia didayakan, sambungan antara peranti adalah dilarang.                             |
| Peranti tidak kelihatan | Mana-mana             | Windows             | Pastikan untuk konfigurasi rangkaian anda sebagai rangkaian "peribadi". Windows mungkin lebih ketat apabila rangkaian dikonfigurasikan sebagai awam. |
| Peranti tidak kelihatan | macOS, iOS            | Mana-mana           | Anda boleh cuba menogol kebenaran "Rangkaian Tempatan" di bawah "Privasi" dalam tetapan OS.                                                          |
| Kelajuan terlalu lembab | Mana-mana             | Mana-mana           | Gunakan 5 Ghz; Lumpuhkan penyulitan pada kedua-dua peranti.                                                                                          |
| Kelajuan terlalu lembab | Mana-mana             | Android             | Isu yang diketahui. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                           |

## Membina

Perintah-perintah (_commands_) ini bertujuan untuk penyelenggara sahaja.

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

**Apl MSIX Tempatan**

```bash
flutter pub run msix:create
```

**Sedia untuk Store**

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

Arahan di [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## Penyumbang yang Berbakti

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Penyumbang Localsend"/>
</a>
