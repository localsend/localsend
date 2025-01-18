# LocalSend

[![CI status][ci-badge]][ci-workflow]
[![Translations][translate-badge]][translate-link]

[ci-badge]: https://github.com/localsend/localsend/actions/workflows/ci.yml/badge.svg
[ci-workflow]: https://github.com/localsend/localsend/actions/workflows/ci.yml
[translate-badge]: https://hosted.weblate.org/widget/localsend/app/svg-badge.svg
[translate-link]: https://hosted.weblate.org/engage/localsend/

[Página de inicio][homepage] • [Discord][discord] • [GitHub][github] • [Codeberg][codeberg]

[English (Default)](/README.md) • [Español](README_ES.md) • [فارسی](README_FA.md) • [Filipino](README_PH.md) • [Français](README_FR.md) • [Indonesia](README_ID.md) • [Italiano](README_IT.md) • [日本語](README_JA.md) • [ភាសាខ្មែរ](README_KM.md) • [한국어](README_KO.md) • [Polski](README_PL.md) • [Portugês Brasil](README_PT_BR.md) • [Русский](README_RU.md) • [ภาษาไทย](README_TH.md) • [Turkish](README_TR.md) • [Українська](README_UK.md) • [Tiếng Việt](README_VI.md) • [中文](README_ZH.md)

[homepage]: https://localsend.org
[discord]: https://discord.gg/GSRWmQNP87
[github]: https://github.com/localsend/localsend
[codeberg]: https://codeberg.org/localsend/localsend

LocalSend es una aplicación gratuita y de código abierto que te permite compartir archivos y mensajes de manera segura con dispositivos cercanos a través de tu red local, sin necesidad de una conexión a internet.

