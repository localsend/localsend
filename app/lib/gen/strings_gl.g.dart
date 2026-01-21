///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsGl extends Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  TranslationsGl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
    : assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
      $meta = TranslationMetadata(
        locale: AppLocale.gl,
        overrides: overrides ?? {},
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      ),
      super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

  /// Metadata for the translations of <gl>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final TranslationsGl _root = this; // ignore: unused_field

  // Translations
  @override
  String get locale => 'Inglés';
  @override
  String get appName => 'LocalSend';
  @override
  late final _TranslationsGeneralGl general = _TranslationsGeneralGl._(_root);
  @override
  late final _TranslationsReceiveTabGl receiveTab = _TranslationsReceiveTabGl._(_root);
  @override
  late final _TranslationsSendTabGl sendTab = _TranslationsSendTabGl._(_root);
  @override
  late final _TranslationsSettingsTabGl settingsTab = _TranslationsSettingsTabGl._(_root);
}

// Path: general
class _TranslationsGeneralGl extends TranslationsGeneralEn {
  _TranslationsGeneralGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get accept => 'Aceptar';
  @override
  String get accepted => 'Aceptado';
  @override
  String get add => 'Engadir';
  @override
  String get advanced => 'Avanzado';
  @override
  String get cancel => 'Cancelar';
  @override
  String get close => 'Pechar';
  @override
  String get confirm => 'Confirmar';
  @override
  String get continueStr => 'Continuar';
  @override
  String get copy => 'Copiar';
  @override
  String get copiedToClipboard => 'Copiouse no Portapapeis';
  @override
  String get decline => 'Declinar';
  @override
  String get done => 'Feito';
  @override
  String get delete => 'Eliminar';
  @override
  String get edit => 'Editar';
  @override
  String get error => 'Erro';
  @override
  String get example => 'Exemplo';
  @override
  String get files => 'Arquivos';
  @override
  String get finished => 'Rematou';
  @override
  String get hide => 'Ocultar';
  @override
  String get off => 'Apagado';
  @override
  String get offline => 'Sen Conexión';
  @override
  String get on => 'Activado';
  @override
  String get online => 'En Liña';
  @override
  String get open => 'Aberto';
  @override
  String get queue => 'Fila';
  @override
  String get quickSave => 'Gardar Rápido';
  @override
  String get quickSaveFromFavorites => 'Gardar rápido para "Favoritos"';
  @override
  String get renamed => 'Renomeado';
  @override
  String get reset => 'Desfacer os cambios';
  @override
  String get restart => 'Reiniciar';
  @override
  String get settings => 'Configuración';
  @override
  String get skipped => 'Omitido';
  @override
  String get start => 'Comeza';
  @override
  String get stop => 'Parar';
  @override
  String get save => 'Gardar';
  @override
  String get unchanged => 'Sen Cambios';
  @override
  String get unknown => 'Descoñecido';
  @override
  String get noItemInClipboard => 'Non hai elementos no Portapapeis.';
}

// Path: receiveTab
class _TranslationsReceiveTabGl extends TranslationsReceiveTabEn {
  _TranslationsReceiveTabGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Recibir';
  @override
  late final _TranslationsReceiveTabInfoBoxGl infoBox = _TranslationsReceiveTabInfoBoxGl._(_root);
  @override
  late final _TranslationsReceiveTabQuickSaveGl quickSave = _TranslationsReceiveTabQuickSaveGl._(_root);
}

// Path: sendTab
class _TranslationsSendTabGl extends TranslationsSendTabEn {
  _TranslationsSendTabGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Enviar';
  @override
  late final _TranslationsSendTabSelectionGl selection = _TranslationsSendTabSelectionGl._(_root);
  @override
  late final _TranslationsSendTabPickerGl picker = _TranslationsSendTabPickerGl._(_root);
  @override
  String get shareIntentInfo => 'Tamén podes usar a función "Compartir" do teu dispositivo móbil para seleccionar ficheiros máis facilmente.';
  @override
  String get nearbyDevices => 'Dispositivos Próximos';
  @override
  String get thisDevice => 'Este Dispositivo';
  @override
  String get scan => 'Busca Dispositivos';
  @override
  String get manualSending => 'Envío Manual';
  @override
  String get sendMode => 'Modo de Envío';
  @override
  late final _TranslationsSendTabSendModesGl sendModes = _TranslationsSendTabSendModesGl._(_root);
  @override
  String get sendModeHelp => 'Explicación';
  @override
  String get help => 'Asegúrate de que o obxectivo desexado tamén estea na mesma rede wifi.';
  @override
  String get placeItems => 'Coloca elementos para compartir.';
}

