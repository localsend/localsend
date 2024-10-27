# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Sito web][sito web] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](/README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Tiếng Việt](README_VI.md) • [Portugês Brasil](README_PT_BR.md) • [Italiano](README_IT.md)

[sito web]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend è un'applicazione gratuita e open-source che consente di condividere file e messaggi in modo sicuro con i dispositivi vicini attraverso la rete locale, senza bisogno di una connessione a Internet.

- [Panoramica](#panoramica)
- [Screenshot](#screenshot)
- [Download](#download)
- [Come funziona](#come-funziona)
- [Primi passi](#primi-passi)
- [Come contribuire](#come-contribuire)
  - [Traduzione](#traduzione)
  - [Correzione di bug e miglioramenti](#correzione-di-bug-e-miglioramenti)
- [Compilazione](#compilazione)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Panoramica

LocalSend è un'applicazione multipiattaforma che permette di comunicare in modo sicuro tra dispositivi utilizzando un'API REST e la crittografia HTTPS. A differenza di altre app di messaggistica che si affidano a server esterni, LocalSend non richiede una connessione a Internet o a server di terze parti e rappresenta una soluzione veloce e affidabile per la comunicazione locale.

## Screenshot

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="Screenshot su iPhone" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="Screenshot su PC" height="300"/>

## Download

Raccomandiamo di scaricare l'app tramite un app store o un manager di pacchetti poiché è sprovvista di aggiornamento automatico.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Read more about [distribution channels][].

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

## Installazione

Nella maggior parte dei casi, LocalSend dovrebbe funzionare subito. Tuttavia, se si riscontrano problemi nell'invio o nella ricezione di file, potrebbe essere necessario configurare il firewall per consentire a LocalSend di comunicare su rete locale.

| Tipo di traffico | Protocollo | Porta | Azione    |
|------------------|------------|-------|-----------|
| In arrivo        | TCP, UDP   | 53317 | Consenti  |
| In uscita        | TCP, UDP   | Any   | Consenti  |

Assicuratevi di disabilitare l'isolamento AP sul vostro router. Dovrebbe essere disattivato per impostazione predefinita ma su alcuni router potrebbe essere attivo (in particolare su reti ospiti).

**Modalità portatile**

(Introdotta nella versione v1.13.0)

Crea un file chiamato `settings.json` che si trova nella stessa cartella dell'eseguibile.
Questo file può essere vuoto.
Anziché utilizzare la posizione predefinita l'app utilizzerà questo file per memorizzare le impostazioni.

**Avvio minimizzato**

(Aggiornato in versione v1.15.0)

Per avviare in modo minimizzato l'app (solo nella barra delle applicazioni), usa il flag `--hidden` (per esempio: `localsend_app.exe --hidden`).
Nella versione v1.14.0 e precedenti, l'app parte minimizzata se è impostato il flag `autostart` e l'impostazione nascosta è abilitata.

## Come funziona

LocalSend utilizza un protocollo di comunicazione sicura che premette ai dispositivi di comunicare a vicenda tramite una API REST. Tutti i dati vengono inviati in modo sicuro tramite HTTPS e il certificato TLS/SSL è generato sul momento su ogni dispositivo, assicurando la massima sicurezza.

Per maggiori informazioni sul Protocollo LocalSend, consulta la [documentazione](https://github.com/localsend/protocol).

## Primi passi

Segui questi passi per compilare LocalSend dal codice sorgente:

1. Installa Flutter [direttamente](https://flutter.dev) o utilizzando [fvm](https://fvm.app) (vedi [versione richiesta](.fvmrc))
2. Clona la repository di `LocalSend`
3. Esegui `cd app` per entrare nella cartella dell'applicazione
4. Esegui `flutter pub get` per scaricare le dipendenze
5. Esegui `flutter run` per avviare l'app

> [!NOTE]
> Attualmente LocalSend richiede una versione più vecchia di Flutter (specificata in [.fvmrc](.fvmrc))
> quindi i problemi di compilazione potrebbero essere causati da una mancata corrispondenza tra la versione di Flutter richiesta e quella installata (a livello di sistema).
> Per rendere lo sviluppo più consistente LocalSend utilizza [fvm](https://fvm.app) per gestire la versione di Flutter del progetto.
> Dopo aver installato `fvm`, esegui `fvm flutter` anziché `flutter`.

## Come contribuire

Accogliamo con piacere i contributi di chiunque sia interessato a migliorare LocalSend. Se si desidera contribuire ci sono diversi modi per partecipare:

### Traduzione

Puoi aiutare a traddure l'app in altre lingue!

1. Crea un fork di questa repository
2. Scegli se:
   - Aggiungere le traduzioni mancanti nei linguaggi esistenti: aggiorna solo `_missing_translations_<locale>.json` in [app/assets/i18n][i18n]
   - Correggere le traduzioni esistenti: aggiorna `strings_<locale>.i18n.json` in [app/assets/i18n][i18n]
   - Aggiungi nuove lingue: crea un nuovo file, vedi anche: [locale codes][].
3. Opzionale: esegui nuovamente l'app
   1. Esegui `cd app` per entrare nella cartella dell'applicazione.
   2. Assicurati di aver [eseguito](#primi-passi) quest'app almeno una volta.
   3. Aggiorna le traduzioni con `flutter pub run slang`
   5. Esegui l'app con `flutter run`
   6. Apri una pull request

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[codici di localizzazione]: https://saimana.com/list-of-country-locale-code/

**_Prendi nota:_ I campi decorati con `@` non vanno tradotti; non sono usati in alcuna maniera nell'app. Si tratta semplicemente di testo informativo riguardante il file o per dare un contesto al traduttore.**

### Correzione di bug e miglioramenti

- **Correzione di bug:** Se trovi un bug crea una pull request con una descrizione chiara del problema e su come risolverlo.
- **Miglioramenti:** Hai un'idea su come poter migliorare LocalSend? Prima di tutto crea una "issue" per discutere il motivi per cui il miglioramento è necessario.

Per più informazioni, vedi la [guida ai contributi](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Compilazione

Questi comandi sono destinati solo ai manutentori.

### Android

APK tradizionale

```bash
flutter build apk
```

AppBundle per Google Play

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

**Tradizionale**

```bash
flutter build windows
```

**App locale MSIX**

```bash
flutter pub run msix:create
```

**Pronto per lo store**

```bash
flutter pub run msix:create --store
```

### Linux

**Tradizionale**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Sentitevi liberi di aprire una richiesta di pull. C'è un branch `snap` con cui sperimentare.

## Contributori

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Contributori di Localsend"/>
</a>