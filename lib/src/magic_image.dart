import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
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
  /// [colorFilter], [boxDecoration], [clipBehavior], and [defaultPlaceHolderSize] parameters are optional.
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
    this.headers,
    this.onError,
    this.onTap,
    this.onDoubleTap,
    this.onDoubleTapCancel,
    this.onDoubleTapDown,
    this.onForcePressEnd,
    this.onForcePressPeak,
    this.onForcePressStart,
    this.onForcePressUpdate,
    this.onHorizontalDragCancel,
    this.onHorizontalDragDown,
    this.onHorizontalDragEnd,
    this.onHorizontalDragStart,
    this.onHorizontalDragUpdate,
    this.onLongPress,
    this.onLongPressCancel,
    this.onLongPressDown,
    this.onLongPressEnd,
    this.onLongPressMoveUpdate,
    this.onLongPressStart,
    this.onLongPressUp,
    this.onPanCancel,
    this.onPanDown,
    this.onPanEnd,
    this.onPanStart,
    this.onPanUpdate,
    this.onScaleEnd,
    this.onScaleStart,
    this.onScaleUpdate,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressCancel,
    this.onSecondaryLongPressDown,
    this.onSecondaryLongPressEnd,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressUp,
    this.onSecondaryTap,
    this.onSecondaryTapCancel,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onTapCancel,
    this.onTapDown,
    this.onTapUp,
    this.onTertiaryLongPress,
    this.onTertiaryLongPressCancel,
    this.onTertiaryLongPressDown,
    this.onTertiaryLongPressEnd,
    this.onTertiaryLongPressMoveUpdate,
    this.onTertiaryLongPressStart,
    this.onTertiaryLongPressUp,
    this.onTertiaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onVerticalDragCancel,
    this.onVerticalDragDown,
    this.onVerticalDragEnd,
    this.onVerticalDragStart,
    this.onVerticalDragUpdate,
    this.behavior,
    this.dragStartBehavior = DragStartBehavior.start,
    this.excludeFromSemantics = false,
    this.supportedDevices,
    this.trackpadScrollCausesScale = false,
    this.trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
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
  /// This size is used for the loading indicator when no custom placeholder is provided.
  final double? defaultPlaceHolderSize;

  /// Defines how the image should be clipped, defaults to [Clip.none].
  final Clip clipBehavior;

  /// The HTTP headers to include in network requests for images or SVGs.
  final Map<String, String>? headers;

  /// Callback for when an error occurs while loading the image.
  ///
  /// It takes two parameters: the error object and the stack trace.
  final Function(Object? error, StackTrace? stacktrace)? onError;

  /// A callback that is triggered when the image is tapped.
  final VoidCallback? onTap;

  /// Gesture callback for when the image is double-tapped.
  final GestureTapCallback? onDoubleTap;

  /// Gesture callback for when a double-tap is canceled.
  final GestureTapCancelCallback? onDoubleTapCancel;

  /// Gesture callback for when a double-tap is recognized.
  final GestureTapDownCallback? onDoubleTapDown;

  /// Gesture callback for when a force press ends.
  final GestureForcePressEndCallback? onForcePressEnd;

  /// Gesture callback for when a force press peaks.
  final GestureForcePressPeakCallback? onForcePressPeak;

  /// Gesture callback for when a force press starts.
  final GestureForcePressStartCallback? onForcePressStart;

  /// Gesture callback for when the force of a press is updated.
  final GestureForcePressUpdateCallback? onForcePressUpdate;

  /// Gesture callback for when a horizontal drag is canceled.
  final GestureDragCancelCallback? onHorizontalDragCancel;

  /// Gesture callback for when a horizontal drag is recognized.
  final GestureDragDownCallback? onHorizontalDragDown;

  /// Gesture callback for when a horizontal drag ends.
  final GestureDragEndCallback? onHorizontalDragEnd;

  /// Gesture callback for when a horizontal drag starts.
  final GestureDragStartCallback? onHorizontalDragStart;

  /// Gesture callback for when a horizontal drag is updated.
  final GestureDragUpdateCallback? onHorizontalDragUpdate;

  /// Gesture callback for when a long press is recognized.
  final GestureLongPressCallback? onLongPress;

  /// Gesture callback for when a long press is canceled.
  final GestureLongPressCancelCallback? onLongPressCancel;

  /// Gesture callback for when a long press is recognized.
  final GestureLongPressDownCallback? onLongPressDown;

  /// Gesture callback for when a long press ends.
  final GestureLongPressEndCallback? onLongPressEnd;

  /// Gesture callback for updates during a long press movement.
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  /// Gesture callback for when a long press starts.
  final GestureLongPressStartCallback? onLongPressStart;

  /// Gesture callback for when a long press is released.
  final GestureLongPressUpCallback? onLongPressUp;

  /// Gesture callback for when a pan gesture is canceled.
  final GestureDragCancelCallback? onPanCancel;

  /// Gesture callback for when a pan gesture is recognized.
  final GestureDragDownCallback? onPanDown;

  /// Gesture callback for when a pan gesture ends.
  final GestureDragEndCallback? onPanEnd;

  /// Gesture callback for when a pan gesture starts.
  final GestureDragStartCallback? onPanStart;

  /// Gesture callback for when a pan gesture is updated.
  final GestureDragUpdateCallback? onPanUpdate;

  /// Gesture callback for when a scale gesture ends.
  final GestureScaleEndCallback? onScaleEnd;

  /// Gesture callback for when a scale gesture starts.
  final GestureScaleStartCallback? onScaleStart;

  /// Gesture callback for when a scale gesture is updated.
  final GestureScaleUpdateCallback? onScaleUpdate;

  /// Gesture callback for when a secondary long press is recognized.
  final GestureLongPressCallback? onSecondaryLongPress;

  /// Gesture callback for when a secondary long press is canceled.
  final GestureLongPressCancelCallback? onSecondaryLongPressCancel;

  /// Gesture callback for when a secondary long press is recognized.
  final GestureLongPressDownCallback? onSecondaryLongPressDown;

  /// Gesture callback for when a secondary long press ends.
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;

  /// Gesture callback for updates during a secondary long press movement.
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;

  /// Gesture callback for when a secondary long press starts.
  final GestureLongPressStartCallback? onSecondaryLongPressStart;

  /// Gesture callback for when a secondary long press is released.
  final GestureLongPressUpCallback? onSecondaryLongPressUp;

  /// Gesture callback for when a secondary tap is recognized.
  final GestureTapCallback? onSecondaryTap;

  /// Gesture callback for when a secondary tap is canceled.
  final GestureTapCancelCallback? onSecondaryTapCancel;

  /// Gesture callback for when a secondary tap is recognized.
  final GestureTapDownCallback? onSecondaryTapDown;

  /// Gesture callback for when a secondary tap is completed.
  final GestureTapUpCallback? onSecondaryTapUp;

  /// Gesture callback for when a tertiary long press is recognized.
  final GestureLongPressCallback? onTertiaryLongPress;

  /// Gesture callback for when a tertiary long press is canceled.
  final GestureLongPressCancelCallback? onTertiaryLongPressCancel;

  /// Gesture callback for when a tertiary long press is recognized.
  final GestureLongPressDownCallback? onTertiaryLongPressDown;

  /// Gesture callback for when a tertiary long press ends.
  final GestureLongPressEndCallback? onTertiaryLongPressEnd;

  /// Gesture callback for updates during a tertiary long press movement.
  final GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate;

  /// Gesture callback for when a tertiary long press starts.
  final GestureLongPressStartCallback? onTertiaryLongPressStart;

  /// Gesture callback for when a tertiary long press is released.
  final GestureLongPressUpCallback? onTertiaryLongPressUp;

  /// Gesture callback for when a tertiary tap is canceled.
  final GestureTapCancelCallback? onTertiaryTapCancel;

  /// Gesture callback for when a tertiary tap is recognized.
  final GestureTapDownCallback? onTertiaryTapDown;

  /// Gesture callback for when a tertiary tap is completed.
  final GestureTapUpCallback? onTertiaryTapUp;

  /// Gesture callback for when a vertical drag is canceled.
  final GestureDragCancelCallback? onVerticalDragCancel;

  /// Gesture callback for when a vertical drag is recognized.
  final GestureDragDownCallback? onVerticalDragDown;

  /// Gesture callback for when a vertical drag ends.
  final GestureDragEndCallback? onVerticalDragEnd;

  /// Gesture callback for when a vertical drag starts.
  final GestureDragStartCallback? onVerticalDragStart;

  /// Gesture callback for when a vertical drag is updated.
  final GestureDragUpdateCallback? onVerticalDragUpdate;

  /// The behavior to use during hit testing.
  final HitTestBehavior? behavior;

  /// Determines the way to start a drag gesture.
  final DragStartBehavior dragStartBehavior;

  /// Exclude semantics from this widget.
  final bool excludeFromSemantics;

  /// The devices supported for interaction.
  final Set<PointerDeviceKind>? supportedDevices;

  /// Whether the trackpad scroll causes scale effect.
  final bool trackpadScrollCausesScale;

  /// The factor by which trackpad scroll scales the image.
  final Offset trackpadScrollToScaleFactor;

  /// A callback that is triggered when a tap is canceled.
  final GestureTapCancelCallback? onTapCancel;

  /// A callback that is triggered when a tap down gesture is recognized.
  final GestureTapDownCallback? onTapDown;

  /// This is invoked when the pointer is lifted after a successful tap gesture.
  final GestureTapUpCallback? onTapUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,
      onDoubleTapDown: onDoubleTapDown,
      onForcePressEnd: onForcePressEnd,
      onForcePressPeak: onForcePressPeak,
      onForcePressStart: onForcePressStart,
      onForcePressUpdate: onForcePressUpdate,
      onHorizontalDragCancel: onHorizontalDragCancel,
      onHorizontalDragDown: onHorizontalDragDown,
      onHorizontalDragEnd: onHorizontalDragEnd,
      onHorizontalDragStart: onHorizontalDragStart,
      onHorizontalDragUpdate: onHorizontalDragUpdate,
      onLongPress: onLongPress,
      onLongPressCancel: onLongPressCancel,
      onLongPressDown: onLongPressDown,
      onLongPressEnd: onLongPressEnd,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressStart: onLongPressStart,
      onLongPressUp: onLongPressUp,
      onPanCancel: onPanCancel,
      onPanDown: onPanDown,
      onPanEnd: onPanEnd,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onScaleEnd: onScaleEnd,
      onScaleStart: onScaleStart,
      onScaleUpdate: onScaleUpdate,
      onSecondaryLongPress: onSecondaryLongPress,
      onSecondaryLongPressCancel: onSecondaryLongPressCancel,
      onSecondaryLongPressDown: onSecondaryLongPressDown,
      onSecondaryLongPressEnd: onSecondaryLongPressEnd,
      onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
      onSecondaryLongPressStart: onSecondaryLongPressStart,
      onSecondaryLongPressUp: onSecondaryLongPressUp,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTertiaryLongPress: onTertiaryLongPress,
      onTertiaryLongPressCancel: onTertiaryLongPressCancel,
      onTertiaryLongPressDown: onTertiaryLongPressDown,
      onTertiaryLongPressEnd: onTertiaryLongPressEnd,
      onTertiaryLongPressMoveUpdate: onTertiaryLongPressMoveUpdate,
      onTertiaryLongPressStart: onTertiaryLongPressStart,
      onTertiaryLongPressUp: onTertiaryLongPressUp,
      onTertiaryTapCancel: onTertiaryTapCancel,
      onTertiaryTapDown: onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp,
      onVerticalDragCancel: onVerticalDragCancel,
      onVerticalDragDown: onVerticalDragDown,
      onVerticalDragEnd: onVerticalDragEnd,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      behavior: behavior,
      dragStartBehavior: dragStartBehavior,
      excludeFromSemantics: excludeFromSemantics,
      supportedDevices: supportedDevices,
      trackpadScrollToScaleFactor: trackpadScrollToScaleFactor,
      trackpadScrollCausesScale: trackpadScrollCausesScale,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double minSize =
              min(constraints.maxHeight, constraints.maxWidth);
          final double loaderSize =
              defaultPlaceHolderSize ?? (minSize > 40 ? 40 : minSize / 2);
          return Container(
            clipBehavior: clipBehavior,
            decoration: boxDecoration,
            width: squareDimension ?? width,
            height: squareDimension ?? height,
            child: path.isURL
                ? path.isSVG
                    ? SvgPicture.network(
                        headers: headers,
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
                        httpHeaders: headers,
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
                            (BuildContext context, String url, Object error) {
                          onError?.call(error, null);
                          return errorWidget ?? const SizedBox.shrink();
                        },
                        fit: fit,
                        color: color,
                        colorBlendMode: blendMode,
                      )
                : path.isSVG
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
                        errorBuilder: (context, error, stackTrace) {
                          onError?.call(error, stackTrace);
                          return errorWidget ?? const SizedBox.shrink();
                        },
                      ),
          );
        },
      ),
    );
  }
}
