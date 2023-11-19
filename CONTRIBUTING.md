# Contributing to LocalSend

LocalSend is an open-source project, and we welcome contributions from anyone who is interested in helping improve the app. Whether you're a developer, a translator, or a documentation writer, there are many ways to get involved.

## Getting Started

If you're interested in contributing code to LocalSend, you'll need to follow these steps:

## Run

After you have installed [Flutter](https://flutter.dev), then you can start this app by typing the following commands:

```shell
flutter pub get
flutter pub run build_runner build -d
flutter run
```

## Translation

You can help in translating this app to other languages!

1. Fork this repository
2. Choose one
   - Add missing translations in existing languages: Only update `_missing_translations_<locale>.json` in [assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n)
   - Fix existing translations: Update `strings_<locale>.i18n.json` in [assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n)
   - Add new languages: Create a new file, see also: [locale codes](https://saimana.com/list-of-country-locale-code/).
3. Optional: Re-run this app
   1. Make sure you have [run](#run) this app once.
   2. Update translations via `flutter pub run slang`
   3. Run the app via `flutter run`
4. Open a pull request

**_Take note:_ Fields decorated with `@` are not meant to be translated, they are not used in the app in any way, being merely informative text about the file or to give context to the translator.**

Thanks to all [translators](https://github.com/localsend/localsend/tree/main/app/lib/pages/about/translators.dart)!

## Contributing Guidelines

Before you submit a pull request to LocalSend, please ensure that you have followed these guidelines:

- Code should be well-documented and formatted according to the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).
- All changes should be covered by tests.
- Commits should be well-written and descriptive, with a clear summary of the changes made and any relevant context.
- Pull requests should target the `main` branch and include a clear summary of the changes made.

## Bug Reports and Feature Requests

If you encounter a bug in LocalSend or have a feature request, please submit an issue to the [issue tracker](https://github.com/localsend/localsend/issues). Please be sure to provide a clear description of the problem or feature request, along with any relevant context or steps to reproduce the issue.

## Security Issues

If you discover a security issue in LocalSend, please do not submit an issue to the public issue tracker. Instead, please email us directly at [localsendapp@gmail.com](mailto:localsendapp@gmail.com) so that we can address the issue as quickly and effectively as possible.

## Distribution

Git based distribution:

| Channel        | Repository          | Maintainer                                         |
|----------------|---------------------|----------------------------------------------------|
| [Winget][]     | [Winget Repo][]     | [@sitiom][], [@Tienisto], Github Actions           |
| [Scoop][]      | [Scoop Repo][]      | [@sitiom][], [@Tienisto], Github Actions           |
| [Chocolatey][] | [Chocolatey Repo][] | [@brogers5][]                                      |
| [Homebrew][]   | [Homebrew Repo][]   | [@Tienisto][], Github Actions                      |
| [Flathub][]    | [Flathub Repo][]    | [@proletarius101][], [@Tienisto][], Github Actions |
| [AUR][]        | [AUR Repo][]        | [@Nixuge][]                                        |
| [NixOS][]      | [NixOS Repo][]      | [@sikmir][]                                        |
| [F-Droid][]    | [F-Droid Repo][]    | [@Tienisto][], [F-Droid CI][]                      |

[winget]: https://github.com/microsoft/winget-pkgs/tree/master/manifests/l/LocalSend/LocalSend
[winget repo]: https://github.com/microsoft/winget-pkgs/tree/master/manifests/l/LocalSend/LocalSend
[scoop]: https://scoop.sh/#/apps?s=0&d=1&o=true&q=localsend&id=fb88113be361ca32c0dcac423cb4afdeda0b0c66
[scoop repo]: https://github.com/ScoopInstaller/Extras/blob/master/bucket/localsend.json
[chocolatey]: https://community.chocolatey.org/packages/localsend
[chocolatey repo]: https://github.com/brogers5/chocolatey-package-localsend/tree/main
[homebrew]: https://github.com/localsend/homebrew-localsend
[homebrew repo]: https://github.com/localsend/homebrew-localsend
[flathub]: https://flathub.org/apps/details/org.localsend.localsend_app
[flathub repo]: https://github.com/flathub/org.localsend.localsend_app
[aur]: https://aur.archlinux.org/packages/localsend-bin
[aur repo]: https://aur.archlinux.org/localsend-bin.git
[nixos]: https://search.nixos.org/packages?show=localsend
[nixos repo]: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/localsend/default.nix
[f-droid]: https://f-droid.org/packages/org.localsend.localsend_app
[f-droid repo]: https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/org.localsend.localsend_app.yml

Manual distribution:

| Channel        | Maintainer                               |
|----------------|------------------------------------------|
| [App Store][]  | [@Tienisto](https://github.com/Tienisto) |
| [Play Store][] | [@Tienisto](https://github.com/Tienisto) |
| [Amazon][]     | [@Tienisto](https://github.com/Tienisto) |

[app store]: https://apps.apple.com/us/app/localsend/id1661733229
[play store]: https://play.google.com/store/apps/details?id=org.localsend.localsend_app
[amazon]: https://www.amazon.com/dp/B0BW6MP732

Binary distribution:

| Type        | Maintainer    | Credits                      |
|-------------|---------------|------------------------------|
| Windows ZIP | [@Tienisto][] |                              |
| MSIX        | [@Tienisto][] |                              |
| EXE         | [@Tienisto][] |                              |
| APK         | [@Tienisto][] |                              |
| TAR         | [@Tienisto][] |                              |
| DEB         | [@Tienisto][] |                              |
| AppImage    | [@Tienisto][] | [@TheGB0077][]               |
| DMG         | [@Tienisto][] |                              |

[@Tienisto]: https://github.com/Tienisto
[@TheGB0077]: https://github.com/TheGB0077
[@sitiom]: https://github.com/sitiom
[@Nixuge]: https://github.com/Nixuge
[@proletarius101]: https://github.com/proletarius101
[@brogers5]: https://github.com/brogers5
[@sikmir]: https://github.com/sikmir
[F-Droid CI]: https://gitlab.com/fdroidci

TODO:

You can help in publishing LocalSend on more platforms. Please create an issue to notify us!

- Traditional Linux distributions (Debian, Fedora, etc.)
- Snap
- (Your idea here)

## Notes

Useful notes.

### Compile production APK

You will need the signing keys to generate an APK.

Either generate one or use the debug signing options:

```groovy
// File: android/app/build.gradle
buildTypes {
  release {
    signingConfig signingConfigs.debug // using debug signing
  }
}
```

### Bump Flutter

Suppose we want to update flutter to `3.7.8` (see https://github.com/localsend/localsend/commit/7b95a7a5600db2742a9e05b956d0415d871239d5):

1. Update flutter from fvm: `fvm use 3.7.8`
2. Update flutter from submodule:
   1. `git submodule update --init`
   2. `cd submodules/flutter`
   3. `git fetch`
   4. `git checkout 3.7.8`
   5. `cd ../..`
   6. `git add submodules/flutter`
3. Update flutter constraints:
   1. In CI: `.github/workflows/ci.yml`
   2. In pubspec: `pubspec.yaml`
