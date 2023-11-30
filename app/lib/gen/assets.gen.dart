/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/logo-128.png
  AssetGenImage get logo128 => const AssetGenImage('assets/img/logo-128.png');

  /// File path: assets/img/logo-256.png
  AssetGenImage get logo256 => const AssetGenImage('assets/img/logo-256.png');

  /// File path: assets/img/logo-32-black.png
  AssetGenImage get logo32Black =>
      const AssetGenImage('assets/img/logo-32-black.png');

  /// File path: assets/img/logo-32-white.png
  AssetGenImage get logo32White =>
      const AssetGenImage('assets/img/logo-32-white.png');

  /// File path: assets/img/logo-32.png
  AssetGenImage get logo32 => const AssetGenImage('assets/img/logo-32.png');

  /// File path: assets/img/logo-512.png
  AssetGenImage get logo512 => const AssetGenImage('assets/img/logo-512.png');

  /// File path: assets/img/logo.ico
  String get logo => 'assets/img/logo.ico';

  /// List of all assets
  List<dynamic> get values =>
      [logo128, logo256, logo32Black, logo32White, logo32, logo512, logo];
}

class $AssetsWebGen {
  const $AssetsWebGen();

  /// File path: assets/web/error-403.html
  String get error403 => 'assets/web/error-403.html';

  /// File path: assets/web/index.html
  String get index => 'assets/web/index.html';

  /// File path: assets/web/main.js
  String get main => 'assets/web/main.js';

  /// List of all assets
  List<String> get values => [error403, index, main];
}

class Assets {
  Assets._();

  static const String changelog = 'assets/CHANGELOG.md';
  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsWebGen web = $AssetsWebGen();

  /// List of all assets
  List<String> get values => [changelog];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
