/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsDataGen {
  const $AssetsDataGen();

  /// File path: assets/data/education.json
  String get education => 'assets/data/education.json';

  /// File path: assets/data/experience.json
  String get experience => 'assets/data/experience.json';

  /// File path: assets/data/projects.json
  String get projects => 'assets/data/projects.json';

  /// File path: assets/data/skills.json
  String get skills => 'assets/data/skills.json';

  /// File path: assets/data/summary.json
  String get summary => 'assets/data/summary.json';
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/client.svg
  SvgGenImage get client => const SvgGenImage('assets/icons/client.svg');

  /// File path: assets/icons/code.svg
  SvgGenImage get code => const SvgGenImage('assets/icons/code.svg');

  /// File path: assets/icons/contact.svg
  SvgGenImage get contact => const SvgGenImage('assets/icons/contact.svg');

  /// File path: assets/icons/education.svg
  SvgGenImage get education => const SvgGenImage('assets/icons/education.svg');

  /// File path: assets/icons/group.svg
  SvgGenImage get group => const SvgGenImage('assets/icons/group.svg');

  /// File path: assets/icons/language.svg
  SvgGenImage get language => const SvgGenImage('assets/icons/language.svg');

  /// File path: assets/icons/like.svg
  SvgGenImage get like => const SvgGenImage('assets/icons/like.svg');

  /// File path: assets/icons/moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/icons/moon.svg');

  /// File path: assets/icons/projects.svg
  SvgGenImage get projects => const SvgGenImage('assets/icons/projects.svg');

  /// File path: assets/icons/skills.svg
  SvgGenImage get skills => const SvgGenImage('assets/icons/skills.svg');

  /// File path: assets/icons/summary.svg
  SvgGenImage get summary => const SvgGenImage('assets/icons/summary.svg');

  /// File path: assets/icons/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/icons/sun.svg');

  /// File path: assets/icons/timeline.svg
  SvgGenImage get timeline => const SvgGenImage('assets/icons/timeline.svg');

  /// File path: assets/icons/working.svg
  SvgGenImage get working => const SvgGenImage('assets/icons/working.svg');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/acazia.png
  AssetGenImage get acazia => const AssetGenImage('assets/images/acazia.png');

  /// File path: assets/images/android-logo.png
  AssetGenImage get androidLogo => const AssetGenImage('assets/images/android-logo.png');

  /// File path: assets/images/app_development.gif
  AssetGenImage get appDevelopment => const AssetGenImage('assets/images/app_development.gif');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/b13.jpg
  AssetGenImage get b13 => const AssetGenImage('assets/images/b13.jpg');

  /// File path: assets/images/background.jpg
  AssetGenImage get background => const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/digital.jpeg
  AssetGenImage get digital => const AssetGenImage('assets/images/digital.jpeg');

  /// File path: assets/images/email.png
  AssetGenImage get email => const AssetGenImage('assets/images/email.png');

  /// File path: assets/images/flutter_logo.png
  AssetGenImage get flutterLogo => const AssetGenImage('assets/images/flutter_logo.png');

  /// File path: assets/images/github.png
  AssetGenImage get github => const AssetGenImage('assets/images/github.png');

  /// File path: assets/images/hust.png
  AssetGenImage get hust => const AssetGenImage('assets/images/hust.png');

  /// File path: assets/images/laptop.gif
  AssetGenImage get laptop => const AssetGenImage('assets/images/laptop.gif');

  /// File path: assets/images/linkedin.png
  AssetGenImage get linkedin => const AssetGenImage('assets/images/linkedin.png');

  /// File path: assets/images/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/images/phone.png');

  /// File path: assets/images/pyco.png
  AssetGenImage get pyco => const AssetGenImage('assets/images/pyco.png');

  /// File path: assets/images/react_native_logo.png
  AssetGenImage get reactNativeLogo => const AssetGenImage('assets/images/react_native_logo.png');

  /// File path: assets/images/skype.png
  AssetGenImage get skype => const AssetGenImage('assets/images/skype.png');
}

class $AssetsLangsGen {
  const $AssetsLangsGen();

  /// File path: assets/langs/en.json
  String get en => 'assets/langs/en.json';
}

class Assets {
  Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLangsGen langs = $AssetsLangsGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
