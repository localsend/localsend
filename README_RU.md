# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Сайт][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Русский](README_RU.md)

[сайт]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend это бесплатная программа с открытым исходным кодом, позволяющая вам отправлять файлы и сообщения между устройствами в локальной сети, без подключения к сети интернет

- [О проекте](#about)
- [Скриншоты](#screenshots)
- [Скачать](#download)
- [Как это работает](#how-it-works)
- [Начать пользоваться](#getting-started)
- [Поучавствовать в проекте](#contributing)
  - [Переводы](#translation)
  - [Исправление ошибок и улучшение продукта](#bug-fixes-and-improvements)
- [Релизы](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## About

LocalSend это кросс-платформенное приложение включающая защищённое соединение используя REST API и шифрование HTTPS. В отличии от других приложений использующие сторонние сервера, LocalSend не нуждается в подключении к интернету и использования внешних серверов, что делает быстрым и надёжным решением для локальной коммуникации.

## Screenshots

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Download

Рекомендуется устанавливать программу из магазина с приложением, так как программа не имеет функции автоматического обновления.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Узнать больше [distribution channels][].

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
[nixpkgs]: https://search.nixos.org/packages?show=localsend
[snap]: https://snapcraft.io/localsend
[aur]: https://aur.archlinux.org/packages/localsend-bin
[latest]: https://github.com/localsend/localsend/releases/latest
[distribution channels]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

## Setup

В большинстве случаев, LocalSend должен работать независимо. Однако, если у вас есть проблемы с получением и отправкой файлов, скорее всего вам необходимо настроить свой фаервол и разрешить LocalSend возможность взаимодействовать в вашей лосальной сети.

| Тип траффика  | Протокол | Порт    |  Действие  |
|---------------|----------|---------|------------|
| Входящий      | TCP, UDP | 53317   | Разрешить  |
| Исходящий     | TCP, UDP | Любой   | Разрешить  |

Также попробуйте отключить изоляцию точки доступа на вашем роутуре. Обычно оно отключено по умолчании, но некоторые роутеры могут включить эту функцию (особенно гостевые сети).

**Portable Mode**

(Появился в версии v1.13.0)

Создайте файл и назовите его `settings.json` в том же месте где вы распокавали приложение.
Он должен быть пустым.
Приложение будет использовать этот файл для сохранения настроек вместо расположения по умолчанию.

**Start hidden**

(Обновлено в версии v1.15.0)

Чтобы запустить приложение, спрятанным в трее используйте `--hidden` (пример: `localsend_app.exe --hidden`).

В версии v1.14.0 и ранее, приложение было спрятано в трее если настройка `autostart` была включена, и настройка hidden была включена.

## How It Works

LocalSend использует защищённуй протокол связи который позволяет контактировать с устройствами используя REST API. Вся дата отправляется в защищеном виде через HTTPS, и генерирует TLS/SSL сертификаты во время передачи данных между устройствамм, максимально защищая данные.

Больше информации о работе протокола LocalSend можно увидеть в [документации](https://github.com/localsend/protocol).

## Getting Started

Для использования LocalSend из открытого кода, следуйте этим шагам:

1. Устоновите Flutter [directly](https://flutter.dev) или используйте [fvm](https://fvm.app) (увидеть [необходимую версию](.fvmrc))
2. Клонируйте репозиторий `LocalSend`
3. Запустите `cd app` чтобы войти в каталог приложений
4. Запустите `flutter pub get` чтобы скачать зависимости
5. Запустите `flutter run` чтобы запустить приложение

> [!ВНИМАНИЕ]
> LocalSend необходима более старая версия Flutter (сделанная на [.fvmrc](.fvmrc))
> ошибки в этом билде могут быть связаны с неправильно установленной версией Flutter.  
> Чтобы сделать разработку более удобной, LocalSend использует [fvm](https://fvm.app) для управления проектной версией Flutter.
> После установки `fvm`, запустите `fvm flutter`, а не `flutter`.

## Contributing

Мы рады любой помощи от каждого кому интересно улучшить LocalSend. Если вы хотите помочь, вот несколько способов как это сделать.

### Translation

Ты можешь помочь с переводом на другие языки!

1. Клонируй этот репозиторий
2. Choose one
   - Добавь потеренные файлы в переводах: Обновляй только `_missing_translations_<locale>.json` в [app/assets/i18n][i18n]
   - Исправь существующие переводы: Обнови `strings_<locale>.i18n.json` в [app/assets/i18n][i18n]
   - Добавь новые языки: Создай новый файл; смотри также: [locale codes][].
3. Опционально: перезапусти приложение
   1. Запусти `cd app` чтобы зайти в приложение.
   2. Убедись что ты хотя бы раз запустил приложение, по этому гайду [run](#getting-started).
   3. Обнови перевод используя `flutter pub run slang`
   4. Запусти приложение с помощью `flutter run`
   5. Создай запрос на обновление

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[locale codes]: https://saimana.com/list-of-country-locale-code/

**_ОБЯЗАТЕЛЬНАЯ ПОМЕТКА:_ Всё что имеет `@` не должно переводится; это всё равно не используется в самом приложении, больше даёт инфорацию о файле и даёт контекст переводчикам, о секции**

### Bug Fixes and Improvements

- **Исправление ошибок:** Если вы нашли ошибку пожалуйста, отправьте запрос с полным описание проблемы и как её исправить.
- **Улучшить:** Иммеется идея как улучшить LocalSend? Для начала найдите почему это улучшение необходимо.

Для большей информации, читайте [гайд по помощи](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Релизы

Эти команды предназначены только для ответсвенных.

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

Не бойся создавать запросы на исправления. Есть ветка `snap` для того чтобы поиграть с ней.

## Contributors

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
