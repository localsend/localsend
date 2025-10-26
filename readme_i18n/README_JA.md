# LocalSend

[![CI ステータス][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[ホームページ][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSendは、インターネット接続を必要とせずに、ローカルネットワーク上で近くのデバイスとファイルやメッセージを安全に共有できる、無料のオープンソースアプリです。

- [概要](#概要)
- [スクリーンショット](#スクリーンショット)
- [ダウンロード](#ダウンロード)
- [仕組み](#仕組み)
- [始め方](#始め方)
- [貢献](#貢献)
  - [翻訳](#翻訳)
  - [バグ修正と改善](#バグ修正と改善)
- [ビルド](#ビルド)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## 概要

LocalSendは、REST APIとHTTPS暗号化を使用してデバイス間の安全な通信を可能にするクロスプラットフォームアプリです。他のメッセージングアプリが外部サーバーに依存するのとは異なり、LocalSendはインターネット接続やサードパーティのサーバーを必要とせず、ローカル通信のための迅速で信頼性の高いソリューションとなります。

## スクリーンショット

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhoneのスクリーンショット" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PCのスクリーンショット" height="300"/>

## ダウンロード

アプリには自動更新機能がないため、アプリストアまたはパッケージマネージャーからアプリをダウンロードすることをお勧めします。

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

[distribution channels]について詳しく読む。

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

**互換性**

| プラットフォーム | 最小バージョン | 備考                                                                                                                        |
|----------|-----------------|-----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                           |
| iOS      | 12.0            | -                                                                                                                           |
| macOS    | 11 Big Sur      | OpenCore Legacy Patcher 2.0.2を使用してください（[#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)を参照） |
| Windows  | 10              | Windows 7をサポートする最後のバージョンはv1.15.4です。将来、Windows 7用の新しいバージョンのバックポートがある可能性があります。   |
| Linux    | N.A.            | 依存関係: Gnome: `xdg-desktop-portal` および `xdg-desktop-portal-gtk`, KDE: `xdg-desktop-portal` および `xdg-desktop-portal-kde` |

## 仕組み

LocalSendは、デバイスがREST APIを使用して通信できる安全な通信プロトコルを使用しています。すべてのデータはHTTPSで安全に送信され、TLS/SSL証明書は各デバイスで動的に生成され、最大限のセキュリティを確保します。

LocalSendプロトコルの詳細については、[ドキュメント](https://github.com/localsend/protocol)を参照してください。

## 始め方

ソースコードからLocalSendをコンパイルするには、次の手順に従います：

1. Flutterを[直接](https://flutter.dev)または[fvm](https://fvm.app)を使用してインストールします（[必要なバージョン](.fvmrc)を参照）。
2. `LocalSend`リポジトリをクローンします。
3. `cd app`を実行してappディレクトリに入ります。
4. `flutter pub get`を実行して依存関係をダウンロードします。
5. `flutter run`を実行してアプリを起動します。

> [!NOTE]
> LocalSendは現在、古いFlutterバージョン（[.fvmrc](.fvmrc)に指定）を必要とし、そのためビルドの問題は必要なバージョンと（システム全体の）インストールされたFlutterバージョンの不一致によって引き起こされる可能性があります。  
> 開発をより一貫性のあるものにするために、LocalSendは[fvm](https://fvm.app)を使用してプロジェクトのFlutterバージョンを管理します。
> `fvm`をインストールした後、`flutter`の代わりに`fvm flutter`を実行します。

## 貢献

LocalSendの改善に興味のある方からの貢献を歓迎します。貢献したい場合は、いくつかの方法があります：

### 翻訳

LocalSendを他の言語に翻訳するのをお手伝いください！**推奨される方法**: [Weblate](https://hosted.weblate.org/projects/localsend/app)プラットフォームを使用して翻訳を管理してください。

**別の方法**: このリポジトリをフォークして翻訳を手動で追加することもできます。

翻訳は[app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n)ディレクトリにあります。翻訳を追加または更新するには、`_missing_translations_<locale>.json`または`strings_<locale>.i18n.json`ファイルを編集してください。

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="翻訳ステータス" />
</a>

**_注意：_ `@`で装飾されたフィールドは翻訳のためのものではありません；それらはアプリで使用されていない情報テキストであり、翻訳者に文脈を提供するためのものです。**

### バグ修正と改善

- **バグ修正：** バグを見つけた場合は、問題の説明と修正方法を明確に記載したプルリクエストを作成してください。
- **改善：** LocalSendを改善するアイデアがありますか？改善が必要な理由を議論するために、最初に問題を作成してください。

詳細については、[貢献ガイド](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md)を参照してください。

## トラブルシューティング

| 問題              | プラットフォーム（送信） | プラットフォーム（受信） | 解決策                                                                                                                                |
|--------------------|--------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| デバイスが表示されない | すべて                | すべて                  | ルーターでAP-Isolationを無効にしてください。有効になっている場合、デバイス間の接続が禁止されます。                          |
| デバイスが表示されない | すべて                | Windows              | ネットワークを「プライベート」ネットワークとして構成してください。ネットワークがパブリックとして構成されている場合、Windowsはより制限的になる可能性があります。 |
| デバイスが表示されない | macOS, iOS         | すべて                  | OS設定の「プライバシー」の下にある「ローカルネットワーク」権限を切り替えてみてください。                                                |
| 速度が遅すぎる     | すべて                | すべて                  | 5 GHzを使用してください；両方のデバイスで暗号化を無効にしてください                                                                                           |
| 速度が遅すぎる     | すべて                | Android              | 既知の問題。https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |


## 貢献者

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsendの貢献者"/>
</a>
