# LocalSend

[![CI status][ci-badge]][ci-workflow]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml

[Homepage][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Português Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

O LocalSend é um aplicativo gratuito e de código aberto que permite você compartilhar arquivos e mensagens de maneira segura com dispositivos próximos através da sua rede local sem a necessidade de uma conexão com a internet.

- [Sobre](#sobre)
- [Capturas de tela](#capturas-de-tela)
- [Instalar](#instalar)
- [Como funciona](#como-funciona)
- [Primeiros passos](#primeiros-passos)
- [Contribuindo](#contribuindo)
  - [Tradução](#tradução)
  - [Correções de bugs e melhorias](#correções-de-bugs-e-melhorias)
- [Resolução de problemas](#resolução-de-problemas)
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
| [Arquivo ZIP][latest]   |                          | [Arquivo TAR][latest]      |                |               |            |
|                          |                          | [Pacote DEB][latest]      |                |               |            |
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

**Compatibilidade**

| Platforma | Versão Mínima | Nota                                                                                                                        |
|----------|-----------------|-----------------------------------------------------------------------------------------------------------------------------|
| Android  | 5.0             | -                                                                                                                           |
| iOS      | 12.0            | -                                                                                                                           |
| macOS    | 11 Big Sur      | Use o OpenCore Legacy Patcher 2.0.2 (See [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows  | 10              | A última versão a suportar o Windows 7 é a v1.15.4. Pode haver versões mais recentes adaptadas para o Windows 7 no futuro.   |
| Linux    | N.A.            | -                                                                                                                           |

## Configuração

Na maioria dos casos, o LocalSend deve funcionar automaticamente. No entanto, se você estiver tendo problemas para enviar ou receber arquivos, pode ser necessário configurar seu firewall para permitir que o LocalSend se comunique pela sua rede local.

| Tipo de tráfego | Protocolo | Porta    | Ação     |
| --------------- | --------- | -------- | -------- |
| Recebendo       | TCP, UDP  | 53317    | Permitir |
| Enviando        | TCP, UDP  | Qualquer | Permitir |

Lembre-se também de desativar a isolação de AP no seu roteador. Geralmente, ela vem desativada por padrão, mas alguns roteadores podem estar com ela ativada (especialmente em redes públicas).
Veja em [resolução de problemas](#resolucao-de-problemas) para maiores informações.

**Modo Portátil**

(Introduzido na versão v1.13.0)

Crie um arquivo chamado `settings.json` localizado no mesmo diretório que o executável. Este arquivo pode estar vazio. Dessa forma, o aplicativo usará este arquivo para armazenar configurações em vez do local padrão.

**Modo Portátil**

(Introduzido na v1.13.0)

Crie um arquivo chamado `settings.json` localizado no mesmo diretório do executável.
Este arquivo pode estar vazio.
O aplicativo usará este arquivo para armazenar as configurações, em vez do local padrão.

**Iniciar Minimizado**

(Atualizado na versão v1.15.0)

Para iniciar o aplicativo oculto (apenas na bandeja), use a flag `--hidden` (exemplo: `localsend_app.exe --hidden`).

Na versão v1.14.0 e anteriores, o aplicativo inicia oculto se a flag `autostart` estiver definida e a configuração de ocultação estiver habilitada.

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

Agradecemos as contribuições de todos que estão interessados em ajudar a melhorar o LocalSend. Se você gostaria de contribuir, existem algumas maneiras de se envolver:

### Tradução

Você pode ajudar a traduzir o LocalSend para outros idiomas. **Forma recomendada**: Use a plataforma [Weblate](https://hosted.weblate.org/projects/localsend/app) para gerenciar as traduções.

**Alternativamente**: Você também pode contribuir fazendo um fork deste repositório e adicionando as traduções manualmente.

As traduções estão localizadas no diretório [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). Edite o arquivo `_missing_translations_<locale>.json` ou `strings_<locale>.i18n.json` para adicionar ou atualizar traduções.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Status da tradução" />
</a>

**_Nota:_ Campos decorados com `@` não devem ser traduzidos; eles não são utilizados no aplicativo de nenhuma forma, sendo apenas texto informativo sobre o arquivo ou para dar contexto ao tradutor.**

### Correções de bugs e melhorias

- **Correções de Bugs:** Se você encontrar um bug, por favor, crie um pull request com uma descrição clara do problema e como corrigi-lo.
- **Melhorias:** Tem uma ideia de como melhorar o LocalSend? Por favor, crie uma issue primeiro para discutir por que a melhoria é necessária.

Para mais informações, consulte o [guia de contribuição](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).


## Resolução de problemas

| Problema           | Plataforma (Envio) | Plataforma (Recebimento) | Solução                                                                                                                               |
|--------------------|--------------------|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Dispositivo não visível | Qualquer           | Qualquer                 | Certifique-se de desativar a Isolação de AP no seu roteador. Se estiver ativada, conexões entre dispositivos são bloqueadas.           |
| Dispositivo não visível | Qualquer           | Windows                  | Certifique-se de configurar sua rede como uma rede "privada". O Windows pode ser mais restritivo quando a rede está configurada como pública. |
| Dispositivo não visível | macOS, iOS         | Qualquer                 | Tente alternar a permissão "Rede Local" em "Privacidade" nas configurações do sistema operacional.                                     |
| Velocidade muito lenta | Qualquer           | Qualquer                 | Use 5 Ghz; desative a criptografia em ambos os dispositivos.                                                                            |
| Velocidade muito lenta | Qualquer           | Android                  | Problema conhecido. https://github.com/flutter-cavalry/saf_stream/issues/4                                                               |

