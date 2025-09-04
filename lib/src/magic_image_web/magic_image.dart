import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'magic_cached_image.dart';
import 'magic_svg_image.dart';
import 'string_extension.dart';

/// A versatile image widget that automatically handles
/// network images, SVGs, and asset images with optional
/// caching, placeholders, gestures, and customization.
///
/// `MagicImage` simplifies displaying images in Flutter by:
/// - Detecting whether the image is from a network URL or an asset.
/// - Supporting both raster (PNG, JPG, etc.) and vector (SVG) formats.
/// - Providing optional gesture support using [RawGestureDetector].
/// - Allowing extensive customization such as fit, repeat, decoration, etc.
///
/// Example usage:
/// ```dart
/// MagicImage(
///   "https://example.com/image.png",
///   fit: BoxFit.cover,
///   height: 100,
///   width: 100,
///   gestures: {
///     TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
///       () => TapGestureRecognizer(),
///       (instance) => instance..onTap = () => print("Tapped!"),
///     ),
///   },
/// )
/// ```
class MagicImage extends StatelessWidget {
  /// Creates a [MagicImage].
  ///
  /// The [path] is required and determines whether the image is loaded
  /// from network or assets, and whether it's raster or SVG.
  const MagicImage(
    this.path, {
    super.key,
    this.fit,
    this.height,
    this.width,
    this.squareDimension,
    this.repeat = ImageRepeat.noRepeat,
    this.color,
    this.blendMode,
    this.colorFilter,
    this.boxDecoration,
    this.defaultPlaceHolderSize,
    this.clipBehavior = Clip.none,
    this.headers,
    this.gestures,
    this.behavior,
    this.excludeFromSemantics = false,
    this.supportedDevices,
    this.trackpadScrollCausesScale = false,
    this.trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    this.forceSvg = false,
    this.alignment,
    this.errorWidgetBuilder,
    this.placeHolderBuilder,
    this.semanticsLabel,
  });

  /// The image source. Can be:
  /// - A network URL.
  /// - An asset path.
  /// - An SVG (auto-detected if `.svg` or forced via [forceSvg]).
  final String path;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit? fit;

  /// Explicit height for the image.
  final double? height;

  /// Explicit width for the image.
  final double? width;

  /// A shortcut to set both width and height to the same value.
  final double? squareDimension;

  /// How to paint any portions of the image that do not fit.
  final ImageRepeat repeat;

  /// If non-null, this color is blended with each image pixel.
  final Color? color;

  /// Used with [color] to blend the image.
  final BlendMode? blendMode;

  /// Alternative to [color] + [blendMode], applies a full [ColorFilter].
  final ColorFilter? colorFilter;

  /// Optional decoration around the image (e.g., border, background).
  final BoxDecoration? boxDecoration;

  /// Default size used for placeholder widgets when no dimensions are specified.
  final double? defaultPlaceHolderSize;

  /// Controls how the child image is clipped.
  final Clip clipBehavior;

  /// HTTP headers to send when fetching a network image.
  final Map<String, String>? headers;

  /// Semantic label for accessibility.
  final String? semanticsLabel;

  /// Whether to exclude semantics information.
  final bool excludeFromSemantics;

  /// Defines gesture hit test behavior.
  final HitTestBehavior? behavior;

  /// Restricts which devices can trigger gestures (e.g., touch, mouse).
  final Set<PointerDeviceKind>? supportedDevices;

  /// Whether trackpad scrolling should cause scaling.
  final bool trackpadScrollCausesScale;

  /// Scaling factor for trackpad scroll gestures.
  final Offset trackpadScrollToScaleFactor;

  /// Forces SVG rendering even if the file extension does not indicate `.svg`.
  final bool forceSvg;

  /// Alignment of the image within its bounds.
  final Alignment? alignment;

  /// Custom error widget to display if image fails to load.
  final ImageErrorWidgetBuilder? errorWidgetBuilder;

  /// Custom placeholder widget to show while image is loading.
  final Widget Function(BuildContext context)? placeHolderBuilder;

  /// Use this to define gestures instead of dozens of callbacks.
  ///
  /// Example:
  /// ```dart
  /// gestures: {
  ///   TapGestureRecognizer: GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
  ///     () => TapGestureRecognizer(),
  ///     (instance) => instance..onTap = () => print("Tapped!"),
  ///   )
  /// }
  /// ```
  final Map<Type, GestureRecognizerFactory>? gestures;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      excludeSemantics: excludeFromSemantics,
      label: semanticsLabel,
      child: RawGestureDetector(
        gestures: gestures ?? {},
        behavior: behavior,
        child: _buildImage(),
      ),
    );
  }

  /// Builds the appropriate image widget depending on [path] and [forceSvg].
  Container _buildImage() {
    return Container(
      clipBehavior: clipBehavior,
      decoration: boxDecoration,
      width: squareDimension ?? width,
      height: squareDimension ?? height,
      child: path.isURL
          ? (path.isSVG || forceSvg)
              ? MagicSvgImage(
                  bytesLoader: SvgNetworkLoader(
                    Uri.parse(path).toString(),
                    headers: headers,
                  ),
                  alignment: alignment,
                  squareDimension: squareDimension,
                  width: width,
                  height: height,
                  fit: fit,
                  colorFilter: colorFilter,
                  color: color,
                  blendMode: blendMode,
                  errorWidgetBuilder: errorWidgetBuilder,
                  placeHolderBuilder: placeHolderBuilder,
                )
              : MagicCachedImage(
                  alignment: alignment,
                  headers: headers,
                  repeat: repeat,
                  squareDimension: squareDimension,
                  width: width,
                  height: height,
                  path: path,
                  fit: fit,
                  errorWidgetBuilder: errorWidgetBuilder,
                  placeHolderBuilder: placeHolderBuilder,
                  color: color,
                  blendMode: blendMode,
                )
          : (path.isSVG || forceSvg)
              ? MagicSvgImage(
                  bytesLoader: SvgAssetLoader(path),
                  alignment: alignment,
                  squareDimension: squareDimension,
                  width: width,
                  height: height,
                  fit: fit,
                  colorFilter: colorFilter,
                  color: color,
                  blendMode: blendMode,
                  errorWidgetBuilder: errorWidgetBuilder,
                  placeHolderBuilder: placeHolderBuilder,
                )
              : Image(
                  alignment: alignment ?? Alignment.center,
                  image: AssetImage(path),
                  fit: fit,
                  width: squareDimension ?? width,
                  height: squareDimension ?? height,
                  repeat: repeat,
                  color: color,
                  colorBlendMode: blendMode,
                  errorBuilder: errorWidgetBuilder,
                ),
    );
  }
}
