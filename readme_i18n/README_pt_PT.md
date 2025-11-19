<div align="center">
  <sup>Agradecimento especial a:</sup>
  <br><br>
  <a href="https://go.warp.dev/localsend" target="_blank">
    <img alt="Warp sponsorship" width="300" src="https://raw.githubusercontent.com/warpdotdev/brand-assets/refs/heads/main/Github/Sponsor/Warp-Github-LG-03.png">
    <br>
    <b>Warp, criado para programar usando múltiplos agentes de IA.</b>
    <br>
    <sup>Disponível para macOS, Linux e Windows</sup>
  </a>
</div>

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

[Página Principal][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[Inglês (Padrão)](README.md) • [Espanhol](readme_i18n/README_ES.md) • [Persa](readme_i18n/README_FA.md) • [Filipino](readme_i18n/README_PH.md) • [Françẽs](readme_i18n/README_FR.md) • [Indonésio](readme_i18n/README_ID.md) • [Italiano](readme_i18n/README_IT.md) • [Japonês](readme_i18n/README_JA.md) • [Quemer](readme_i18n/README_KM.md) • [Coreano](readme_i18n/README_KO.md) • [Polaco](readme_i18n/README_PL.md) • [Português do Brasil](readme_i18n/README_PT_BR.md) • [Português de Portugal](readme_i18n/README_PT_BR.md) • [Russo](readme_i18n/README_RU.md) • [Tailandês](readme_i18n/README_TH.md) • [Turco](readme_i18n/README_TR.md) • [Ucraniano](readme_i18n/README_UK.md) • [Vietnamita](readme_i18n/README_VI.md) • [Mandarim](readme_i18n/README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

O LocalSend é uma aplicação grátis de código aberto que lhe permite partilhar ficheiros e mensagens com dispositivos próximos a partir da sua rede local, sem precisar de uma conexão à internet.

- [Acerca de](#about)
- [Patrocinadores](#sponsors)
- [Imagens](#screenshots)
- [Transferir](#download)
- [Como Funciona](#how-it-works)
- [Como Começar](#getting-started)
- [Contribuir](#contributing)
  - [Tradução](#translation)
  - [Melhoramentos e Correção de Erros](#bug-fixes-and-improvements)
- [Resolução de Problemas](#troubleshooting)
- [Construir software](#building)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Acerca de

O LocalSend é uma aplicação multiplataforma que permite comunicações em segurança entre dispositivos, usando uma API REST e encriptação HTTPS. Ao contrário de outras aplicações de mensagens que dependem de servidores externos, o LocalSend não necessita de uma conexão à internet ou servidores de terceiros, fazendo com que este seja uma solução rápida e fiável para comunicações locais.

## Patrocinadores

Testes no navegador (browser) via:

<a href="https://www.lambdatest.com/" target="_blank">
    <img src="https://www.lambdatest.com/blue-logo.png" style="vertical-align: middle;" width="250" height="45" />
</a>

## Imagens

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="iPhone screenshot" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="PC screenshot" height="300"/>

## Transferir

[![Packaging status](https://repology.org/badge/tiny-repos/localsend.svg)](https://repology.org/project/localsend/versions)

É recomendado que faça a transferência da aplicação a partir de uma loja de aplicações ou de um gestor de pacotes porque a aplicação não se atualiza automaticamente.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [Instalador DMG][latest]| [Snap][]           | [APK][latest]  |               |            |
| [Instalador EXE][latest]|                         | [AUR][]            |                |               |            |
| [ZIP Portátil][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Saber mais sobre [canais de distribuição](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md#distribution).

> [!CAUTION]
> **Antevisão não oficial do MSIX:** pode experimentar versões em desenvolvimento a partir de [localsend.ob-buff.dev](https://localsend.ob-buff.dev/). A estabilidade não é garantida e todas as alterações de código estão listadas nesse web-site.

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

**Compatibilidade**

| Platforma | Versão Mínima | Notas                                                                                                                                      |
|----------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                                         |
| iOS      | 12.0            | -                                                                                                                                         |
| macOS    | 11 Big Sur      | Use o OpenCore Legacy Patcher 2.0.2 (Veja em [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384))         |
| Windows  | 10              | A última versão com suporte para o Windows 7 é v1.15.4. Poderão haver introduções retroativas em novas versões para o Windows 7 no futuro.|
| Linux    | N.A.            | Dependências: Gnome: `xdg-desktop-portal` e `xdg-desktop-portal-gtk`, KDE: `xdg-desktop-portal` e `xdg-desktop-portal-kde`                |

## Configuração

Na maior parte dos casos, o LocalSend deve funcionar sem ser necessário fazer alterações. Contudo, se tiver problemas ao enviar ou receber ficheiros, poderá ter que configurar a sua firewall para permitir que o LocalSend comunique a partir da sua rede local. 

| Tipo de Tráfego | Protocolo | Porta    | Ação      |
|-----------------|-----------|----------|-----------|
| Entrada         | TCP, UDP  | 53317    | Permitir  |
| Saída           | TCP, UDP  | Qualquer | Permitir  |

Certifique-se também de que desativou o Isolamento do Ponto de Acesso (AP) no seu router. Por predefinição, este normalmente encontra-se desativado mas pode estar ativado em alguns routers (especialmente em redes de hóspedes). Consulte a [Resolução de Problemas](#troubleshooting) para mais informações.

**Modo Portátil**

(Introduzido na versão v1.13.0)

Crie um ficheiro com o nome `settings.json` na pasta do ficheiro executável.
Este ficheiro pode estar vazio.
A aplicação vai usar este ficheiro para guardar definições em vez da localização padrão.

**Iniciar Minimizado**

(Atualizado na versão v1.15.0)

Para iniciar a aplicação com a janela minimizada (só no tabuleiro do sistema), use a flag `--hidden` (exemplo: `localsend_app.exe --hidden`).

Na versão v1.14.0 e anteriores, a aplicação inicia com a janela escondida se a flag `autostart` estiver definida e a definição de esconder estiver ativada.

## Como Funciona

O LocalSend usa um protocolo de comunicação seguro que permite com que os dispositivos comuniquem entre si usando uma API REST. Todos os dados são enviados de forma segura via HTTPS e os certificados TLS/SSL são gerados automaticamente para cada dispositivo, garantindo uma segurança máxima.

Para mais informações sobre o protocolo do LocalSend, consulte a [documentação](https://github.com/localsend/protocol).

## Como Começar

Para compilar o LocalSend a partir do código fonte, siga os seguintes passos:

1. Instale o Flutter [diretamente](https://flutter.dev) ou use o [fvm](https://fvm.app) (consulte a [versão necessária](.fvmrc))
2. Instale o [Rust](https://www.rust-lang.org/tools/install)
3. Faça um clone do repositório `LocalSend`
4. Execute `cd app` para entrar na pasta da aplicação
5. Execute `flutter pub get` para fazer a transferência de dependências
6. Execute `flutter run` para iniciar a aplicação

> [!NOTE]
> De momento o LocalSend necessita de uma versão mais antiga do Flutter (especificado em [.fvmrc](.fvmrc)),
> por isso podem ocorrer problemas na compilação que podem ser causados por incompatibilidades entre a versão do Flutter necessária e a versão instalada no sistema.  
> Para tornar o desenvolvimento mais consistente, o LocalSend usa o [fvm](https://fvm.app) para gerir a versão do Flutter do projeto.
> Depois de instalar o `fvm`, execute `fvm flutter` em vez de `flutter`.

## Contribuir

Todas as contribuições são bem-vindas para quem está interessado em ajudar a melhorar o LocalSend. Se pretende fazer contribuições, existem algumas formas de ajudar:

### Tradução

Pode ajudar a traduzir o LocalSend em outras línguas. Usamos a plataforma [Weblate](https://hosted.weblate.org/projects/localsend/app) para gerir as traduções.

Em alternativa, também pode contribuir ao fazer uma bifurcação (fork) deste repositório e adicionar as traduções manualmente.

A localização das traduções está no diretório [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). Pode editar os ficheiros `_missing_translations_<locale>.json` ou `strings_<locale>.i18n.json` para adicionar ou atualizar as traduções.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Translation status" />
</a>

**_Tome nota:_ Os campos que começam por `@` não são para ser traduzidos; estes não são usados de forma alguma pela aplicação, trata-se meramente de texto informativo sobre o ficheiro ou para dar o contexto a quem está a traduzir.**

### Melhoramentos e Correção de Erros

- **Correção de Erros:** Se encontrar um erro crie uma pull request, por favor, com uma descrição clara do problema e como resolver o mesmo.
- **Melhoramentos:** Tem um ideia que pode melhorar o LocalSend? Crie primeiro uma issue, por favor, para discutir a sua ideia e porque é necessária.

Para mais informação, consulte a [guia de contribuição](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Resolução de Problemas

| Problema                   | Plataforma (Saída) | Plataforma (Entrada) | Solução                                                                                                                                                      |
|----------------------------|--------------------|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Dispositivo não visível    | Qualquer           | Qualquer             | Certifique-se de que tem o Isolamento do Ponto de Acesso (AP) desativado no seu router. Se estiver ativo, as ligações entre dispositivos vão ser bloqueadas. |
| Dispositivo não visível    | Qualquer           | Windows              | Certifique-se de que a sua rede está configurada como "privada". O Windows pode ser mais restritivo quando a rede está configurada como "pública".           |
| Dispositivo não visível    | macOS, iOS         | Qualquer             | Pode tentar alterar as permissões da "Rede Local" na área de "Privacidade" nas definições do sistema operativo.                                              |
| Velocidade demasiado baixa | Qualquer           | Qualquer             | Utilize o 5 Ghz; Desative a encriptação em ambos os dispositivos.                                                                                            |
| Velocidade demasiado baixa | Qualquer           | Android              | Problema conhecido. https://github.com/flutter-cavalry/saf_stream/issues/4.                                                                                   |

## Construir Software

Estes comandos são destinados somente aos maintainers. Certefique-se que os executa a partir da pasta da aplicação.

### Android

APK Tradicional

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

**Tradicional**

```bash
flutter build windows
```

**Aplicação Local MSIX**

```bash
flutter pub run msix:create
```

**Preparado para a Loja**

```bash
flutter pub run msix:create --store
```

### Linux

**Tradicional**

```bash
flutter build linux
```

**AppImage**

```bash
appimage-builder --recipe AppImageBuilder.yml
```

**Snap**

Siga as instruções em [localsend/snap/README.md](https://github.com/localsend/snap/blob/main/README.md)

## Contribuidores

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
