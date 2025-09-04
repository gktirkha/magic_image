import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'magic_cached_image.dart';
import 'magic_svg_image.dart';
import 'string_extension.dart';

/// A widget that displays an image from a given path (asset, network, or file),
/// with optional SVG support, placeholders, error widgets, and gestures.
class MagicImage extends StatelessWidget {
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
    this.dragStartBehavior = DragStartBehavior.start,
    this.excludeFromSemantics = false,
    this.supportedDevices,
    this.trackpadScrollCausesScale = false,
    this.trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    this.forceSvg = false,
    this.alignment,
    this.errorWidgetBuilder,
    this.placeHolderBuilder,
    this.semanticsLabel,
    this.svgPlaceHolder,
  });

  final String path;

  final BoxFit? fit;
  final double? height;
  final double? width;
  final double? squareDimension;

  final Widget? svgPlaceHolder;

  final ImageRepeat repeat;
  final Color? color;
  final BlendMode? blendMode;
  final ColorFilter? colorFilter;
  final BoxDecoration? boxDecoration;

  final double? defaultPlaceHolderSize;
  final Clip clipBehavior;
  final Map<String, String>? headers;
  final String? semanticsLabel;
  final bool excludeFromSemantics;

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

  final HitTestBehavior? behavior;
  final DragStartBehavior dragStartBehavior;

  final Set<PointerDeviceKind>? supportedDevices;
  final bool trackpadScrollCausesScale;
  final Offset trackpadScrollToScaleFactor;

  final bool forceSvg;

  final Alignment? alignment;

  final ImageErrorWidgetBuilder? errorWidgetBuilder;
  final Widget Function(BuildContext context)? placeHolderBuilder;

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

  Widget _buildImage() {
    if (path.isLocalFile) {
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