// Path: settingsTab
class _TranslationsSettingsTabGl extends TranslationsSettingsTabEn {
  _TranslationsSettingsTabGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Configuración';
  @override
  late final _TranslationsSettingsTabGeneralGl general = _TranslationsSettingsTabGeneralGl._(_root);
}

// Path: receiveTab.infoBox
class _TranslationsReceiveTabInfoBoxGl extends TranslationsReceiveTabInfoBoxEn {
  _TranslationsReceiveTabInfoBoxGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get ip => 'IP:';
  @override
  String get port => 'Porto:';
  @override
  String get alias => 'Nome do Dispositivo:';
}

// Path: receiveTab.quickSave
class _TranslationsReceiveTabQuickSaveGl extends TranslationsReceiveTabQuickSaveEn {
  _TranslationsReceiveTabQuickSaveGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get off => _root.general.off;
  @override
  String get favorites => 'Favoritos';
  @override
  String get on => _root.general.on;
}

// Path: sendTab.selection
class _TranslationsSendTabSelectionGl extends TranslationsSendTabSelectionEn {
  _TranslationsSendTabSelectionGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Selección';
  @override
  String files({required Object files}) => 'Ficheiros: ${files}';
  @override
  String size({required Object size}) => 'Tamaño: ${size}';
}

// Path: sendTab.picker
class _TranslationsSendTabPickerGl extends TranslationsSendTabPickerEn {
  _TranslationsSendTabPickerGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get file => 'Arquivo';
  @override
  String get folder => 'Cartafol';
  @override
  String get media => 'Medios';
  @override
  String get text => 'Texto';
  @override
  String get app => 'App';
  @override
  String get clipboard => 'Pegar';
}

// Path: sendTab.sendModes
class _TranslationsSendTabSendModesGl extends TranslationsSendTabSendModesEn {
  _TranslationsSendTabSendModesGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get single => 'Destinatario Único';
  @override
  String get multiple => 'Múltiples Destinatarios';
  @override
  String get link => 'Comparte via ligazón';
}

// Path: settingsTab.general
class _TranslationsSettingsTabGeneralGl extends TranslationsSettingsTabGeneralEn {
  _TranslationsSettingsTabGeneralGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Xeral';
  @override
  String get brightness => 'Tema';
  @override
  late final _TranslationsSettingsTabGeneralBrightnessOptionsGl brightnessOptions = _TranslationsSettingsTabGeneralBrightnessOptionsGl._(_root);
  @override
  String get color => 'Cor';
  @override
  late final _TranslationsSettingsTabGeneralColorOptionsGl colorOptions = _TranslationsSettingsTabGeneralColorOptionsGl._(_root);
  @override
  String get language => 'Linguaxe';
  @override
  late final _TranslationsSettingsTabGeneralLanguageOptionsGl languageOptions = _TranslationsSettingsTabGeneralLanguageOptionsGl._(_root);
  @override
  String get saveWindowPlacement => 'Garda a posición da xanela despois de saír';
  @override
  String get saveWindowPlacementWindows => 'Garda a posición da xanela despois da saída';
  @override
  String get minimizeToTray => 'Minimizar á Bandexa do Sistema/Barra de Menú ao Pechar';
}

// Path: settingsTab.general.brightnessOptions
class _TranslationsSettingsTabGeneralBrightnessOptionsGl extends TranslationsSettingsTabGeneralBrightnessOptionsEn {
  _TranslationsSettingsTabGeneralBrightnessOptionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get dark => 'Escuro';
  @override
  String get light => 'Luz';
}

// Path: settingsTab.general.colorOptions
class _TranslationsSettingsTabGeneralColorOptionsGl extends TranslationsSettingsTabGeneralColorOptionsEn {
  _TranslationsSettingsTabGeneralColorOptionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
  @override
  String get oled => 'OLED';
}

// Path: settingsTab.general.languageOptions
class _TranslationsSettingsTabGeneralLanguageOptionsGl extends TranslationsSettingsTabGeneralLanguageOptionsEn {
  _TranslationsSettingsTabGeneralLanguageOptionsGl._(TranslationsGl root) : this._root = root, super.internal(root);

  final TranslationsGl _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Sistema';
}
