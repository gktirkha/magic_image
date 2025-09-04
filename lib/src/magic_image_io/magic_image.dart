import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'magic_cached_image.dart';
import 'magic_svg_image.dart';
import 'string_extension.dart';

/// A versatile image widget that automatically handles
/// asset, network, and local file images with support for
/// both raster and SVG formats.
///
/// `MagicImage` supports:
/// - Local assets
/// - Network images (with caching)
/// - Local file paths
/// - SVG rendering (auto-detected or forced)
/// - Gestures via [RawGestureDetector]
/// - Custom placeholders and error widgets
///
/// This widget unifies Flutter’s `Image`, `SvgPicture`,
/// and caching logic into a single, convenient widget.
class MagicImage extends StatelessWidget {
  /// Creates a [MagicImage].
  ///
  /// The [path] must be either:
  /// - a network URL (`http://`, `https://`)
  /// - a local file path
  /// - an asset path
  ///
  /// SVGs are auto-detected by extension, or can be forced with [forceSvg].
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

  /// Path to the image (asset, file, or URL).
  final String path;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit? fit;

  /// Explicit height of the image.
  final double? height;

  /// Explicit width of the image.
  final double? width;

  /// A shorthand to set both [width] and [height] to the same value.
  final double? squareDimension;

  /// How to paint any portions of the image that are not covered by the source.
  final ImageRepeat repeat;

  /// If non-null, this color is blended with the image.
  final Color? color;

  /// The blend mode applied to [color].
  final BlendMode? blendMode;

  /// A custom [ColorFilter] to apply to the image.
  final ColorFilter? colorFilter;

  /// An optional decoration for the container around the image.
  final BoxDecoration? boxDecoration;

  /// Default placeholder size, used when no custom placeholder is given.
  final double? defaultPlaceHolderSize;

  /// How to clip the widget’s content.
  final Clip clipBehavior;

  /// Optional HTTP headers for network image requests.
  final Map<String, String>? headers;

  /// A semantic label for accessibility.
  final String? semanticsLabel;

  /// Whether to exclude semantics for this widget.
  final bool excludeFromSemantics;

  /// The behavior of hit testing for gestures.
  final HitTestBehavior? behavior;

  /// Devices allowed to trigger gesture recognizers.
  final Set<PointerDeviceKind>? supportedDevices;

  /// Whether to enable pinch-to-zoom with trackpad scroll gestures.
  final bool trackpadScrollCausesScale;

  /// Factor applied when scaling with trackpad scroll.
  final Offset trackpadScrollToScaleFactor;

  /// Forces the widget to render the image as an SVG,
  /// regardless of file extension.
  final bool forceSvg;

  /// Alignment of the image within its bounds.
  final Alignment? alignment;

  /// Custom builder for error widgets when image fails to load.
  final ImageErrorWidgetBuilder? errorWidgetBuilder;

  /// Custom builder for placeholder widgets while loading.
  final Widget Function(BuildContext context)? placeHolderBuilder;

  /// Use this to define gestures instead of individual callbacks.
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
        child: Container(
          clipBehavior: clipBehavior,
          decoration: boxDecoration,
          width: squareDimension ?? width,
          height: squareDimension ?? height,
          child: _buildImage(),
        ),
      ),
    );
  }

  /// Builds the appropriate image widget based on [path].
  Widget _buildImage() {
    if (path.isLocalFile) {
      // Local file image
      return (path.isSVG || forceSvg)
          ? MagicSvgImage(
              bytesLoader: SvgFileLoader(File(path)),
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
              image: FileImage(File(path)),
              alignment: alignment ?? Alignment.center,
              fit: fit,
              width: squareDimension ?? width,
              height: squareDimension ?? height,
              repeat: repeat,
              color: color,
              colorBlendMode: blendMode,
              errorBuilder: errorWidgetBuilder,
            );
    } else if (path.isURL) {
      // Network image
      return (path.isSVG || forceSvg)
          ? MagicSvgImage(
              bytesLoader: SvgNetworkLoader(path, headers: headers),
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
            );
    } else {
      // Asset image
      return (path.isSVG || forceSvg)
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
            );
    }
  }
}
