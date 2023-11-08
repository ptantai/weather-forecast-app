/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/icon-full-moon.png
  AssetGenImage get iconFullMoon =>
      const AssetGenImage('assets/images/icon-full-moon.png');

  /// File path: assets/images/icon-partly-cloudy.png
  AssetGenImage get iconPartlyCloudy =>
      const AssetGenImage('assets/images/icon-partly-cloudy.png');

  /// File path: assets/images/icon-rain.png
  AssetGenImage get iconRain =>
      const AssetGenImage('assets/images/icon-rain.png');

  /// File path: assets/images/icon-storm.png
  AssetGenImage get iconStorm =>
      const AssetGenImage('assets/images/icon-storm.png');

  /// File path: assets/images/icon-sunny.png
  AssetGenImage get iconSunny =>
      const AssetGenImage('assets/images/icon-sunny.png');

  /// File path: assets/images/icon-thermometer.png
  AssetGenImage get iconThermometer =>
      const AssetGenImage('assets/images/icon-thermometer.png');

  /// File path: assets/images/icon-weather-app.png
  AssetGenImage get iconWeatherApp =>
      const AssetGenImage('assets/images/icon-weather-app.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        iconFullMoon,
        iconPartlyCloudy,
        iconRain,
        iconStorm,
        iconSunny,
        iconThermometer,
        iconWeatherApp
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
