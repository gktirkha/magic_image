import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MagicCachedImage extends StatelessWidget {
  const MagicCachedImage({
    super.key,
    required this.semanticsLabel,
    required this.alignment,
    required this.headers,
    required this.repeat,
    required this.squareDimension,
    required this.width,
    required this.height,
    required this.path,
    required this.placeholderWidget,
    required this.loaderSize,
    required this.errorWidget,
    required this.fit,
    required this.color,
    required this.blendMode,
    required this.placeHolderBuilder,
    required this.errorWidgetBuilder,
  });

  final String? semanticsLabel;
  final Alignment? alignment;
  final Map<String, String>? headers;
  final ImageRepeat repeat;
  final double? squareDimension;
  final double? width;
  final double? height;
  final String path;
  final Widget? placeholderWidget;
  final double loaderSize;
  final Widget? errorWidget;
  final BoxFit? fit;
  final Color? color;
  final BlendMode? blendMode;
  final Widget Function(BuildContext context)? placeHolderBuilder;
  final ImageErrorWidgetBuilder? errorWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel,
      child: CachedNetworkImage(
        alignment: alignment ?? Alignment.center,
        httpHeaders: headers,
        repeat: repeat,
        width: squareDimension ?? width,
        height: squareDimension ?? height,
        imageUrl: Uri.parse(path).toString(),
        placeholder: (BuildContext context, String url) {
          if (placeHolderBuilder != null) {
            return placeHolderBuilder!.call(context);
          }
          return placeholderWidget ??
              Center(
                child: SizedBox.square(
                  dimension: loaderSize,
                  child: const CircularProgressIndicator(),
                ),
              );
        },
        errorWidget: (BuildContext context, String url, Object error) {
          if (errorWidgetBuilder != null) {
            return errorWidgetBuilder!.call(context, error, null);
          } else {
            return errorWidget ?? const SizedBox.shrink();
          }
        },
        fit: fit,
        color: color,
        colorBlendMode: blendMode,
      ),
    );
  }
}
