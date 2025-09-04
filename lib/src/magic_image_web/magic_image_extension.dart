import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'magic_image_web.dart';

/// An extension on [String] that provides a convenient method
/// to convert a URL or asset path into a [MagicImage] widget.
extension MagicImageExtension on String {
  /// Creates a [MagicImage] widget from the current [String],
  /// which is typically expected to be a URL or an asset path.
  ///
  /// This method provides additional configuration options for
  /// customizing the appearance, behavior, and semantics of the image.
  Widget toMagicImage({
    /// How the image should be inscribed into the space allocated during layout.
    BoxFit? fit,

    /// The height of the image.
    double? height,

    /// The width of the image.
    double? width,

    /// A convenience parameter for setting both [height] and [width] equally.
    double? squareDimension,

    /// How to paint any portions of a box not covered by an image.
    ImageRepeat repeat = ImageRepeat.noRepeat,

    /// If non-null, this color is blended with each image pixel.
    Color? color,

    /// Used with [color] to define how to blend the color with the image.
    BlendMode? blendMode,

    /// A [ColorFilter] to apply when rendering the image.
    ColorFilter? colorFilter,

    /// A custom [BoxDecoration] to apply to the image container.
    BoxDecoration? boxDecoration,

    /// Default placeholder size to use if no placeholder builder is provided.
    double? defaultPlaceHolderSize,

    /// Controls how to clip the content.
    Clip clipBehavior = Clip.none,

    /// Optional HTTP headers for network images.
    Map<String, String>? headers,

    /// How to behave during hit testing.
    HitTestBehavior? behavior,

    /// Whether to exclude this image from the semantics tree.
    bool excludeFromSemantics = false,

    /// The set of pointer device kinds that are supported.
    Set<PointerDeviceKind>? supportedDevices,

    /// Whether trackpad scroll gestures should scale the image.
    bool trackpadScrollCausesScale = false,

    /// The factor applied when converting trackpad scroll input to scaling.
    Offset trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,

    /// A description of the image used for semantics (e.g. accessibility).
    String? semanticsLabel,

    /// How to align the image within its bounds.
    Alignment alignment = Alignment.center,

    /// Forces the image to be rendered as an SVG, if applicable.
    bool forceSvg = false,

    /// A custom builder for handling errors during image loading.
    ImageErrorWidgetBuilder? errorWidgetBuilder,

    /// A builder for displaying a placeholder while the image loads.
    Widget Function(BuildContext context)? placeHolderBuilder,

    /// Gesture recognizers to attach to the image.
    Map<Type, GestureRecognizerFactory>? gestures,

    /// The widget key.
    Key? key,
  }) {
    return MagicImage(
      this,
      gestures: gestures,
      behavior: behavior,
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
