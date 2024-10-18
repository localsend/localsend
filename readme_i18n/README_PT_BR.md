# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English](README.md) • [中文](README_ZH.md) • [日本語](README_JA.md) • [ภาษาไทย](README_TH.md) • [Filipino](README_PH.md) • [Polski](README_PL.md) • [Español](README_ES.md) • [Tiếng Việt](README_VI.md) • [Portugês Brasil](README_PT_BR.md) • [Italiano](README_IT.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

O LocanSend é um aplicativo gratuito e de código aberto que permite você compartilhar arquivos e mensagens de maneira segura com dispositivos próximos através da sua rede local sem a necessidade de uma conexão com a internet.

- [Sobre](#sobre)
- [Capturas de tela](#capturas-de-tela)
- [Instalar](#instalar)
- [Como funciona](#como-funciona)
- [Primeiros passos](#primeiros-passos)
- [Contribuindo](#contribuindo)
  - [Tradução](#tradução)
  - [Correção de bugs e melhorias](#correção-de-bugs-e-melhorias)
- [Compilando](#compilando)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Sobre

LocalSend é um aplicativo multiplataforma que permite comunicação segura entre dispositivos usando uma API REST e criptografia HTTPS. Ao contrário de outros aplicativos de mensagens que dependem de servidores externos, o LocalSend não requer uma conexão com a internet ou servidores de terceiros, tornando-o uma solução rápida e confiável para comunicação local.

## Capturas de tela

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="captura de tela do iPhone" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="captura de tela do PC" height="300"/>

## Instalar

É recomendado baixar o aplicativo de uma loja de aplicativos ou gerenciador de pacotes, pois o aplicativo não possui atualização automática.

| Windows                  | macOS                    | Linux              | Android        | iOS           | Fire OS    |
| ------------------------ | ------------------------ | ------------------ | -------------- | ------------- | ---------- |
| [Winget][]               | [App Store][]            | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]                | [Homebrew][]             | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]           | [Instalador DMG][latest] | [Snap][]           | [APK][latest]  |               |            |
| [Instalador EXE][latest] |                          | [AUR][]            |                |               |            |
| [Portable ZIP][latest]   |                          | [TAR][latest]      |                |               |            |
|                          |                          | [DEB][latest]      |                |               |            |
|                          |                          | [AppImage][latest] |                |               |            |

Leia mais sobre [distribution channels][].

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

## Configuração

Na maioria dos casos, o LocalSend deve funcionar imediatamente. No entanto, se você estiver tendo problemas para enviar ou receber arquivos, pode ser necessário configurar seu firewall para permitir que o LocalSend se comunique pela sua rede local.

| Tipo de tráfego | Protocolo | Porta    | Ação     |
| --------------- | --------- | -------- | -------- |
| Recebendo       | TCP, UDP  | 53317    | Permitir |
| Enviando        | TCP, UDP  | Qualquer | Permitir |

Lembre-se também de desativar a isolação de AP no seu roteador. Geralmente, ela vem desativada por padrão, mas alguns roteadores podem estar com ela ativada (especialmente em redes públicas).

**Modo Portátil**

(Introduzido na versão v1.13.0)

Crie um arquivo chamado `settings.json` localizado no mesmo diretório que o executável. Este arquivo pode estar vazio. Dessa forma, o aplicativo usará este arquivo para armazenar configurações em vez do local padrão.

**Iniciar oculto**

(Atualizado na versão v1.15.0)

Para iniciar o aplicativo oculto (apenas na bandeja), use a flag `--hidden` (exemplo: `localsend_app.exe --hidden`).

Na versão v1.14.0 e anteriores, o aplicativo inicia oculto se a flag `autostart` estiver definida e a configuração de ocultação estiver habilitada.

**Start hidden**

(Updated in v1.15.0)

To start the app hidden (only in tray), use the `--hidden` flag (example: `localsend_app.exe --hidden`).

On v1.14.0 and earlier, the app starts hidden if `autostart` flag is set, and the hidden setting is enabled.

## Como funciona

LocalSend utiliza um protocolo de comunicação seguro que permite que dispositivos se comuniquem entre si usando uma API REST. Todos os dados são enviados de forma segura via HTTPS, e o certificado TLS/SSL é gerado dinamicamente em cada dispositivo, garantindo máxima segurança.

Para mais informações sobre o Protocolo de Comunicação, veja a [documentação](https://github.com/localsend/protocol).

## Primeiros passos

Para compilar o LocalSend a partir do código-fonte, siga estes passos:

1. Instale o Flutter [diretamente](https://flutter.dev) ou usando [fvm](https://fvm.app) (veja [versão necessária](.fvmrc))
2. Clone o repositório `LocalSend`
3. Execute `cd app` para entrar no diretório do aplicativo
4. Execute `flutter pub get` para baixar as dependências
5. Execute `flutter run` para iniciar o aplicativo

> [!NOTE]
> Atualmente, o LocalSend requer uma versão mais antiga do Flutter (especificada em [.fvmrc](.fvmrc))
> e, portanto, problemas de compilação podem ser causados por uma incompatibilidade entre a versão necessária e a versão do Flutter instalada (em todo o sistema).  
> Para tornar o desenvolvimento mais consistente, o LocalSend usa o [fvm](https://fvm.app) para gerenciar a versão do Flutter do projeto.
> Após instalar o `fvm`, execute `fvm flutter` em vez de `flutter`.

## Contribuindo

Agradecemos contribuições de qualquer pessoa interessada em ajudar a melhorar o LocalSend. Se você deseja contribuir, há algumas maneiras de se envolver:

1. Faça um fork deste repositório
2. Escolha uma opção
   - Adicionar traduções faltantes em idiomas existentes: Atualize apenas `_missing_translations_<locale>.json` em [app/assets/i18n][i18n]
   - Corrigir traduções existentes: Atualize `strings_<locale>.i18n.json` em [app/assets/i18n][i18n]
   - Adicionar novos idiomas: Crie um novo arquivo; veja também: [codigos de localidade][].
3. Opcional: Re-execute este aplicativo
   1. Execute `cd app` para entrar no diretório do aplicativo.
   2. Certifique-se de ter [executado](#getting-started) este aplicativo uma vez.
   3. Atualize as traduções via `flutter pub run slang`
   4. Execute o aplicativo via `flutter run`
   5. Abra um pull request

[i18n]: https://github.com/localsend/localsend/tree/main/app/assets/i18n
[codigos de localidade]: https://saimana.com/list-of-country-locale-code/

**_Nota:_ Campos decorados com `@` não devem ser traduzidos; eles não são usados no aplicativo de nenhuma forma, sendo apenas texto informativo sobre o arquivo ou para dar contexto ao tradutor.**

### Correção de bugs e melhorias

- **Correção de Bugs:** Se você encontrar um bug, por favor, crie um pull request com uma descrição clara do problema e como corrigi-lo.
- **Melhorias:** Tem uma ideia de como melhorar o LocalSend? Por favor, crie uma issue primeiro para discutir por que a melhoria é necessária.

Para mais informações, veja o [guia de contribuição](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Compilando

Este comandos são destinados apenas para mantenedores.

### Android

APK convencional

```bash
flutter build apk
```

AppBundle para o Google Play

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

**Convencional**

```bash
flutter build windows
```

**Aplicativo MSIX local**

```bash
flutter pub run msix:create
```

**Pronto para a loja**

```bash
flutter pub run msix:create --store
```

### Linux

**Convencional**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Sinta-se livre para abrir um pull request. Há a branch `snap` para brincar.

## Contribuidores

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>