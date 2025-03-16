import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MagicSvgImage extends StatelessWidget {
  const MagicSvgImage({
    super.key,
    required this.alignment,
    required this.semanticsLabel,
    required this.squareDimension,
    required this.width,
    required this.height,
    required this.placeholderWidget,
    required this.loaderSize,
    required this.fit,
    required this.colorFilter,
    required this.color,
    required this.blendMode,
    required this.errorWidget,
    required this.bytesLoader,
    required this.placeHolderBuilder,
    required this.errorWidgetBuilder,
  });

  final Alignment? alignment;
  final String? semanticsLabel;
  final double? squareDimension;
  final double? width;
  final double? height;
  final Widget? placeholderWidget;
  final double loaderSize;
  final BoxFit? fit;
  final ColorFilter? colorFilter;
  final Color? color;
  final BlendMode? blendMode;
  final Widget? errorWidget;
  final BytesLoader bytesLoader;
  final Widget Function(BuildContext context)? placeHolderBuilder;
  final ImageErrorWidgetBuilder? errorWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      bytesLoader,
      alignment: alignment ?? Alignment.center,
      semanticsLabel: semanticsLabel,
      width: squareDimension ?? width,
      height: squareDimension ?? height,
      placeholderBuilder: (context) =>
          placeholderWidget ??
          Center(
            child: SizedBox.square(
              dimension: loaderSize,
              child: const CircularProgressIndicator(),
            ),
          ),
      fit: fit ?? BoxFit.contain,
      colorFilter: colorFilter ??
          ((color == null || blendMode == null)
              ? null
              : ColorFilter.mode(color!, blendMode!)),
      errorBuilder: (context, error, stackTrace) {
        if (errorWidgetBuilder != null) {
          return errorWidgetBuilder!.call(context, error, stackTrace);
        } else {
          return errorWidget ?? const SizedBox.shrink();
        }
      },
    );
  }
}
