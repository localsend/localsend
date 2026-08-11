# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/

[Домашняя страница][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend — это бесплатное приложение с открытым исходным кодом, которое позволяет вам безопасно обмениваться файлами и сообщениями с находящимися поблизости устройствами через локальную сеть, без необходимости подключения к Интернету.

- [О LocalSend](#о-localsend)
- [Скриншоты](#скриншоты)
- [Скачать](#скачать)
- [Как это работает](#как-это-работает)
- [Начало работы](#начало-работы)
- [Вклад в развитие проекта](#вклад-в-развитие-проекта)
  - [Перевод](#перевод)
  - [Исправления ошибок и улучшения работы](#исправления-ошибок-и-улучшения-работы)
- [Устранение неисправностей](#устранение-неисправностей)
- [Сборка (построение) приложения](#сборка-построение-приложения)
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

Для получения дополнительной информации о протоколе LocalSend смотрите [документацию](https://github.com/localsend/protocol).

## Начало работы

Чтобы скомпилировать LocalSend из исходного кода, выполните следующие действия:

1. Установите Flutter [напрямую](https://flutter.dev) или с помощью [fvm](https://fvm.app) (см. [необходимую версию](.fvmrc))
2. Установите [Rust](https://www.rust-lang.org/tools/install)
3. Клонируйте `LocalSend` репозиторий
4. Выполните команду `cd app`, чтобы войти в директорию приложения
5. Выполните команду `flutter pub get`, чтобы загрузить зависимости
6. Выполните команду `flutter run`, чтобы запустить приложения

> [!NOTE]
> На данный момент LocalSend требует более старой версии Flutter (указанной в [.fvmrc](.fvmrc)),
> поэтому проблемы со сборкой могут возникать из-за несоответствия между необходимой версией и системной (установленной) версией Flutter.  
> Чтобы сделать разработку более согласованной, LocalSend использует [fvm](https://fvm.app) для управления версией проекта Flutter.
> После установки `fvm`, запустите `fvm flutter` вместо `flutter`.

## Вклад в развитие проекта

Мы приветствуем вклады от всех, кто хочет помочь улучшить LocalSend. Если вы хотите внести вклад, есть несколько способов принять участие:

### Перевод

Вы можете помочь перевести LocalSend на другие языки. **Рекомендуемый способ**: Используйте платформу [Weblate](https://hosted.weblate.org/projects/localsend/app) для управления переводами.

**Альтернативный способ**: Вы также можете внести свой вклад, создав ответвление этого репозитория и добавив переводы вручную.

Переводы находятся в директории [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). Отредактируйте файл `_missing_translations_<locale>.json` или файл `strings_<locale>.i18n.json`, чтобы добавить или обновить переводы.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Статус перевода" />
</a>

**_Обратите внимание:_ Поля, содержащие `@`, не предназначены для перевода; они никак не используются в приложении, поскольку являются лишь информативным текстом о файле или для предоставления контекста переводчику.**

### Исправления ошибок и улучшения работы

- **Исправление ошибок:** Если вы обнаружили ошибку, создайте запрос на вытягивание с четким описанием проблемы и способом ее решения.
- **Улучшение:** Есть идея, как улучшить LocalSend? Пожалуйста, сначала создайте соответствующую тему, чтобы обсудить, почему это улучшение необходимо.

Для получения дополнительной информации смотрите руководство о [вкладе в развитие проекта](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Устранение неисправностей

| Проблема                   | Платформа (Отправка) | Платформа (Получение) | Решение                                                                                                                                        |
|----------------------------|----------------------|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Устройство не отображается | Любая                | Любая                 | Убедитесь, что на вашем маршрутизаторе отключена изоляция точек доступа. Если она включена, соединение между устройствами будет запрещено.     |
| Устройство не отображается | Любая                | Windows               | Убедитесь, что ваша сеть настроена как "частная". Windows может накладывать дополнительные ограничения, если сеть настроена как общедоступная. |
| Устройство не отображается | macOS, iOS           | Любая                 | Вы можете попробовать повторно предоставить разрешение для "Локальной сети" в разделе "Конфиденциальность" в настройках ОС.                    |
| Скорость слишком низкая    | Любая                | Любая                 | Используйте Wi-Fi 5 ГГц; Выключите шифрование на обоих устройствах.                                                                            |
| Скорость слишком низкая    | Любая                | Android               | Известная проблема. https://github.com/flutter-cavalry/saf_stream/issues/4                                                                     |

