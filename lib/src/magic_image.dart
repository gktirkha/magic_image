import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'string_extension.dart';

/// A widget that displays an image from a given path, with support for both
/// network and asset images, including SVG format. It also provides optional
/// customization options like fit, color, dimensions, and placeholder/error widgets.
class MagicImage extends StatelessWidget {
  /// Creates a [MagicImage] widget.
  ///
  /// The [path] parameter must not be null.
  /// The [fit], [height], [width], [squareDimension], [placeholderWidget],
  /// [errorWidget], [svgPlaceHolder], [repeat], [color], [blendMode],
  /// [colorFilter], [boxDecoration], [clipBehavior] and [defaultPlaceHolderSize] parameters are optional.
  const MagicImage(
    this.path, {
    super.key,
    this.fit,
    this.height,
    this.width,
    this.squareDimension,
    this.placeholderWidget,
    this.errorWidget,
    this.svgPlaceHolder,
    this.repeat = ImageRepeat.noRepeat,
    this.color,
    this.blendMode,
    this.colorFilter,
    this.boxDecoration,
    this.defaultPlaceHolderSize,
    this.clipBehavior = Clip.none,
  });

  /// The path of the image to display.
  ///
  /// It can be a URL for network images or a local asset path.
  final String path;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit? fit;

  /// The height of the image.
  final double? height;

  /// The width of the image.
  final double? width;

  /// If specified, the image will be rendered with this square dimension.
  final double? squareDimension;

  /// A widget to display while the image is loading.
  final Widget? placeholderWidget;

  /// A widget to display if an error occurs while loading the image.
  final Widget? errorWidget;

  /// A widget to display as a placeholder while loading an SVG image.
  final Widget? svgPlaceHolder;

  /// How to paint any portions of the image that are not covered by the source image.
  ///
  /// Will not be applied if the image is an SVG.
  final ImageRepeat repeat;

  /// The color to blend with the image.
  ///
  /// If the image is an SVG, and a color filter is passed, it will be used instead.
  final Color? color;

  /// The blend mode to apply when blending the image with the color.
  ///
  /// If the image is an SVG, and a color filter is passed, it will be used instead.
  final BlendMode? blendMode;

  /// A color filter to apply to the image.
  ///
  /// This will be applied only if the image is an SVG.
  final ColorFilter? colorFilter;

  /// A decoration to apply to the container holding the image.
  final BoxDecoration? boxDecoration;

  /// The size of the default loading indicator.
  ///
  /// If Using Custom placeholder it will have no effect
  final double? defaultPlaceHolderSize;

  /// Clip Behavior For image, default [Clip.none]
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double minSize = min(constraints.maxHeight, constraints.maxWidth);
        final double loaderSize =
            defaultPlaceHolderSize ?? (minSize > 40 ? 40 : minSize / 2);
        return Container(
          clipBehavior: clipBehavior,
          decoration: boxDecoration,
          width: squareDimension ?? width,
          height: squareDimension ?? height,
          child: path.isURL
              ? path.endsWith('.svg')
                  ? SvgPicture.network(
                      width: squareDimension ?? width,
                      height: squareDimension ?? height,
                      path,
                      placeholderBuilder: (BuildContext context) =>
                          svgPlaceHolder ??
                          placeholderWidget ??
                          Center(
                            child: SizedBox.square(
                              dimension: loaderSize,
                              child: const CircularProgressIndicator(),
                            ),
                          ),
                      fit: fit ?? BoxFit.contain,
                      colorFilter: colorFilter != null
                          ? colorFilter
                          : (color == null || blendMode == null)
                              ? null
                              : ColorFilter.mode(color!, blendMode!),
                    )
                  : CachedNetworkImage(
                      repeat: repeat,
                      width: squareDimension ?? width,
                      height: squareDimension ?? height,
                      imageUrl: path,
                      placeholder: (BuildContext context, String url) =>
                          placeholderWidget ??
                          Center(
                            child: SizedBox.square(
                              dimension: loaderSize,
                              child: const CircularProgressIndicator(),
                            ),
                          ),
                      errorWidget:
                          (BuildContext context, String url, Object error) =>
                              errorWidget ?? const SizedBox.shrink(),
                      fit: fit,
                      color: color,
                      colorBlendMode: blendMode,
                    )
              : path.endsWith('.svg')
                  ? SvgPicture.asset(
                      width: squareDimension ?? width,
                      height: squareDimension ?? height,
                      path,
                      fit: fit ?? BoxFit.contain,
                      colorFilter: colorFilter != null
                          ? colorFilter
                          : (color == null || blendMode == null)
                              ? null
                              : ColorFilter.mode(color!, blendMode!),
                    )
                  : Image.asset(
                      path,
                      fit: fit,
                      width: squareDimension ?? width,
                      height: squareDimension ?? height,
                      repeat: repeat,
                      color: color,
                      colorBlendMode: blendMode,
                    ),
        );
      },
    );
  }
}
