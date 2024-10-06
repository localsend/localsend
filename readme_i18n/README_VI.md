# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Trang chủ][homepage]•[Discord][discord]•[GitHub][github]•[Codeberg][codeberg]

[English](/README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Tiếng Việt](README_VI.md) • [Portugês Brasil](README_PT_BR.md) • [Italiano](README_IT.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend là một ứng dụng mã nguồn mở miễn phí cho phép bạn chia sẻ tệp và tin nhắn một cách an toàn với các thiết bị lân cận qua mạng cục bộ mà không cần kết nối Internet.

- [About](#about)
- [Ảnh chụp màn hình](#ảnh-chụp-màn-hình)
- [Tải xuống](#tải-xuống)
- [Nó hoạt động như thế nào](#nó-hoạt-động-như-thế-nào)
- [Bắt đầu](#bắt-đầu)
- [Đóng góp](#đóng-góp)
  - [Dịch thuật](#dịch-thuật)
  - [Sửa lỗi và cải tiến](#sửa-lỗi-và-cải-tiến)
- [Xây dựng](#xây-dựng)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## About

LocalSend là một ứng dụng đa nền tảng cho phép liên lạc an toàn giữa các thiết bị bằng cách sử dụng API REST và mã hóa HTTPS. Không giống như các ứng dụng nhắn tin khác dựa trên máy chủ bên ngoài, LocalSend không yêu cầu kết nối Internet hoặc máy chủ của bên thứ ba, khiến ứng dụng này trở thành giải pháp nhanh chóng và đáng tin cậy cho liên lạc nội bộ.

## Ảnh chụp màn hình

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/><img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Tải xuống

Bạn nên tải xuống ứng dụng từ cửa hàng ứng dụng hoặc từ trình quản lý gói vì ứng dụng không có tính năng tự động cập nhật.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
| ----------------------- | ----------------------- | ------------------ | -------------- | ------------- | ---------- |
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Đọc thêm về [distribution channels][].

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

## Cài đặt

Trong hầu hết các trường hợp, LocalSend sẽ hoạt động tốt. Tuy nhiên, nếu gặp sự cố khi gửi hoặc nhận tệp, bạn có thể cần định cấu hình tường lửa để cho phép LocalSend liên lạc qua mạng cục bộ của mình.

| Traffic Type | Protocol | Port  | Action |
| ------------ | -------- | ----- | ------ |
| Incoming     | TCP, UDP | 53317 | Allow  |
| Outgoing     | TCP, UDP | Any   | Allow  |

Đồng thời đảm bảo tắt tính năng cách ly AP trên bộ định tuyến của bạn. Nó thường bị tắt theo mặc định nhưng một số bộ định tuyến có thể đã bật nó (đặc biệt là các mạng khách).

**Chế độ di động**

(Được giới thiệu trong v1.13.0)

Tạo một tập tin có tên`settings.json`nằm trong cùng thư mục với tệp thực thi.
Tập tin này có thể trống.
Ứng dụng sẽ sử dụng tệp này để lưu trữ cài đặt thay vì vị trí mặc định.

**Bắt đầu ẩn**

(Cập nhật trong v1.15.0)

Để khởi động ứng dụng ẩn (chỉ trong khay), hãy sử dụng`--hidden`cờ (ví dụ:`localsend_app.exe --hidden`).

Trên v1.14.0 trở về trước, ứng dụng sẽ bắt đầu ẩn nếu`autostart`cờ được đặt và cài đặt ẩn được bật.

## Nó hoạt động như thế nào

LocalSend sử dụng giao thức liên lạc an toàn cho phép các thiết bị liên lạc với nhau bằng API REST. Tất cả dữ liệu được gửi an toàn qua HTTPS và chứng chỉ TLS/SSL được tạo nhanh chóng trên mỗi thiết bị, đảm bảo tính bảo mật tối đa.

Để biết thêm thông tin về Giao thức LocalSend, hãy xem phần[tài liệu](https://github.com/localsend/protocol).

## Bắt đầu

Để biên dịch LocalSend từ mã nguồn, hãy làm theo các bước sau:

1.  Cài đặt Flutter[trực tiếp](https://flutter.dev)hoặc sử dụng[fvm](https://fvm.app) (see [phiên bản cần thiết](.fvmrc))
2.  Sao chép`LocalSend`kho lưu trữ
3.  Chạy`cd app`để vào thư mục ứng dụng
4.  Chạy`flutter pub get`để tải xuống các phần phụ thuộc
5.  Chạy`flutter run`để khởi động ứng dụng

> [!GHI CHÚ]LocalSend hiện yêu cầu phiên bản Flutter cũ hơn (được chỉ định trong[.fvmrc](.fvmrc))
> và do đó, các sự cố xây dựng có thể xảy ra do sự không khớp giữa phiên bản Flutter được cài đặt và yêu cầu (toàn hệ thống).  
> Để phát triển nhất quán hơn, LocalSend sử dụng[fvm](https://fvm.app)để quản lý phiên bản Flutter của dự án.
> Sau khi cài đặt`fvm`, chạy`fvm flutter`thay vì`flutter`.

## Đóng góp

Chúng tôi hoan nghênh sự đóng góp từ bất kỳ ai quan tâm đến việc giúp cải thiện LocalSend. Nếu bạn muốn đóng góp, có một số cách để tham gia:

### Dịch thuật

Bạn có thể giúp dịch ứng dụng này sang các ngôn ngữ khác!

1.  Ngã ba kho lưu trữ này
2.  Chọn một
    - Thêm bản dịch còn thiếu trong các ngôn ngữ hiện có: Chỉ cập nhật`_missing_translations_<locale>.json`TRONG[ứng dụng/tài sản/i18n][i18n]
    - Sửa các bản dịch hiện có: Cập nhật`strings_<locale>.i18n.json`TRONG[ứng dụng/tài sản/i18n][i18n]
    - Thêm ngôn ngữ mới: Tạo một tệp mới; xem thêm:[mã địa phương][].
3.  Tùy chọn: Chạy lại ứng dụng này
    1.  Chạy`cd app`để vào thư mục ứng dụng.
    2.  Hãy chắc chắn rằng bạn có[chạy](#getting-started)ứng dụng này một lần.
    3.  Cập nhật bản dịch qua`flutter pub run slang`
    4.  Chạy ứng dụng qua`flutter run`
    5.  Mở một yêu cầu kéo

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[locale codes]: https://saimana.com/list-of-country-locale-code/

**_Hãy lưu ý:_ Cánh đồng được trang trí bằng`@`không có nghĩa là được dịch; chúng không được sử dụng trong ứng dụng dưới bất kỳ hình thức nào mà chỉ đơn thuần là văn bản cung cấp thông tin về tệp hoặc cung cấp ngữ cảnh cho người dịch.**

### Sửa lỗi và cải tiến

- **Sửa lỗi:** Nếu bạn tìm thấy lỗi, vui lòng tạo yêu cầu kéo với mô tả rõ ràng về sự cố và cách khắc phục.
- **Cải tiến:** Bạn có ý tưởng về cách cải thiện LocalSend? Vui lòng tạo một vấn đề trước để thảo luận lý do tại sao cần cải thiện.

Để biết thêm thông tin, xem[hướng dẫn đóng góp](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Xây dựng

Các lệnh này chỉ dành cho người bảo trì.

### Android

Traditional APK

```bash
flutter build apk
```

AppBundle for Google Play

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

**Traditional**

```bash
flutter build windows
```

**Local MSIX App**

```bash
flutter pub run msix:create
```

**Store ready**

```bash
flutter pub run msix:create --store
```

### Linux

**Traditional**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Hãy thoải mái mở một yêu cầu kéo. có một`snap`nhánh để chơi.

## Contributors

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>