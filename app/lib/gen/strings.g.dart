/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 34
/// Strings: 9563 (281 per locale)

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

part 'strings_en.g.dart';
part 'strings_ar.g.dart';
part 'strings_bn.g.dart';
part 'strings_ca.g.dart';
part 'strings_cs.g.dart';
part 'strings_da.g.dart';
part 'strings_de.g.dart';
part 'strings_el.g.dart';
part 'strings_es_ES.g.dart';
part 'strings_eu.g.dart';
part 'strings_fa.g.dart';
part 'strings_fil_PH.g.dart';
part 'strings_fr.g.dart';
part 'strings_he.g.dart';
part 'strings_hu.g.dart';
part 'strings_id.g.dart';
part 'strings_it.g.dart';
part 'strings_ja.g.dart';
part 'strings_km.g.dart';
part 'strings_ko.g.dart';
part 'strings_ne.g.dart';
part 'strings_nl.g.dart';
part 'strings_pl.g.dart';
part 'strings_pt_BR.g.dart';
part 'strings_ru.g.dart';
part 'strings_sv.g.dart';
part 'strings_th.g.dart';
part 'strings_tr.g.dart';
part 'strings_uk.g.dart';
part 'strings_ur.g.dart';
part 'strings_vi.g.dart';
part 'strings_zh_CN.g.dart';
part 'strings_zh_HK.g.dart';
part 'strings_zh_TW.g.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ar(languageCode: 'ar', build: _StringsAr.build),
	bn(languageCode: 'bn', build: _StringsBn.build),
	ca(languageCode: 'ca', build: _StringsCa.build),
	cs(languageCode: 'cs', build: _StringsCs.build),
	da(languageCode: 'da', build: _StringsDa.build),
	de(languageCode: 'de', build: _StringsDe.build),
	el(languageCode: 'el', build: _StringsEl.build),
	esEs(languageCode: 'es', countryCode: 'ES', build: _StringsEsEs.build),
	eu(languageCode: 'eu', build: _StringsEu.build),
	fa(languageCode: 'fa', build: _StringsFa.build),
	filPh(languageCode: 'fil', countryCode: 'PH', build: _StringsFilPh.build),
	fr(languageCode: 'fr', build: _StringsFr.build),
	he(languageCode: 'he', build: _StringsHe.build),
	hu(languageCode: 'hu', build: _StringsHu.build),
	id(languageCode: 'id', build: _StringsId.build),
	it(languageCode: 'it', build: _StringsIt.build),
	ja(languageCode: 'ja', build: _StringsJa.build),
	km(languageCode: 'km', build: _StringsKm.build),
	ko(languageCode: 'ko', build: _StringsKo.build),
	ne(languageCode: 'ne', build: _StringsNe.build),
	nl(languageCode: 'nl', build: _StringsNl.build),
	pl(languageCode: 'pl', build: _StringsPl.build),
	ptBr(languageCode: 'pt', countryCode: 'BR', build: _StringsPtBr.build),
	ru(languageCode: 'ru', build: _StringsRu.build),
	sv(languageCode: 'sv', build: _StringsSv.build),
	th(languageCode: 'th', build: _StringsTh.build),
	tr(languageCode: 'tr', build: _StringsTr.build),
	uk(languageCode: 'uk', build: _StringsUk.build),
	ur(languageCode: 'ur', build: _StringsUr.build),
	vi(languageCode: 'vi', build: _StringsVi.build),
	zhCn(languageCode: 'zh', countryCode: 'CN', build: _StringsZhCn.build),
	zhHk(languageCode: 'zh', countryCode: 'HK', build: _StringsZhHk.build),
	zhTw(languageCode: 'zh', countryCode: 'TW', build: _StringsZhTw.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}