- [Acerca de](#acerca-de)
- [Capturas de Pantalla](#capturas-de-pantalla)
- [Descarga](#descarga)
- [Cómo Funciona](#cómo-funciona)
- [Primeros Pasos](#primeros-pasos)
- [Contribuir](#contribuir)
  - [Traducción](#traducción)
  - [Corrección de Errores y Mejoras](#corrección-de-errores-y-mejoras)
- [Solución de problemas](#solución-de-problemas)
- [Compilación](#compilación)
  - [Android](#android)
  - [iOS](#ios)
  - [macOS](#macos)
  - [Windows](#windows)
  - [Linux](#linux)

## Acerca de

LocalSend es una aplicación multiplataforma que permite la comunicación segura entre dispositivos utilizando una API REST y encriptación HTTPS. A diferencia de otras aplicaciones de mensajería que dependen de servidores externos, LocalSend no requiere conexión a internet ni servidores de terceros, lo que la convierte en una solución rápida y confiable para la comunicación local.

## Capturas de Pantalla

<img src="https://localsend.org/img/screenshot-iphone.webp" alt="Captura de pantalla del iPhone" height="300"/> <img src="https://localsend.org/img/screenshot-pc.webp" alt="Captura de pantalla del PC" height="300"/>

## Descarga

Se recomienda descargar la aplicación desde una tienda de aplicaciones o un gestor de paquetes, ya que la aplicación no tiene una función de actualización automática.

| Windows                 | macOS                   | Linux              | Android        | iOS           | Fire OS    |
|-------------------------|-------------------------|--------------------|----------------|---------------|------------|
| [Winget][]              | [App Store][]           | [Flathub][]        | [Play Store][] | [App Store][] | [Amazon][] |
| [Scoop][]               | [Homebrew][]            | [Nixpkgs][]        | [F-Droid][]    |               |            |
| [Chocolatey][]          | [DMG Installer][latest] | [Snap][]           | [APK][latest]  |               |            |
| [EXE Installer][latest] |                         | [AUR][]            |                |               |            |
| [Portable ZIP][latest]  |                         | [TAR][latest]      |                |               |            |
|                         |                         | [DEB][latest]      |                |               |            |
|                         |                         | [AppImage][latest] |                |               |            |

Lee más sobre los [canales de distribución][distribution channels].

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

**Compatibilidad**

| Plataforma | Versión Mínima   | Nota                                                                                                                      |
|------------|------------------|---------------------------------------------------------------------------------------------------------------------------|
| Android    | 5.0              | -                                                                                                                         |
| iOS        | 12.0             | -                                                                                                                         |
| macOS      | 11 Big Sur       | Usa OpenCore Legacy Patcher 2.0.2 (Ver [#1005](https://github.com/localsend/localsend/issues/1005#issuecomment-2449899384)) |
| Windows    | 10               | La última versión compatible con Windows 7 es la v1.15.4. Es posible que haya backports de versiones más nuevas para Windows 7 en el futuro. |
| Linux      | N.A.             | -                                                                                                                         |

## Configuración

En la mayoría de los casos, LocalSend debería funcionar sin configuraciones adicionales. Sin embargo, si tienes problemas para enviar o recibir archivos, es posible que necesites configurar tu firewall para permitir que LocalSend se comunique a través de tu red local.

| Tipo de Tráfico | Protocolo | Puerto     | Acción  |
|-----------------|-----------|------------|---------|
| Entrante        | TCP, UDP  | 53317      | Permitir|
| Saliente        | TCP, UDP  | Cualquiera | Permitir|

Asegúrate también de desactivar el aislamiento de AP en tu enrutador. Esto generalmente viene desactivado de manera predeterminada, pero algunos enrutadores pueden tenerlo habilitado (especialmente en redes de invitados).

**Modo Portable**

(Introducido en la versión v1.13.0)

Crea un archivo llamado `settings.json` en el mismo directorio que el ejecutable. Este archivo puede estar vacío. La aplicación usará este archivo para almacenar configuraciones en lugar de la ubicación predeterminada.

**Iniciar oculto**

(Actualizado en la versión v1.15.0)

Para iniciar la aplicación de forma oculta (solo en la bandeja), usa el parámetro `--hidden` (ejemplo: `localsend_app.exe --hidden`).

En la versión v1.14.0 y anteriores, la aplicación comenzaba oculta si el parámetro `autostart` estaba configurado y la opción oculta estaba habilitada.

## Cómo Funciona

LocalSend utiliza un protocolo de comunicación seguro que permite que los dispositivos se comuniquen entre sí usando una API REST. Todos los datos se envían de manera segura a través de HTTPS, y el certificado TLS/SSL se genera automáticamente en cada dispositivo, garantizando la máxima seguridad.

Para más información sobre el protocolo LocalSend, consulta la [documentación](https://github.com/localsend/protocol).

## Primeros Pasos

Para compilar LocalSend desde el código fuente, sigue estos pasos:

1. Instala Flutter [directamente](https://flutter.dev) o utilizando [fvm](https://fvm.app) (ver [versión requerida](.fvmrc))
2. Instala [Rust](https://www.rust-lang.org/tools/install)
3. Clona el repositorio de `LocalSend`
4. Ejecuta `cd app` para entrar en el directorio de la aplicación
5. Ejecuta `flutter pub get` para descargar las dependencias
6. Ejecuta `flutter run` para iniciar la aplicación

> [!NOTA]
> LocalSend actualmente requiere una versión más antigua de Flutter (especificada en [.fvmrc](.fvmrc))
> y por lo tanto pueden surgir problemas de compilación debido a una discrepancia entre la versión requerida y la instalada a nivel de sistema.  
> Para hacer el desarrollo más consistente, LocalSend utiliza [fvm](https://fvm.app) para gestionar la versión de Flutter del proyecto.
> Después de instalar `fvm`, ejecuta `fvm flutter` en lugar de `flutter`.

## Contribuir

Damos la bienvenida a contribuciones de cualquier persona interesada en mejorar LocalSend. Si deseas contribuir, hay varias formas de hacerlo:

### Traducción

Puedes ayudar a traducir LocalSend a otros idiomas. Usamos la plataforma [Weblate](https://hosted.weblate.org/projects/localsend/app) para gestionar las traducciones.

Alternativamente, también puedes contribuir haciendo un fork a este repositorio y añadiendo traducciones manualmente.

Las traducciones se encuentran en el directorio [app/assets/i18n](https://github.com/localsend/localsend/tree/main/app/assets/i18n). Edita el archivo `_missing_translations_<locale>.json` o `strings_<locale>.i18n.json` para añadir o actualizar traducciones.

<a href="https://hosted.weblate.org/engage/localsend/">
<img src="https://hosted.weblate.org/widget/localsend/app/multi-auto.svg" alt="Estado de traducción" />
</a>

**_Ten en cuenta:_ Los campos decorados con `@` no están destinados a ser traducidos; no son utilizados en la aplicación de ninguna manera, solo son texto informativo sobre el archivo o para dar contexto al traductor.**

### Corrección de Errores y Mejoras

- **Corrección de Errores:** Si encuentras un error, por favor crea una pull request con una descripción clara del problema y cómo solucionarlo.
- **Mejoras:** ¿Tienes una idea sobre cómo mejorar LocalSend? Por favor, crea primero un issue para discutir por qué es necesaria la mejora.

Para más información, consulta la [guía de contribuciones](https://github.com/localsend/localsend/blob/main/CONTRIBUTING.md).

## Solución de Problemas

| Problema            | Plataforma (Emisor) | Plataforma (Receptor) | Solución                                                                                                                                |
|---------------------|---------------------|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Dispositivo no visible | Cualquiera         | Cualquiera             | Asegúrate de desactivar la *AP-Isolation* en tu router. Si está activada, las conexiones entre dispositivos están prohibidas.            |
| Dispositivo no visible | Cualquiera         | Windows                | Configura tu red como una red "privada". Windows puede ser más restrictivo cuando la red está configurada como pública.                  |
| Dispositivo no visible | macOS, iOS         | Cualquiera             | Intenta alternar el permiso de "Red Local" en la sección de "Privacidad" de la configuración del sistema operativo.                      |
| Velocidad muy lenta  | Cualquiera         | Cualquiera             | Usa 5 GHz; Desactiva la encriptación en ambos dispositivos                                                                               |
| Velocidad muy lenta  | Cualquiera         | Android                | Problema conocido. [https://github.com/flutter-cavalry/saf_stream/issues/4](https://github.com/flutter-cavalry/saf_stream/issues/4)      |
## Compilación

Estos comandos están destinados solo para los mantenedores.

### Android

APK tradicional

```bash
flutter build apk
```

AppBundle para Google Play

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

**Aplicación Local MSIX**

```bash
flutter pub run msix:create
```

**Preparado para la tienda**

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

Siéntete libre de abrir una pull request. Hay una rama `snap` para experimentar.

## Contribuidores

<a href="https://github.com/localsend/localsend/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=localsend/localsend"  alt="Localsend Contributors"/>
</a>
