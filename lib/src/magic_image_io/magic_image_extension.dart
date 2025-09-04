import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'magic_image_io.dart';

/// Extension on [String] to easily create a [MagicImage] widget.
extension MagicImageExtension on String {
  Widget toMagicImage({
    // image display options
    BoxFit? fit,
    double? height,
    double? width,
    double? squareDimension,
    Alignment alignment = Alignment.center,
    Clip clipBehavior = Clip.none,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Color? color,
    BlendMode? blendMode,
    ColorFilter? colorFilter,
    BoxDecoration? boxDecoration,
    double? defaultPlaceHolderSize,

    // image type and sources
    Map<String, String>? headers,
    bool forceSvg = false,
    String? semanticsLabel,

    // placeholders & error handling
    Widget? errorWidget,
    Widget? svgPlaceHolder,
    ImageErrorWidgetBuilder? errorWidgetBuilder,
    Widget Function(BuildContext context)? placeHolderBuilder,

    // advanced gestures
    Map<Type, GestureRecognizerFactory>? gestures,
    HitTestBehavior? behavior,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool excludeFromSemantics = false,
    Set<PointerDeviceKind>? supportedDevices,
    bool trackpadScrollCausesScale = false,
    Offset trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    Key? key,
  }) {
    return MagicImage(
      this,
      fit: fit,
      height: height,
      width: width,
      squareDimension: squareDimension,
      alignment: alignment,
      clipBehavior: clipBehavior,
      repeat: repeat,
      color: color,
      blendMode: blendMode,
      colorFilter: colorFilter,
      boxDecoration: boxDecoration,
      defaultPlaceHolderSize: defaultPlaceHolderSize,
      headers: headers,
      forceSvg: forceSvg,
      svgPlaceHolder: svgPlaceHolder,
      errorWidgetBuilder: errorWidgetBuilder,
      placeHolderBuilder: placeHolderBuilder,
      gestures: gestures,
      behavior: behavior,
      dragStartBehavior: dragStartBehavior,
      supportedDevices: supportedDevices,
      trackpadScrollCausesScale: trackpadScrollCausesScale,
      trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
      key: key,
    );
  }
}
