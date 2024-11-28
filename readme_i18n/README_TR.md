# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](/README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Tiếng Việt](README_VI.md) • [Portugês Brasil](README_PT_BR.md) • [Italiano](README_IT.md) • [Indonesia](README_ID.md) • [ភាសាខ្មែរ](README_KM.md) • [Français](README_FR.md) • [فارسی](README_FA.md) • [Turkish](README_TR.md) • [한국어](README_KO.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend, internet bağlantısına ihtiyaç duymadan, yerel ağ üzerinden yakın cihazlarla güvenli bir şekilde dosya ve mesaj paylaşmanıza olanak tanıyan ücretsiz, açık kaynaklı bir uygulamadır.

- [Hakkında](#hakkında)
- [Ekran Görüntüleri](#ekran-görüntüleri)
- [İndir](#i̇ndir)
- [Kurulum](#kurulum)
- [Nasıl Çalışır](#nasıl-çalışır)
- [Başlarken](#başlarken)
- [Katkıda Bulunma](#katkıda-bulunma)
  - [Çeviri](#çeviri)
  - [Hata Düzeltmeleri ve İyileştirmeler](#hata-düzeltmeleri-ve-i̇yileştirmeler)
- [Derleme](#derleme)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)
- [Katkıda Bulunanlar](#katkıda-bulunanlar)

## Hakkında

LocalSend, cihazlar arasında güvenli iletişim sağlamak için REST API ve HTTPS şifrelemesi kullanan, çoklu platform desteğine sahip bir uygulamadır. Diğer mesajlaşma uygulamalarının dış sunuculara bağımlı olmasının aksine, LocalSend internet bağlantısına veya üçüncü taraf sunuculara ihtiyaç duymaz; bu da yerel iletişim için hızlı ve güvenilir bir çözüm sunar.

## Ekran Görüntüleri

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## İndir

Uygulamayı, otomatik güncelleme özelliği olmadığı için bir uygulama mağazasından veya bir paket yöneticisinden indirmeniz önerilir.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
| ----------------------- | ----------------------- | ------------------ | -------------- | ------------- | ---------- |
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Hakkında daha fazla bilgi edinin [distribution channels][].

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

**Uyumluluk**

| Platform | Minimum Version | Note                                                                                                                        |
| -------- | --------------- | --------------------------------------------------------------------------------------------------------------------------- |
| Android  | 5.0             | -                                                                                                                           |
| iOS      | 12.0            | -                                                                                                                           |
| macOS    | 11 Big Sur      | Use OpenCore Legacy Patcher 2.0.2 (See [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows  | 10              | The last version to support Windows 7 is v1.15.4. There might be backports of newer versions for Windows 7 in the future.   |
| Linux    | N.A.            | -                                                                                                                           |

## Kurulum

Çoğu durumda, LocalSend kutudan çıkar çıkmaz çalışmalıdır. Ancak, dosya gönderme veya alma konusunda sorun yaşıyorsanız, LocalSend'in yerel ağ üzerinden iletişim kurabilmesi için güvenlik duvarınızı yapılandırmanız gerekebilir.

| Trafik Türü | Protokol | Port     | Aksiyon  |
| ----------- | -------- | -------- | -------- |
| Gelen       | TCP, UDP | 53317    | İzin Ver |
| Giden       | TCP, UDP | Herhangi | İzin Ver |

Ayrıca, yönlendiricinizde AP izolasyonunu devre dışı bıraktığınızdan emin olun. Genellikle varsayılan olarak devre dışı olmalıdır, ancak bazı yönlendiriciler bunu etkinleştirmiş olabilir (özellikle misafir ağlarında).

**Taşınabilir Mod**

(v1.13.0 sürümünde tanıtıldı)

Çalıştırılabilir dosyayla aynı dizinde `settings.json` adında bir dosya oluşturun.
Bu dosya boş olabilir.
Uygulama, ayarları varsayılan konum yerine bu dosyada saklamak için bu dosyayı kullanacaktır.

**Gizli Başlat**

(v1.15.0 sürümünde güncellendi)

Uygulamayı gizli başlatmak için (yalnızca sistem tepsisinde), `--hidden` bayrağını kullanın (örnek: `localsend_app.exe --hidden`).

v1.14.0 ve önceki sürümlerde, `autostart` bayrağı ayarlandığında ve gizli ayarı etkinleştirildiğinde uygulama gizli başlar.

## Nasıl Çalışır

LocalSend, cihazların birbirleriyle iletişim kurmasını sağlayan güvenli bir iletişim protokolü kullanır ve bu iletişim REST API aracılığıyla gerçekleştirilir. Tüm veriler HTTPS üzerinden güvenli bir şekilde iletilir ve her cihazda anlık olarak oluşturulan TLS/SSL sertifikası ile maksimum güvenlik sağlanır.

LocalSend Protokolü hakkında daha fazla bilgi için [dökümantasyon](https://github.com/localsend/protocol).

## Başlarken

LocalSend'i kaynak kodundan derlemek için şu adımları izleyin:

1. Flutter'ı [doğrudan](https://flutter.dev) veya [fvm](https://fvm.app) kullanarak kurun (gerekli [sürüm](.fvmrc) için bakın.)
2. `LocalSend` reposunu klonlayın.
3. `cd app` komutunu çalıştırarak uygulama dizinine girin.
4. Bağımlılıkları indirmek için `flutter pub get` komutunu çalıştırın
5. Uygulamayı başlatmak iin `flutter run` komutunu çalıştırın

> [!NOT]
> LocalSend, şu anda daha eski bir Flutter sürümünü gerektiriyor(gerekli sürüm [.fvmrc](.fvmrc) dosyasında belirtilmiştir)
> bu nedenle gerekli sürüm ile (sistem genelinde) yüklü olan Flutter sürümü arasındaki uyumsuzluk derleme sorunlarına yol açabilir.
> Geliştirmeyi daha tutarlı hale getirmek için LocalSend, proje Flutter sürümünü yönetmek için [fvm](https://fvm.app) kullanır.
> `fvm`'yi kurduktan sonra, `flutter` yerine `fvm flutter` komutunu çalıştırın.

## Katkıda Bulunma

LocalSend'i geliştirmekle ilgilenen herkesten katkı bekliyoruz. Katkıda bulunmak isterseniz, dahil olmanın birkaç yolu vardır:

### Çeviri

Bu uygulamayı diğer dillere çevirmeye yardımcı olabilirsiniz!

1. Bu repoyu forklayın
2. Birini seçin
   - Mevcut dillerde eksik çevirileri ekleyin: Sadece [app/assets/i18n][i18n] içindeki `_missing_translations_<locale>.json`
   - Mevcut çevirileri düzeltin: [app/assets/i18n][i18n] içindeki `strings_<locale>.i18n.json` dosyasını güncelleyin.
   - Yeni diller ekleyin: Yeni bir dosya oluşturun; ayrıca [locale codes][] da bakın.
3. İsteğe bağlı: Bu uygulamayı yeniden çalıştırın
   1. Uygulama dizinine girmek için `cd app` komutunu çalıştırın.
   2. Bu uygulamayı en az bir kez [çalıştırdığınızdan](#başlarken) emin olun.
   3. Çevirileri güncellemek için `flutter pub run slang` komutunu çalıştırın.
   4. Uygulamayı `flutter run` komutuyla çalıştırın.
   5. Bir pull request açın.

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[locale kodları]: https://saimana.com/list-of-country-locale-code/

**_Take note:_ `@` ile süslenmiş alanlar çevrilmek için değildir; bu alanlar uygulamada herhangi bir şekilde kullanılmaz, yalnızca dosya hakkında bilgi veren veya çevirmen için bağlam sağlayan bilgilendirici metinlerdir.**

### Hata Düzeltmeleri ve İyileştirmeler

- **Hata Düzeltmeleri:** Bir hata bulursanız, lütfen sorunun ve nasıl düzeltileceğinin açık bir tanımıyla bir pull request oluşturun.
- **İyileştirmeler:** LocalSend'i geliştirmek için bir fikriniz var mı? Lütfen önce neden bu iyileştirmenin gerekli olduğunu tartışmak için bir issue oluşturun.

Daha fazla bilgi için [katkı sağlama kılavuzuna](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md) bakın.

## Derleme

Bu komutlar yalnızca geliştirenler için tasarlanmıştır.

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

**Mağaza hazır**

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

Talimatlar için [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md) dosyasına bakın.

## Katkıda Bulunanlar

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
