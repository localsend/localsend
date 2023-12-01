# LocalSend

[![CI状态][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[主页][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]


[English](README.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend 是一个免费、开源的应用程序，允许你在本地网络上安全地与附近设备共享文件和消息，无需互联网连接。

- [关于](#关于)
- [截图](#截图)
- [下载](#下载)
- [设置](#设置)
- [工作原理](#工作原理)
- [开始使用](#开始使用)
- [贡献](#贡献)
  - [翻译](#翻译)
  - [Bug修复和改进](#bug修复和改进)
- [构建](#构建)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)
- [贡献者](#贡献者)

## 关于

LocalSend 是一个跨平台应用程序，使用REST API和HTTPS加密实现设备之间的安全通信。与依赖外部服务器的其他消息应用程序不同，LocalSend 不需要互联网连接或第三方服务器，因此成为本地通信的快速可靠解决方案。

## 截图

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone截图" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC截图" height="300"/>

## 下载

建议从应用商店或软件包管理器下载该应用，因为该应用没有自动更新功能。

| Windows                  | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|--------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]               | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]                | [Homebrew][]            | [AUR][]            | [F-Droid][]    |               |            |
| [Chocolatey][]           | [DMG Installer][latest] | [NixOS][]          | [APK][latest]  |               |            |
| [MSIX Installer][latest] |                         | [TAR][latest]      |                |               |            |
| [EXE Installer][latest]  |                         | [DEB][latest]      |                |               |            |
| [Portable ZIP][latest]   |                         | [AppImage][latest] |                |               |            |


了解更多关于[发行渠道][]的信息。

[windows store]: https://www.microsoft.com/store/apps/9NCB4Z0TZ6RR
[app store]: https://apps.apple.com/us/app/localsend/id1661733229
[play store]: https://play.google.com/store/apps/details?id=org.localsend.localsend_app
[f-droid]: https://f-droid.org/packages/org.localsend.localsend_app
[amazon]: https://www.amazon.com/dp/B0BW6MP732
[winget]: https://github.com/microsoft/winget-pkgs/tree/master/manifests/l/LocalSend/LocalSend
[scoop]: https://scoop.sh/#/apps?s=0&d=1&o=true&q=localsend&id=fb88113be361ca32c0dcac423cb4afdeda0b0c66
[chocolatey]: https://community.chocolatey.org/packages/localsend
[homebrew]: https://github.com/localsend/homebrew-localsend
[flathub]: https://flathub.org/apps/details/org.localsend.localsend_app
[aur]: https://aur.archlinux.org/packages/localsend-bin
[nixos]: https://search.nixos.org/packages?show=localsend
[latest]: https://github.com/localsend/localsend/releases/latest
[发行渠道]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

## 设置

在大多数情况下，LocalSend 应该可以直接使用。但是，如果你在发送或接收文件时遇到问题，可能需要配置防火墙以允许 LocalSend 在你的本地网络上通信。

| 流量类型 | 协议 | 端口  | 操作 |
|---------|------|------|------|
| 传入     | TCP, UDP | 53317 | 允许  |
| 传出     | TCP, UDP | 任意   | 允许  |

**便携模式**

（在 v1.13.0 中引入）

创建一个名为 `settings.json` 的文件，放置在与可执行文件相同的目录中。
此文件可以为空。
应用程序将使用此文件来存储设置，而不是默认位置。

## 工作原理

LocalSend 使用安全通信协议，允许设备通过 REST API 进行通信。所有数据都通过 HTTPS 安全地发送，并且 TLS/SSL 证书会在每台设备上动态生成，确保最大的安全性。

欲了解更多关于 LocalSend 协议的信息，请参阅[文档](https://github.com/localsend/protocol)。

## 开始使用

要从源代码编译 LocalSend，请按照以下步骤进行操作：

1. 安装 [Flutter](https://flutter.dev)。
2. 克隆 LocalSend 代码库。
3. 执行 `cd app` 进入 app 目录。
4. 运行 `flutter pub get` 下载依赖项。
5. 运行 `flutter run` 启动应用程序。

可能的问题是所需的 Flutter 版本与已安装的 Flutter 版本不匹配。

LocalSend 使用 [fvm](https://fvm.app) 管理项目的 Flutter 版本（在 [.fvm/fvm_config.json](.fvm/fvm_config.json) 中指定）。安装后，运行 `fvm flutter` 而不是 `flutter`。

## 贡献

我们欢迎任何有兴趣帮助改进 LocalSend 的人士贡献。如果你想贡献，有几种方式可以参与：

### 翻译

你可以帮助将此应用程序翻译成其他语言！

1. Fork 此代码库
2. 选择一种方式
   - 在现有语言中添加缺失的翻译：只需更新 [app/assets/i18n][i18n] 中的 `_missing_translations_<locale>.json`
   - 修复现有的翻译：更新 [app/assets/i18n][i18n] 中的 `strings_<locale>.i18n.json`
   - 添加新的语言：创建一个新文件；参见：[语言代码][locale codes]。
3. 可选步骤：重新运行此应用程序
   1. 执行 `cd app` 进入 app 目录。
   2. 确保你已经 [运行](#getting-started) 过此应用程序一次。
   3. 通过 `flutter pub run slang` 更新翻译
   4. 通过 `flutter run` 运行应用程序
   5. 提交拉取请求

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[locale codes]: https://saimana.com/list-of-country-locale-code/

**_注意：_ 用 `@` 装饰的字段不是用于翻译的；它们在应用程序中没有任何用处，仅仅是关于文件的信息性文本或为翻译者提供上下文。**

### Bug修复和改进

- **Bug 修复：** 如果发现 bug，请创建一个带有清晰描述问题及解决方法的拉取请求。
- **改进：** 有改进 LocalSend 的想法吗？请先创建一个问题来讨论为什么需要这个改进。

欲了解更多信息，请参阅[贡献指南](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md)。

## 构建

这些命令仅供维护者使用。

### Android

传统 APK

```bash
flutter build apk
```

Google Play 的 AppBundle

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

**传统**

```bash
flutter build windows
```

**本地 MSIX 应用**

```bash
flutter pub run msix:create
```

**微软商店分发包**

```bash
flutter pub run msix:create --store
```

### Linux

**传统**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

欢迎提交拉取请求。有一个 `snap` 分支可以尝试使用。

## 贡献者

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend 贡献者"/>
</a>