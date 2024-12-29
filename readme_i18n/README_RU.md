# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/

[Домашняя страница][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](README.md) • [中文](readme_i18n/README_ZH.md) • [日本語](readme_i18n/README_JA.md) • [ภาษาไทย](readme_i18n/README_TH.md) • [Filipino](readme_i18n/README_PH.md) • [Polski](readme_i18n/README_PL.md) • [Español](readme_i18n/README_ES.md) • [Tiếng Việt](readme_i18n/README_VI.md) • [Portugês Brasil](readme_i18n/README_PT_BR.md) • [Italiano](readme_i18n/README_IT.md) • [Indonesia](readme_i18n/README_ID.md) • [ភាសាខ្មែរ](readme_i18n/README_KM.md) • [Français](readme_i18n/README_FR.md) • [فارسی](readme_i18n/README_FA.md) • [Turkish](readme_i18n/README_TR.md) • [한국어](readme_i18n/README_KO.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend — это бесплатное приложение с открытым исходным кодом, которое позволяет вам безопасно обмениваться файлами и сообщениями с находящимися поблизости устройствами через локальную сеть, без необходимости подключения к Интернету.

- [About](#about)
- [Screenshots](#screenshots)
- [Download](#download)
- [How It Works](#how-it-works)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
  - [Translation](#translation)
  - [Bug Fixes and Improvements](#bug-fixes-and-improvements)
- [Troubleshooting](#troubleshooting)
- [Building](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## О LocalSend

LocalSend — это кроссплатформенное приложение, которое обеспечивает безопасную связь между устройствами с помощью REST API и HTTPS-шифрования. В отличие от других приложений для обмена сообщениями, которые полагаются на внешние серверы, LocalSend не требует подключения к Интернету или сторонним серверам, что делает его быстрым и надежным решением для локальной связи.

## Скриншоты

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Скачать

Рекомендуется загружать приложение из магазина приложений или менеджера пакетов, поскольку приложение не имеет автоматического обновления.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Подробнее о [каналах дистрибуции][].

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
[каналах дистрибуции]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

**Совместимость**

| Платформа | Минимальная версия | Примечание                                                                                                                           |
|-----------|--------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Android   | 5.0                | -                                                                                                                                    |
| iOS       | 12.0               | -                                                                                                                                    |
| macOS     | 11 Big Sur         | Используйте OpenCore Legacy Patcher 2.0.2 (См. [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384))  |
| Windows   | 10                 | Последняя версия, поддерживающая Windows 7 — v1.15.4. Возможно, в будущем могут появиться обратные порты новых версий для Windows 7. |
| Linux     | Н/Д                | -                                                                                                                                    |

## Настройки

В большинстве случаев LocalSend должен работать прямо из коробки. Однако, если у вас возникли проблемы с отправкой или получением файлов, возможно, вам придется настроить брандмауэр, чтобы позволить LocalSend взаимодействовать с вашей локальной сетью.

| Тип трафика | Протокол | Порт  | Действие  |
|-------------|----------|-------|-----------|
| Входящий    | TCP, UDP | 53317 | Разрешить |
| Исходящий   | TCP, UDP | Любой | Разрешить |

Также убедитесь, что на вашем маршрутизаторе отключена изоляция точек доступа. Обычно она отключена по умолчанию, но на некоторых маршрутизаторах она может быть включена (особенно в гостевых сетях).
Для получения дополнительной информации смотрите раздел [устранения неисправностей](#troubleshooting).

**Портативный режим**

(Начиная с v1.13.0)

Создайте файл с именем `settings.json` в той же директории, что и исполняемый файл.
Этот файл может быть пустым.
Приложение будет использовать этот файл для хранения настроек вместо расположения по умолчанию.

**Запуск в скрытом (фоновом) режиме**

(Обновлено с v1.15.0)

Чтобы запустить приложение скрытно (только в трее), используйте флаг `--hidden` (например: `localsend_app.exe --hidden`).

В версии 1.14.0 и более ранних выпусках программа запускается скрыто, если установлен флаг `--autostart` и включена настройка скрытого запуска.

## Как это работает

LocalSend использует безопасный протокол связи, который позволяет устройствам взаимодействовать между собой с помощью REST API. Все данные безопасно передаются через HTTPS протокол, а сертификат TLS/SSL генерируется на лету на каждом устройстве, обеспечивая максимальную безопасность.

Для получения дополнительной информации о протоколе LocalSend, смотрите [документацию](https://github.com/localsend/protocol).

## Начало работы

Чтобы скомпилировать LocalSend из исходного кода, выполните следующие действия:

1. Установите Flutter [напрямую](https://flutter.dev) или с помощью [fvm](https://fvm.app) (см. [необходимую версию](.fvmrc))
2. Установите [Rust](https://www.rust-lang.org/tools/install)
3. Клонируйте `LocalSend` репозиторий
4. Выполните команду `cd app`, чтобы войти в директорию приложения
5. Выполните команду `flutter pub get`, чтобы загрузить зависимости
6. Выполните команду `flutter run`, чтобы запустить приложения

> [!NOTE]
> LocalSend currently requires an older Flutter version (specified in [.fvmrc](.fvmrc))
> and thus build issues may be caused by a mismatch between the required and the (system-wide) installed Flutter version.  
> To make development more consistent, LocalSend uses [fvm](https://fvm.app) to manage the project Flutter version.
> After installing `fvm`, run `fvm flutter` instead of `flutter`.

## Contributing

We welcome contributions from anyone interested in helping improve LocalSend. If you'd like to contribute, there are a few ways to get involved:

### Translation

You can help translate LocalSend into other languages. We use the [Weblate](https://hosted.weblate.org/projects/localsend/app) platform to manage translations.

Alternatively, you can also contribute by forking this repository and adding translations manually.

The translations are located in the [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n) directory. Edit the `_missing_translations_<locale>.json` or `strings_<locale>.i18n.json` file to add or update translations.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_Take note:_ Fields decorated with `@` are not meant to be translated; they are not used in the app in any way, being merely informative text about the file or to give context to the translator.**

### Bug Fixes and Improvements

- **Bug Fixes:** If you find a bug, please create a pull request with a clear description of the issue and how to fix it.
- **Improvements:** Have an idea for how to improve LocalSend? Please create an issue first to discuss why the improvement is needed.

For more information, see the [contributing guide](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Troubleshooting

| Issue              | Platform (Sending) | Platform (Receiving) | Solution                                                                                                                                |
|--------------------|--------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Device not visible | Any                | Any                  | Make sure to disable AP-Isolation on your router. If it is enabled, connections between devices are forbidden.                          |
| Device not visible | Any                | Windows              | Make sure to configure your network as a "private" network. Windows might be more restrictive when the network is configured as public. |
| Device not visible | macOS, iOS         | Any                  | You can try to toggle the "Local Network" permission under "Privacy" in the OS settings.                                                |
| Speed too slow     | Any                | Any                  | Use 5 Ghz; Disable encryption on both devices                                                                                           |
| Speed too slow     | Any                | Android              | Known issue. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |

## Building

These commands are intended for maintainers only.

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

Instructions in [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## Contributors

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
