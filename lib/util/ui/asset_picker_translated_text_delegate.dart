import 'package:localsend_app/gen/strings.g.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class TranslatedAssetPickerTextDelegate extends AssetPickerTextDelegate {
  const TranslatedAssetPickerTextDelegate();

  @override
  String get languageCode => LocaleSettings.currentLocale.languageCode;

  @override
  String get confirm => t.assetPicker.confirm;

  @override
  String get cancel => t.assetPicker.cancel;

  @override
  String get edit => t.assetPicker.edit;

  @override
  String get gifIndicator => t.assetPicker.gifIndicator;

  @override
  String get loadFailed => t.assetPicker.loadFailed;

  @override
  String get original => t.assetPicker.original;

  @override
  String get preview => t.assetPicker.preview;

  @override
  String get select => t.assetPicker.select;

  @override
  String get emptyList => t.assetPicker.emptyList;

  @override
  String get unSupportedAssetType => t.assetPicker.unSupportedAssetType;

  @override
  String get unableToAccessAll => t.assetPicker.unableToAccessAll;

  @override
  String get viewingLimitedAssetsTip => t.assetPicker.viewingLimitedAssetsTip;

  @override
  String get changeAccessibleLimitedAssets => t.assetPicker.changeAccessibleLimitedAssets;

  @override
  String get accessAllTip => t.assetPicker.accessAllTip;

  @override
  String get goToSystemSettings => t.assetPicker.goToSystemSettings;

  @override
  String get accessLimitedAssets => t.assetPicker.accessLimitedAssets;

  @override
  String get accessiblePathName => t.assetPicker.accessiblePathName;

  @override
  String get sTypeAudioLabel => t.assetPicker.sTypeAudioLabel;

  @override
  String get sTypeImageLabel => t.assetPicker.sTypeImageLabel;

  @override
  String get sTypeVideoLabel => t.assetPicker.sTypeVideoLabel;

  @override
  String get sTypeOtherLabel => t.assetPicker.sTypeOtherLabel;

  @override
  String get sActionPlayHint => t.assetPicker.sActionPlayHint;

  @override
  String get sActionPreviewHint => t.assetPicker.sActionPreviewHint;

  @override
  String get sActionSelectHint => t.assetPicker.sActionSelectHint;

  @override
  String get sActionSwitchPathLabel => t.assetPicker.sActionSwitchPathLabel;

  @override
  String get sActionUseCameraHint => t.assetPicker.sActionUseCameraHint;

  @override
  String get sNameDurationLabel => t.assetPicker.sNameDurationLabel;

  @override
  String get sUnitAssetCountLabel => t.assetPicker.sUnitAssetCountLabel;
}
