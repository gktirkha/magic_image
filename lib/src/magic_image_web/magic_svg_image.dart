import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MagicSvgImage extends StatelessWidget {
  const MagicSvgImage({
    super.key,
    required this.alignment,
    required this.squareDimension,
    required this.width,
    required this.height,
    required this.fit,
    required this.colorFilter,
    required this.color,
    required this.blendMode,
    required this.bytesLoader,
    required this.placeHolderBuilder,
    required this.errorWidgetBuilder,
  });

  final Alignment? alignment;

  final double? squareDimension;
  final double? width;
  final double? height;

  final BoxFit? fit;
  final ColorFilter? colorFilter;
  final Color? color;
  final BlendMode? blendMode;
  final BytesLoader bytesLoader;
  final Widget Function(BuildContext context)? placeHolderBuilder;
  final ImageErrorWidgetBuilder? errorWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      bytesLoader,
      alignment: alignment ?? Alignment.center,
      width: squareDimension ?? width,
      height: squareDimension ?? height,
      placeholderBuilder: placeHolderBuilder,
      fit: fit ?? BoxFit.contain,
      colorFilter: colorFilter ??
          ((color == null || blendMode == null)
              ? null
              : ColorFilter.mode(color!, blendMode!)),
      errorBuilder: errorWidgetBuilder,
    );
  }
}
