/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Taratani_Logo-Final.jpg
  AssetGenImage get tarataniLogoFinal =>
      const AssetGenImage('assets/icons/Taratani_Logo-Final.jpg');

  /// File path: assets/icons/aboutUsIcon.svg
  String get aboutUsIcon => 'assets/icons/aboutUsIcon.svg';

  /// File path: assets/icons/bottom_nav_home.svg
  String get bottomNavHome => 'assets/icons/bottom_nav_home.svg';

  /// File path: assets/icons/home-01.svg
  String get home01 => 'assets/icons/home-01.svg';

  /// File path: assets/icons/homeIcon.svg
  String get homeIcon => 'assets/icons/homeIcon.svg';

  /// File path: assets/icons/homeIcon2.svg
  String get homeIcon2 => 'assets/icons/homeIcon2.svg';

  /// File path: assets/icons/keyIcon.svg
  String get keyIcon => 'assets/icons/keyIcon.svg';

  /// File path: assets/icons/logout.svg
  String get logout => 'assets/icons/logout.svg';

  /// File path: assets/icons/personIcon.svg
  String get personIcon => 'assets/icons/personIcon.svg';

  /// File path: assets/icons/settingsIcon.svg
  String get settingsIcon => 'assets/icons/settingsIcon.svg';

  /// File path: assets/icons/supportIcon.svg
  String get supportIcon => 'assets/icons/supportIcon.svg';

  /// List of all assets
  List<dynamic> get values => [
    tarataniLogoFinal,
    aboutUsIcon,
    bottomNavHome,
    home01,
    homeIcon,
    homeIcon2,
    keyIcon,
    logout,
    personIcon,
    settingsIcon,
    supportIcon,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/404PageImage.png
  AssetGenImage get a404PageImage =>
      const AssetGenImage('assets/images/404PageImage.png');

  /// File path: assets/images/referralScreenImage.svg
  String get referralScreenImage => 'assets/images/referralScreenImage.svg';

  /// File path: assets/images/splashScreenLogo.png
  AssetGenImage get splashScreenLogo =>
      const AssetGenImage('assets/images/splashScreenLogo.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// File path: assets/images/supportImage.png
  AssetGenImage get supportImage =>
      const AssetGenImage('assets/images/supportImage.png');

  /// File path: assets/images/verticalLogo.svg
  String get verticalLogo => 'assets/images/verticalLogo.svg';

  /// List of all assets
  List<dynamic> get values => [
    a404PageImage,
    referralScreenImage,
    splashScreenLogo,
    splashLogo,
    supportImage,
    verticalLogo,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
