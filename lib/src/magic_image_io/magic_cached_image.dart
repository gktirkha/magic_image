import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MagicCachedImage extends StatelessWidget {
  const MagicCachedImage({
    super.key,
    required this.alignment,
    required this.headers,
    required this.repeat,
    required this.squareDimension,
    required this.width,
    required this.height,
    required this.path,
    required this.fit,
    required this.color,
    required this.blendMode,
    required this.placeHolderBuilder,
    required this.errorWidgetBuilder,
  });

  final Alignment? alignment;
  final Map<String, String>? headers;
  final ImageRepeat repeat;
  final double? squareDimension;
  final double? width;
  final double? height;
  final String path;

  final BoxFit? fit;
  final Color? color;
  final BlendMode? blendMode;
  final Widget Function(BuildContext context)? placeHolderBuilder;
  final ImageErrorWidgetBuilder? errorWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: alignment ?? Alignment.center,
      httpHeaders: headers,
      repeat: repeat,
      width: squareDimension ?? width,
      height: squareDimension ?? height,
      imageUrl: Uri.parse(path).toString(),
      placeholder: placeHolderBuilder == null
          ? null
          : (context, url) {
              return placeHolderBuilder!.call(context);
            },
      errorWidget: errorWidgetBuilder == null
          ? null
          : (context, url, error) {
              return errorWidgetBuilder!.call(context, error, null);
            },
      fit: fit,
      color: color,
      colorBlendMode: blendMode,
    );
  }
}
