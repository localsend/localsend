# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/

[홈페이지][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend는 인터넷에 연결하지 않고도 로컬 네트워크를 통해 주변 기기들과 파일 및 메시지를 안전하게 공유할 수 있는 무료 오픈소스 앱입니다.

- [정보](#정보)
- [스크린샷](#스크린샷)
- [다운로드](#다운로드)
- [작동 원리](#작동-원리)
- [시작하기](#시작하기)
- [기여하기](#기여하기)
  - [번역](#번역)
  - [버그 수정 및 개선](#버그-수정-및-개선)
- [빌드](#빌드)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## 정보

LocalSend는 REST API 및 HTTPS 암호화를 통해 기기 간의 파일을 안전하게 주고 받을 수 있는 크로스플랫폼 애플리케이션입니다. 외부 서버에 의존하는 다른 앱과 달리, LocalSend는 인터넷 연결 및 제삼자 서버를 필요로 하지 않는 만큼, 근거리 통신을 위한 빠르고 안정적인 대안이라고 할 수 있습니다.

## 스크린샷

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## 다운로드

애플리케이션에 자동 업데이트 기능이 존재하지 않는 만큼, 앱스토어 및 패키지 매니저를 통해 앱을 다운로드 받을 것을 권장합니다.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

[배포 채널][distribution channels]에서 더 자세한 내용을 찾아볼 수 있습니다.

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

**요구 사항**

|  플랫폼  |    최소 버전    | 알림                                                                                                                         |
|----------|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                            |
| iOS      | 12.0            | -                                                                                                                            |
| macOS    | 11 Big Sur      | OpenCore Legacy Patcher 2.0.2 필요 ([#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384) 참고)|
| Windows  | 10              | Windows 7을 지원하는 마지막 버전은 v1.15.4입니다. 추후 Windows 7을 지원하는 최신 버전이 공개될 수 있습니다.                  |
| Linux    | N.A.            | -                                                                                                                            |

## 설정

대부분의 경우, LocalSend는 별 다른 설정을 하지 않더라도 곧바로 동작하도록 설계되어 있습니다. 하지만, 파일을 주고 받는데 어려움을 겪고 계신다면, LocalSend가 로컬 네트워크를 통해 데이터를 주고받을 수 있도록 방화벽 설정을 수정해야 할 수 있습니다.

| 트래픽 타입  | 프로토콜 | 포트  |  작업  |
|--------------|----------|-------|--------|
| Incoming     | TCP, UDP | 53317 |  허용  |
| Outgoing     | TCP, UDP | Any   |  허용  |

또한, 라우터 설정에서 AP 격리 기능을 비활성화하는 것을 잊지 마세요. 대부분은 해당 기능이 기본적으로 비활성화되어 있으나, 일부 라우터 (특히 공공 네트워크에서는) AP 격리 기능이 활성화되어 있을 수 있습니다.

**포터블 모드**

(v1.13.0에서 도입됨)

실행파일과 같은 경로 내에 `settings.json` 파일을 생성하세요.
파일 내용은 비어있어도 됩니다.
앱이 기본 경로 대신 해당 파일에 설정값을 저장하게 됩니다.

**숨김 상태로 실행**

(v1.15.0에서 업데이트됨)

앱이 (작업표시줄에) 숨겨진 상태로 실행하게 하려면, `--hidden` 플래그를 사용하세요 (예시: `localsend_app.exe --hidden`).

v1.14.0보다 낮은 버전에서는, `autostart` 플래그가 설정되어 있고, 숨김 설정이 활성화되어 있을 때 앱이 숨겨진 상태로 실행됩니다.

## 작동 원리

LocalSend는 REST API 기술을 사용해 다른 기기와 안전하게 데이터를 주고받을 수 있는 통신 프로토콜을 이용합니다. 모든 데이터는 HTTPS를 통해 안전하게 전송되며, 각 기기마다 TLS/SSL 인증서가 생성되어 최대한의 안전성을 보장합니다.

LocalSend 프로토콜에 대해 더욱 자세한 정보를 알고 싶으시다면, [문서](https://github.com/localsend/protocol)을 참고하시기 바랍니다.

## 시작하기

소스코드로부터 LocalSend를 컴파일하려면, 아래 과정들을 따라하시기 바랍니다:

1. Flutter를 [직접](https://flutter.dev) 설치하시거나, [fvm](https://fvm.app)을 사용하세요. ([요구 버전](.fvmrc) 참고)
2. [Rust](https://www.rust-lang.org/tools/install)를 설치하세요.
3. `LocalSend` repository를 Clone하세요.
4. `cd app` 명령어를 통해 앱이 위치한 경로로 이동하세요.
5. `flutter pub get` 명령어를 통해 필요한 패키지를 다운로드 받으세요.
6. `flutter run` 명령어를 통해 앱을 실행하세요.

> [!중요]
> LocalSend는 현재 구 버전의 Flutter를 사용하고 있습니다. ([.fvmrc](.fvmrc) 참고)
> 따라서 시스템에 설치된 Flutter 버전과, LocalSend가 요구하는 버전이 맞지 않는데서 다양한 빌드 오류가 발생할 수 있습니다.
> 더욱 일관된 개발 환경을 확보하기 위해, LocalSend는 [fvm](https://fvm.app)을 사용하여 프로젝트 Flutter 버전을 관리하고 있습니다.
> `fvm`을 설치하신 뒤, `flutter` 명령어 대신 `fvm flutter` 명령어를 사용하시기 바랍니다.

## 기여하기

저희는 LocalSend를 개선하는데 관심을 갖고 있는 모든 분들로부터의 기여를 환영합니다. 만약 기여를 하고자 하신다면, 아래 몇 가지 방법들이 존재합니다:

### 번역

LocalSend를 다양한 언어로 번역하는데 도움을 주실 수 있습니다. 저희는 [Weblate](https://hosted.weblate.org/projects/localsend/app) 플랫폼을 통해 번역을 관리하고 있습니다.

이 외에도, 해당 레포지토리를 포크하여 직접 번역문을 추가하는 방식으로도 기여하실 수 있습니다.

번역 파일은 [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n) 경로에서 찾아보실 수 있습니다. `_missing_translations_<locale>.json` 또는 `strings_<locale>.i18n.json` 파일을 수정하여 번역문을 추가하거나 개선할 수 있습니다.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_중요:_ `@`로 장식된 항목들은 번역 대상이 아닙니다; 이는 앱에서 표시되는 문구가 아니고, 다만 번역가에게 도움이 되는 정보나 문맥을 제공하기 위해 작성된 항목입니다.**

### 버그 수정 및 개선

- **버그 수정:** 버그를 발견하셨다면, 부디 pull request를 생성하여 어떤 문제가 발생하고 있는지, 이를 어떻게 고칠 수 있는지를 투명하게 알려주시기 바랍니다.
- **개선:** LocalSend를 개선하기 위한 아이디어가 있으신가요? Issue를 생성하여 어떤 부분을 개선하면 좋을지 알려주세요.

더 많은 정보가 필요하시다면, [기여 가이드](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md)를 확인하시기 바랍니다.

## 문제 해결

| 문제              | 플랫폼 (전송) | 플랫폼 (수신) | 해결 방법                                                                                                                                |
|--------------------|--------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| 장치가 보이지 않음 | 모두                | 모두                  | 라우터에서 AP-Isolation을 비활성화했는지 확인하세요. 활성화되어 있으면 장치 간 연결이 금지됩니다.                          |
| 장치가 보이지 않음 | 모두                | Windows              | 네트워크를 "개인" 네트워크로 구성했는지 확인하세요. 네트워크가 공용으로 구성되어 있으면 Windows가 더 제한적일 수 있습니다. |
| 장치가 보이지 않음 | macOS, iOS         | 모두                  | OS 설정의 "개인 정보 보호"에서 "로컬 네트워크" 권한을 전환해 보세요.                                                |
| 속도가 너무 느림     | 모두                | 모두                  | 5 GHz 사용; 두 장치 모두에서 암호화 비활성화                                                                                           |
| 속도가 너무 느림     | 모두                | Android              | 알려진 문제. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |

## 기여자

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
