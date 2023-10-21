# Contributing to LocalSend 🌟

LocalSend is not just an app; it's an open-source community, and we welcome contributions from passionate individuals like you. Whether you're a developer, translator, or documentation enthusiast, there's a place for you here.

## 🚀 Getting Started

If you're ready to join our journey, and want to contribute to the codebase of LocalSend, here's what you need to do:

### Running the App

Before you contribute to the code, it's important to get the app up and running on your local machine. Make sure you have [Flutter](https://flutter.dev) installed. Once that's done, kickstart the app by running these commands:

```shell
flutter pub get
flutter pub run build_runner build -d
flutter run
```

## 🌍 Translation

If you're more inclined toward languages, you can help make LocalSend accessible to a global audience by contributing translations. Here's how you can translate the app:

1. **Fork this Repository**: Go ahead and make a copy of our code by forking this repository.

2. **Choose Your Path**:
   - **Add Missing Translations in Existing Languages**: If you spot missing translations in existing languages, update the `_missing_translations_<locale>.json` file located in [assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n).
   - **Fix Existing Translations**: For existing languages, simply edit the `strings_<locale>.i18n.json` file in [assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n).
   - **Add New Languages**: Create a new translation file. Make sure to use the correct [locale codes](https://saimana.com/list-of-country-locale-code/).

3. **Optional: Re-run the App**:
   1. Ensure you've run the app at least once.
   2. Update translations via `flutter pub run slang`.
   3. Run the app again using `flutter run`.

4. **Open a Pull Request**: Once you're satisfied with your translation work, submit a pull request. We're eager to review it.

> **Note**: Fields decorated with `@` are not meant to be translated; they provide context for translators.

Kudos to our awesome translators! 🙏

| Language            | Translators                              |
|---------------------|------------------------------------------|
| Czech               | @Amereyeu                                |
| German              | Tien Do Nam (@Tienisto)                  |
| Spanish             | Esteban Daniel Saracho (@esaracho)       |
| Persian             | @farshad991                              |
| French              | @Nixuge                                  |
| Hungarian           | @gidano                                  |
| Hebrew              | @ShlomoCode                              |
| Japanese            | @soya-daizu                              |
| Korean              | @mgmix                                   |
| Russian             | Sergiy (@sergd88)                        |
| Ukrainian           | Sergiy (@sergd88)                        |
| Chinese (China)     | @nkh0472, @graphemecluster               |
| Chinese (Hong Kong) | @graphemecluster                         |
| Chinese (Taiwan)    | @Neo1102, @graphemecluster               |

Don't see your name? Let's change that - open a pull request! 🚀

## 📝 Contributing Guidelines

Before you share your masterpiece with us, please make sure it aligns with these guidelines:

- Code should be well-documented and formatted according to the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).
- Ensure all changes are covered by tests.
- Write clear and descriptive commits with a summary and context.
- Your pull requests should target the `main` branch and include a clear summary of the changes.

## 🐛 Bug Reports and 🚀 Feature Requests

Spotted a bug? Have an awesome idea? Share it with us! Use the [issue tracker](https://github.com/localsend/localsend/issues) to let us know. Be sure to provide a detailed description and steps to reproduce the issue.

## 🔐 Security Issues

If you uncover a security concern, please avoid posting it on the public issue tracker. Instead, reach out to us directly at [localsendapp@gmail.com](mailto:localsendapp@gmail.com) so we can address it swiftly and effectively.

## 🌐 Distribution

LocalSend is available through various channels, thanks to these fantastic maintainers. Here's a list of the distribution channels and their maintainers:

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
[nixos repo]: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/network

ing/localsend/default.nix
[f-droid]: https://f-droid.org/packages/org.localsend.localsend_app
[f-droid repo]: https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/org.localsend.localsend_app.yml

[Your idea here]: Create an issue and let us know how you can help!

> Let's spread LocalSend to even more platforms, together!

## 📋 Notes

Useful notes and additional information:

### 📦 Compile Production APK

Creating a production APK requires signing keys. If you don't have your own, you can use the debug signing options:

```groovy
// File: android/app/build.gradle
buildTypes {
  release {
    signingConfig signingConfigs.debug // use debug signing
  }
```

### ⬆️ Bump Flutter

If you'd like to update Flutter to a new version, follow these steps:

1. Update Flutter either from fvm or directly from the submodule.
2. Update the Flutter constraints in relevant files.

> Keep LocalSend up-to-date and thriving!

That's it! You're now well-equipped to contribute to LocalSend and be a part of our amazing community. Let's make LocalSend even better, one contribution at a time! 🌎🚀