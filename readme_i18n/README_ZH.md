# LocalSend

[![CI 状态][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]
[![Packaging status][packaging-badge]][packaging-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/
[packaging-badge]: https://repology.org/badge/tiny-repos/localsend.svg
[packaging-link]: https://repology.org/project/localsend/versions

[主页][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

> 注意：中文文档更新可能不够及时，请以英文文档为准。

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend 是一个自由、开源的应用程序，允许你在本地网络上安全地与附近设备分享文件和消息，无需互联网连接。

- [关于](#关于)
- [截图](#截图)
- [下载](#下载)
- [工作原理](#工作原理)
- [开始使用](#开始使用)
- [贡献](#贡献)
  - [翻译](#翻译)
  - [Bug修复和改进](#bug修复和改进)
- [故障排查](#故障排查)
- [构建](#构建)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## 关于

LocalSend 是一个跨平台应用程序，使用 REST API 和 HTTPS 加密实现设备之间的安全通信。与依赖外部服务器的其他消息应用程序不同，LocalSend 不需要互联网连接或第三方服务器，因此成为本地通信的快速可靠解决方案。

## 截图

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone截图" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC截图" height="300"/>

## 下载

建议从应用商店或软件包管理器下载该应用，因为该应用没有自动更新功能。

| Windows                  | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|--------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]               | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]                | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]           | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest]  |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]   |                         | [TAR][latest]      |                |               |            |
|                          |                         | [DEB][latest]      |                |               |            |
|                          |                         | [AppImage][latest] |                |               |            |


了解更多关于[发行渠道][]的信息。

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
[发行渠道]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

**兼容性**
| 平台    | 最低版本   | 备注   |
|---------|------------|--------------------------------------------------------------------------------------------------------------------------------|
|Android  | 5.0        | -                                                                                                                              |
|iOS      | 12.0       | -                                                                                                                              |
|macOS    | 11 Big Sur | 请使用 OpenCore Legacy Patcher 2.0.2 （见 [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)） |
|Windows  | 10         | 最后一个支持 Windows 7 的版本是 v1.15.4 。未来也许会将更新的版本向后移植至兼容 Windows 7 。                                       |
|Linux    | 不适用     | -                                                                                                                               |

## 设置

在大多数情况下，LocalSend 应该可以直接使用。但是，如果你在发送或接收文件时遇到问题，可能需要配置防火墙以允许 LocalSend 在你的本地网络上通信。

| 流量类型 | 协议     | 端口  | 操作 |
|----------|----------|-------|------|
| 传入     | TCP, UDP | 53317 | 允许 |
| 传出     | TCP, UDP | 任意  | 允许 |

另外，请确保禁用路由器上的 AP 隔离。通常默认情况下应禁用它，但某些路由器可能会启用它（比如访客网络）。
更多信息见 [故障排查](#故障排查)。

**便携模式**

（在 v1.13.0 中引入）

创建一个名为 `settings.json` 的文件，放置在与可执行文件相同的目录中。
此文件可以为空。
应用程序将使用此文件来存储设置，而不是默认位置。

**隐藏式启动**

（更新于 v1.15.0）

使用 `--hidden` 命令行参数隐藏式启动（只在系统托盘里显示）此应用（例如： `localsend_app.exe --hidden`）。

在 v1.14.0 或更早的版本中，如果设置了 `autostart` 标志，并且启用了隐藏设置，则应用程序将会隐藏式启动。

## 工作原理

LocalSend 使用安全通信协议，允许设备通过 REST API 进行通信。所有数据都通过 HTTPS 安全地发送，并且 TLS/SSL 证书会在每台设备上动态生成，确保最大的安全性。

欲了解更多关于 LocalSend 协议的信息，请参阅[文档](https://github.com/localsend/protocol)。

## 开始使用

要从源代码编译 LocalSend，请按照以下步骤进行操作：

1. 安装 [Flutter](https://flutter.dev)。
2. 安装 [Rust](https://www.rust-lang.org/tools/install)。
3. 克隆 `LocalSend` 代码库。
4. 执行 `cd app` 进入 app 目录。
5. 运行 `flutter pub get` 下载依赖项。
6. 运行 `flutter run` 启动应用程序。

> [!NOTE]
> LocalSend 目前需要老版本的 Flutter （具体见 [.fvmrc](/.fvmrc)）
> 因而一些构建问题也许是系统安装的 Flutter 版本和 LocalSend 所需的 Flutter 版本不一致导致的。
> 为了在开发过程中保持一致性，LocalSend 使用 [fvm](https://fvm.app) 来管理此项目的 Flutter 版本。
> 安装 `fvm` 后，请运行 `fvm flutter` 而非 `flutter` 。

## 贡献

我们欢迎任何有兴趣帮助改进 LocalSend 的人士贡献。如果你想贡献，有几种方式可以参与：

### 翻译

你可以帮助将此应用程序翻译成其他语言。我们使用 [Weblate](https://hosted.weblate.org/projects/localsend/app) 平台来管理翻译。

另外，你也可以 fork 这个仓库并手动添加翻译。

翻译在 [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n) 目录。编辑 `_missing_translations_<locale>.json` 或 `strings_<locale>.i18n.json` 文件来添加或更新翻译。

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_注意：_ 用 `@` 装饰的字段不是用于翻译的；它们在应用程序中没有任何用处，仅仅是关于文件的信息性文本或为翻译者提供上下文。**

### Bug 修复和改进

- **Bug 修复：** 如果发现 bug，请创建一个带有清晰描述问题及解决方法的拉取请求。
- **改进：** 有改进 LocalSend 的想法吗？请先创建一个问题来讨论为什么需要这个改进。

欲了解更多信息，请参阅[贡献指南](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md)。

## 故障排查

| 问题       | 平台（发送端） | 平台（接收端） | 解决办法
|------------|---------------|-----------------|----------------------------------------------------------------------------|
| 设备不可见 | 任何           | 任何            | 确保关闭路由器的AP隔离。如果AP隔离是开着的，设备间的连接会被禁止。            |
| 设备不可见 | 任何           | Windows         | 确保将你的网络配置为“私有”网络。当你的网络为公共网络时 Windows 会更具限制性。 |
| 设备不可见 | macOS, iOS     | 任何            | 尝试在系统设置中的“隐私”下切换“本地网络”权限。                               |
| 速度太慢   | 任何           | 任何            | 使用 5 Ghz 频段；关闭发送和接收端设备的数据加密。                            |
| 速度太慢   | 任何           | 安卓            | 已知的问题。见 https://github.com/flutter-cavalry/saf_stream/issues/4       |

## 贡献者

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend 贡献者"/>
</a>
