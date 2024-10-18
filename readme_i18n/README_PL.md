# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Strona główna][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](/README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Tiếng Việt](README_VI.md) • [Portugês Brasil](README_PT_BR.md) • [Italiano](README_IT.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend jest darmową, otwartoźródłową aplikacją, która umożliwia Ci bezpiecznie udostępnianie plików oraz wiadomości pobliskim urządzeniom w Twojej sieci lokalnej bez konieczności połączenia z internetem.

- [O projekcie](#O-projekcie)
- [Zrzuty ekranu](#Zrzuty-ekranu)
- [Pobieranie](#Pobieranie)
- [Jak to działa?](#Jak-to-działa)
- [Pierwsze kroki](#Pierwsze-kroki)
- [Wnoszenie wkładu](#Wnoszenie-wkładu)
  - [Tłumaczenie](#Tłumaczenie)
  - [Poprawki błędów i ulepszenia](#Poprawki-błędów-i-ulepszenia)
- [Budowanie](#Budowanie)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## O projekcie

LocalSend jest wieloplatformową aplikacją, która umożliwia bezpieczną komunikację między urządzeniami przy użyciu REST API oraz szyfrowania HTTPS. W przeciwieństwie do innych aplikacji, które bazują na zewnętrznych serwerach, LocalSend nie wymaga połączenia z internetem ani serwerów osób trzecich, co czyni go szybkim i niezawodnym rozwiązaniem dla lokalnej komunikacji.

## Zrzuty ekranu

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Pobieranie

Zaleca się pobranie aplikacji ze sklepu z aplikacjami albo menedżera paczek, ponieważ aplikacja nie posiada automatycznych aktualizacji.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Sklep Play][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Dowiedz się więcej o [kanałach dystrybucji][].

[windows store]: https://www.microsoft.com/store/apps/9NCB4Z0TZ6RR
[app store]: https://apps.apple.com/us/app/localsend/id1661733229
[sklep play]: https://play.google.com/store/apps/details?id=org.localsend.localsend_app
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
[kanałach dystrybucji]: https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution

## Instalacja

W większości przypadków LocalSend powinien działać od razu po instalacji. Jednakże, jeśli masz problemy z wysyłaniem lub odbieraniem plików, może być konieczne skonfigurowanie Twojej zapory sieciowej, aby umożliwić LocalSend komunikację przez sieć lokalną.

| Typ ruchu    | Protokół | Port    | Akcja  |
|--------------|----------|---------|--------|
| Przychodzący | TCP, UDP | 53317   | Zezwól |
| Wychodzący   | TCP, UDP | każdy   | Zezwól |

Również, upewnij się, że izolacja klientów na Twoim routerze jest wyłączona. Zwykle powinna być ona domyślnie wyłączona, ale niektóre routery mogą mieć ją włączoną (szczególnie sieci gościnne).

**Tryb przenośny (portable)**

(Wprowadzony w v1.13.0)

Stwórz plik o nazwie `settings.json` znajdujący się w tym samym katalogu, co plik wykonywalny.
Plik może być pusty.
Aplikacja będzie używać tego pliku do przechowywania ustawień zamiast domyślnej lokalizacji.

**Uruchom w zasobniku (w tle)**

(Zaktualizowano w v1.15.0)

Aby uruchomić aplikację do zasobnika, użyj flagi `--hidden` (przykład: `localsend_app.exe --hidden`).

W wersji v1.14.0 i wcześniejszych aplikacja uruchamia się do zasobnika, jeśli ustawiona jest flaga `autostart`, a ustawienie uruchamiania do zasobnika jest włączone.

## Jak to działa?

LocalSend korzysta z bezpiecznego protokołu komunikacyjnego, który pozwala urządzeniom komunikować się ze sobą za pomocą interfejsu API REST. Wszystkie dane są bezpiecznie przesyłane przez HTTPS, a certyfikat TLS/SSL jest generowany automatycznie na każdym urządzeniu, gwarantując maksymalne bezpieczeństwo.

Więcej informacji na temat protokołu LocalSend można znaleźć w [dokumentacji](https://github.com/localsend/protocol).

## Pierwsze kroki

Aby skompilować LocalSend z kodu źródłowego, wykonaj następujące czynności:

1. Zainstaluj Flutter [bezpośrednio](https://flutter.dev) lub używając [fvm](https://fvm.app) (zobacz [wymaganą wersję](.fvmrc))
2. Sklonuj repozytorium `LocalSend`
3. Wykonaj `cd app`, aby wejść do katalogu `app`
4. Wykonaj `flutter pub get`, aby pobrać zależności
5. Wykonaj `flutter run`, aby uruchomić aplikację

> [!NOTE]
> LocalSend obecnie wymaga starszej wersji Fluttera (określonej w [.fvmrc](.fvmrc))
> a tym samym problemy z kompilacją mogą być spowodowane niedopasowaniem wymaganej i zainstalowanej (w obrębie całego systemu) wersji Fluttera.  
> Aby uczynić rozwój bardziej spójnym, LocalSend używa [fvm](https://fvm.app) do zarządzania wersją projektu Flutter.
> Po zainstalowaniu `fvm`, wykonaj `fvm flutter` zamiast `flutter`.

## Wnoszenie wkładu

Zapraszamy wszystkich tych, którzy chcą pomóc w ulepszaniu LocalSend. Jeśli chcesz wnieść swój wkład, możesz zaangażować się na kilka sposobów:

### Tłumaczenie

Możesz pomóc tłumaczyć tę aplikację na inne języki!

1. Rozwidl (fork) to repozytorium
2. Wybierz jedno
   - Dodaj brakujące tłumaczenia w istniejących językach: Tylko zaktualizuj `_missing_translations_<locale>.json` w [app/assets/i18n][i18n]
   - Popraw istniejące tłumaczenie: Zaktualizuj `strings_<locale>.i18n.json` w [app/assets/i18n][i18n]
   - Dodaj nowy język: Stwórz plik; zobacz też: [kody regionalne][].
3. Opcjonalnie: Uruchom ponownie aplikację
   1. Wykonaj `cd app`, aby wejść do katalogu `app`.
   2. Upewnij się, że [uruchomiłeś](#Pierwsze-kroki) tę aplikację przynajmniej raz.
   3. Zaktualizuj tłumaczenia poprzez `flutter pub run slang`
   4. Uruchom aplikację wykonując `flutter run`
   5. Otwórz pull request

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[kody regionalne]: https://saimana.com/list-of-country-locale-code/

**_Zwróć uwagę:_ Pola oznaczone `@` nie są przeznaczone do tłumaczenia; nie są one używane w aplikacji w żaden sposób, będąc jedynie tekstem informacyjnym o pliku lub w celu nadania kontekstu tłumaczowi.**

### Poprawki błędów i ulepszenia

- **Poprawki błędów:** Jeśli znajdziesz błąd, utwórz pull request z jasnym opisem błędu i sposobem jego naprawienia.
- **Ulepszenia:** Masz pomysł, jak ulepszyć LocalSend? Najpierw utwórz problem, aby przedyskutować, dlaczego ulepszenie jest potrzebne.

Więcej informacji można znaleźć w [przewodniku dla współtwórców](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Budowanie

Te polecenia są przeznaczone wyłącznie dla osób odpowiedzialnych za utrzymanie projektu.

### Android

Tradycyjny APK

```bash
flutter build apk
```

AppBundle dla Google Play

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

**Tradycyjny**

```bash
flutter build windows
```

**Lokalna aplikacja MSIX**

```bash
flutter pub run msix:create
```

**Gotowa dla Sklepu**

```bash
flutter pub run msix:create --store
```

### Linux

**Tradycyjny**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Zachęcamy do otwarcia pull requesta. Do dyspozycji istnieje gałąź `snap`.

## Współtwórcy

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>