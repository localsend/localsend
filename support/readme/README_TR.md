# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]
[![Packaging status][packaging-badge]][packaging-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/
[packaging-badge]: https://repology.org/badge/tiny-repos/localsend.svg
[packaging-link]: https://repology.org/project/localsend/versions

[Ana Sayfa][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](README.md) • [Español](/support/readme/README_ES.md) • [فارسی](/support/readme/README_FA.md) • [Filipino](/support/readme/README_PH.md) • [Français](/support/readme/README_FR.md) • [Indonesia](/support/readme/README_ID.md) • [Italiano](/support/readme/README_IT.md) • [日本語](/support/readme/README_JA.md) • [ភាសាខ្មែរ](/support/readme/README_KM.md) • [한국어](/support/readme/README_KO.md) • [Polski](/support/readme/README_PL.md) • [Português Brasil](/support/readme/README_PT_BR.md) • [Русский](/support/readme/README_RU.md) • [ภาษาไทย](/support/readme/README_TH.md) • [Türkçe](/support/readme/README_TR.md) • [Українська](/support/readme/README_UK.md) • [Tiếng Việt](/support/readme/README_VI.md) • [中文](/support/readme/README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend, internet bağlantısına ihtiyaç duymadan, yerel ağ üzerinden yakın cihazlarla güvenli bir şekilde dosya ve mesaj paylaşmanıza olanak tanıyan ücretsiz, açık kaynaklı bir uygulamadır.

- [Hakkında](#about)
- [Sponsorlar](#sponsors)
- [Ekran Görüntüleri](#screenshots)
- [İndir](#download)
- [Nasıl Çalışır](#how-it-works)
- [Bağımlılık Hiyerarşisi](#dependency-hierarchy)
- [Başlarken](#getting-started)
- [Katkıda Bulunma](#contributing)
  - [Çeviri](#translation)
  - [Hata Düzeltmeleri ve İyileştirmeler](#bug-fixes-and-improvements)
- [Sorun Giderme](#troubleshooting)
- [Derleme](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

<a id="about"></a>
## Hakkında

LocalSend, cihazlar arasında güvenli iletişim sağlamak için REST API ve HTTPS şifrelemesi kullanan, çoklu platform desteğine sahip bir uygulamadır. Diğer mesajlaşma uygulamalarının dış sunuculara bağımlı olmasının aksine, LocalSend internet bağlantısına veya üçüncü taraf sunuculara ihtiyaç duymaz; bu da yerel iletişim için hızlı ve güvenilir bir çözüm sunar.

<a id="sponsors"></a>
## Sponsorlar

Tarayıcı testleri aracılığıyla

<a href="https://www.testmuai.com/?utm_medium=sponsor&utm_source=localsend" target="_blank">
    <img src="https://localsend.org/img/sponsors/tesmu.svg" style="vertical-align: middle;" width="250" height="45" />
</a>

<a id="screenshots"></a>
## Ekran Görüntüleri

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

<a id="download"></a>
## İndir

[![Packaging status](https://repology.org/badge/tiny-repos/localsend.svg)](https://repology.org/project/localsend/versions)

Uygulamanın otomatik güncelleme özelliği olmadığı için, uygulamayı bir uygulama mağazasından veya bir paket yöneticisinden indirmeniz önerilir.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Dağıtım kanalları hakkında daha fazla bilgi edinin: [distribution channels][].

Windows ikili dosyaları imzalıdır. Hakkında daha fazla bilgi edinin: [Code signing policy][].

> [!CAUTION]
> **Gayri resmi MSIX önizlemesi:** en son commit'lerden yapılan derlemeleri [localsend.ob-buff.dev](https://localsend.ob-buff.dev/) adresinde deneyebilirsiniz. Kararlılık garanti edilmez ve tüm özel kod değişiklikleri o sitede listelenir.

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
[code signing policy]: https://github.com/localsend/localsend/blob/main/CODE_SIGNING.md

**Uyumluluk**

| Platform | Minimum Sürüm | Not                                                                                                                        |
|----------|---------------|----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0           | -                                                                                                                          |
| iOS      | 12.0          | -                                                                                                                          |
| macOS    | 11 Big Sur    | OpenCore Legacy Patcher 2.0.2 kullanın (Bkz. [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows  | 10            | Windows 7'yi destekleyen son sürüm v1.15.4'tür. Gelecekte Windows 7 için daha yeni sürümlerin backport'ları olabilir.     |
| Linux    | N.A.          | Bağımlılıklar: Gnome: `xdg-desktop-portal` ve `xdg-desktop-portal-gtk`, KDE: `xdg-desktop-portal` ve `xdg-desktop-portal-kde` |

<a id="setup"></a>
## Kurulum

Çoğu durumda LocalSend kutudan çıktığı gibi çalışır. Ancak dosya gönderme veya alma konusunda sorun yaşıyorsanız, LocalSend'in yerel ağınız üzerinden iletişim kurabilmesi için güvenlik duvarınızı yapılandırmanız gerekebilir.

| Trafik Türü | Protokol | Port   | Aksiyon  |
|-------------|----------|--------|----------|
| Gelen       | TCP, UDP | 53317  | İzin Ver |
| Giden       | TCP, UDP | Herhangi | İzin Ver |

Ayrıca yönlendiricinizde AP izolasyonunun devre dışı olduğundan emin olun. Genellikle varsayılan olarak devre dışıdır, ancak bazı yönlendiricilerde (özellikle misafir ağlarında) etkin olabilir.
Daha fazla bilgi için [Sorun Giderme](#troubleshooting) bölümüne bakın.

**Taşınabilir Mod**

(v1.13.0 sürümünde tanıtıldı)

Çalıştırılabilir dosyayla aynı dizinde `settings.json` adında bir dosya oluşturun.
Bu dosya boş olabilir.
Uygulama, ayarları varsayılan konum yerine bu dosyada saklayacaktır.

**Gizli Başlat**

(v1.15.0 sürümünde güncellendi)

Uygulamayı gizli başlatmak için (yalnızca sistem tepsisinde) `--hidden` bayrağını kullanın (örnek: `localsend_app.exe --hidden`).

v1.14.0 ve önceki sürümlerde, `autostart` bayrağı ayarlandığında ve gizli ayar etkinleştirildiğinde uygulama gizli başlardı.

<a id="how-it-works"></a>
## Nasıl Çalışır

LocalSend, cihazların birbirleriyle REST API üzerinden güvenli iletişim kurmasını sağlayan güvenli bir iletişim protokolü kullanır. Tüm veriler HTTPS üzerinden güvenli bir şekilde iletilir ve TLS/SSL sertifikası her cihazda anında oluşturularak maksimum güvenlik sağlanır.

LocalSend Protokolü hakkında daha fazla bilgi için [dokümantasyon](https://github.com/localsend/protocol).

<a id="dependency-hierarchy"></a>
## Bağımlılık Hiyerarşisi

![Dependency hierarchy](support/docs/dependency-hierarchy.svg)

<a id="getting-started"></a>
## Başlarken

LocalSend'i kaynak kodundan derlemek için şu adımları izleyin:

1. Flutter'ı [doğrudan](https://flutter.dev) veya [fvm](https://fvm.app) kullanarak kurun ([gerekli sürüm](.fvmrc) için bakın)
2. [Rust](https://www.rust-lang.org/tools/install) kurun
3. `LocalSend` deposunu klonlayın
4. Uygulama dizinine girmek için `cd app` komutunu çalıştırın
5. Bağımlılıkları indirmek için `flutter pub get` komutunu çalıştırın
6. Uygulamayı başlatmak için `flutter run` komutunu çalıştırın

> [!NOTE]
> LocalSend şu anda daha eski bir Flutter sürümü gerektirir ([.fvmrc](.fvmrc) dosyasında belirtilmiştir)
> bu nedenle gerekli sürüm ile (sistem genelinde) kurulu Flutter sürümü arasındaki uyumsuzluk derleme sorunlarına neden olabilir.
> Geliştirmeyi daha tutarlı hale getirmek için LocalSend, proje Flutter sürümünü yönetmek için [fvm](https://fvm.app) kullanır.
> `fvm` kurulduktan sonra `flutter` yerine `fvm flutter` komutunu çalıştırın.

<a id="contributing"></a>
## Katkıda Bulunma

LocalSend'i geliştirmeye yardımcı olmakla ilgilenen herkesin katkısına açığız. Katkıda bulunmak isterseniz birkaç yol vardır:

### Çeviri

LocalSend'i başka dillere çevirmeye yardımcı olabilirsiniz. Çevirileri yönetmek için [Weblate](https://hosted.weblate.org/projects/localsend/app) platformunu kullanıyoruz.

Alternatif olarak bu depoyu fork'layarak ve çevirileri manuel olarak ekleyerek de katkıda bulunabilirsiniz.

Çeviriler [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n) dizininde bulunur. Çeviri eklemek veya güncellemek için `_missing_translations_<locale>.json` ya da `strings_<locale>.i18n.json` dosyasını düzenleyin.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Çeviri durumu" />
</a>

**_Not:_ `@` ile işaretlenmiş alanların çevrilmesi amaçlanmamıştır; bu alanlar uygulamada hiçbir şekilde kullanılmaz, yalnızca dosya hakkında bilgilendirici metinler olup çevirmene bağlam sağlar.**

### Hata Düzeltmeleri ve İyileştirmeler

- **Hata Düzeltmeleri:** Bir hata bulursanız, lütfen sorunun ve nasıl düzeltileceğinin açık bir açıklamasıyla bir pull request oluşturun.
- **İyileştirmeler:** LocalSend'i iyileştirmek için bir fikriniz mi var? Lütfen önce değişikliğin neden gerekli olduğunu tartışmak için bir issue oluşturun.

Daha fazla bilgi için [katkıda bulunma kılavuzuna](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md) bakın.

<a id="troubleshooting"></a>
## Sorun Giderme

| Sorun            | Platform (Gönderen) | Platform (Alan)    | Çözüm                                                                                                                                |
|-------------------|---------------------|--------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Cihaz görünmüyor | Herhangi            | Herhangi           | Yönlendiricinizde AP-İzolasyonunu devre dışı bıraktığınızdan emin olun. Etkinse cihazlar arası bağlantılar engellenir.               |
| Cihaz görünmüyor | Herhangi            | Windows            | Ağınızı "özel" ağ olarak yapılandırdığınızdan emin olun. Ağ "genel" olarak yapılandırıldığında Windows daha kısıtlayıcı olabilir.  |
| Cihaz görünmüyor | macOS, iOS          | Herhangi           | İşletim sistemi ayarlarında "Gizlilik" altındaki "Yerel Ağ" iznini açıp kapatmayı deneyebilirsiniz.                               |
| Hız çok yavaş    | Herhangi            | Herhangi           | 5 Ghz kullanın; her iki cihazda da şifrelemeyi devre dışı bırakın.                                                                 |
| Hız çok yavaş    | Herhangi            | Android            | Bilinen bir sorun. https://github.com/flutter-cavalry/saf_stream/issues/4                                                            |

<a id="building"></a>
## Derleme

Bu komutlar yalnızca bakımcılar içindir. `app` dizininden çalıştırdığınızdan emin olun.

### Android

Geleneksel APK

```bash
flutter build apk
```

Google Play için AppBundle

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

**Geleneksel**

```bash
flutter build windows
```

**Yerel MSIX Uygulaması**

```bash
flutter pub run msix:create
```

**Mağazaya hazır**

```bash
flutter pub run msix:create --store
```

### Linux

**Geleneksel**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Talimatlar: [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

<a id="contributors"></a>
## Katkıda Bulunanlar

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
