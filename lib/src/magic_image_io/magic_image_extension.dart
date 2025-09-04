import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'magic_image_io.dart';

/// Extension on [String] to easily convert a URL or asset path
/// into a [MagicImage] widget.
///
/// Example:
/// ```dart
/// "https://example.com/image.png".toMagicImage(
///   height: 200,
///   width: 200,
///   fit: BoxFit.cover,
/// );
/// ```
extension MagicImageExtension on String {
  /// Converts the string (typically a URL, file path, or asset path)
  /// into a [MagicImage] widget with extensive customization options.
  Widget toMagicImage({
    /// How the image should be inscribed into the space allocated during layout.
    BoxFit? fit,

    /// The height of the image.
    double? height,

    /// The width of the image.
    double? width,

    /// If provided, sets both height and width to the same square size.
    double? squareDimension,

    /// Alignment of the image inside its bounds.
    Alignment alignment = Alignment.center,

    /// How to clip the content.
    Clip clipBehavior = Clip.none,

    /// How to paint any portions of the image that extend beyond its bounds.
    ImageRepeat repeat = ImageRepeat.noRepeat,

    /// If non-null, this color is blended with each image pixel using [blendMode].
    Color? color,

    /// The blend mode applied to the image with [color].
    BlendMode? blendMode,

    /// A color filter to apply when painting the image.
    ColorFilter? colorFilter,

    /// A custom [BoxDecoration] to wrap around the image.
    BoxDecoration? boxDecoration,

    /// Default placeholder size when the image is loading.
    double? defaultPlaceHolderSize,

    /// HTTP headers used when fetching the image from the network.
    Map<String, String>? headers,

    /// Forces the image to be treated as an SVG regardless of file extension.
    bool forceSvg = false,

    /// A semantic description of the image for accessibility.
    String? semanticsLabel,

    /// A widget displayed when the image fails to load.
    Widget? errorWidget,

    /// A custom error builder when image loading fails.
    ImageErrorWidgetBuilder? errorWidgetBuilder,

    /// A builder for a custom placeholder widget while the image loads.
    Widget Function(BuildContext context)? placeHolderBuilder,

    /// Gesture recognizers for handling user interactions.
    Map<Type, GestureRecognizerFactory>? gestures,

    /// Determines how this widget participates in hit testing.
    HitTestBehavior? behavior,

    /// Whether to exclude this image from semantics (e.g., screen readers).
    bool excludeFromSemantics = false,

    /// Which pointer device kinds are allowed to interact with this image.
    Set<PointerDeviceKind>? supportedDevices,

    /// Whether trackpad scroll should scale the image.
    bool trackpadScrollCausesScale = false,

    /// The scale factor applied when using trackpad scroll for zooming.
    Offset trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,

    /// An optional key for the widget.
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
      errorWidgetBuilder: errorWidgetBuilder,
      placeHolderBuilder: placeHolderBuilder,
      gestures: gestures,
      behavior: behavior,
      supportedDevices: supportedDevices,
      trackpadScrollCausesScale: trackpadScrollCausesScale,
      trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
      excludeFromSemantics: excludeFromSemantics,
      semanticsLabel: semanticsLabel,
      key: key,
    );
  }
}
