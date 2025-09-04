import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'magic_image_web.dart';

/// Extension on [String] to convert a string into a [MagicImage] widget.
///
/// A [MagicImage] widget configured with the provided parameters.
extension MagicImageExtension on String {
  Widget toMagicImage({
    BoxFit? fit,
    double? height,
    double? width,
    double? squareDimension,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Color? color,
    BlendMode? blendMode,
    ColorFilter? colorFilter,
    BoxDecoration? boxDecoration,
    double? defaultPlaceHolderSize,
    Clip clipBehavior = Clip.none,
    Map<String, String>? headers,
    HitTestBehavior? behavior,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool excludeFromSemantics = false,
    Set<PointerDeviceKind>? supportedDevices,
    bool trackpadScrollCausesScale = false,
    Offset trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    String? semanticsLabel,
    Alignment alignment = Alignment.center,
    bool forceSvg = false,
    ImageErrorWidgetBuilder? errorWidgetBuilder,
    Widget Function(BuildContext context)? placeHolderBuilder,
    Map<Type, GestureRecognizerFactory>? gestures,
    Key? key,
  }) {
    return MagicImage(
      this,
      gestures: gestures,
      behavior: behavior,
      dragStartBehavior: dragStartBehavior,
      excludeFromSemantics: excludeFromSemantics,
      supportedDevices: supportedDevices,
      trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
      trackpadScrollCausesScale: trackpadScrollCausesScale,
      blendMode: blendMode,
      boxDecoration: boxDecoration,
      clipBehavior: clipBehavior,
      color: color,
      colorFilter: colorFilter,
      defaultPlaceHolderSize: defaultPlaceHolderSize,
      fit: fit,
      headers: headers,
      height: height,
      repeat: repeat,
      squareDimension: squareDimension,
      width: width,
      forceSvg: forceSvg,
      semanticsLabel: semanticsLabel,
      alignment: alignment,
      errorWidgetBuilder: errorWidgetBuilder,
      placeHolderBuilder: placeHolderBuilder,
      key: key,
    );
  }
}
