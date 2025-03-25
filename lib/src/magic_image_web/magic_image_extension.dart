import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'magic_image_web.dart';

/// Extension on [ String ] to convert a string into a [ MagicImage ] widget.
///
/// A [ MagicImage ] widget configured with the provided parameters.
extension MagicImageExtension on String {
  Widget toMagicImage({
    BoxFit? fit,
    double? height,
    double? width,
    double? squareDimension,
    Widget? placeholderWidget,
    Widget? errorWidget,
    Widget? svgPlaceHolder,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Color? color,
    BlendMode? blendMode,
    ColorFilter? colorFilter,
    BoxDecoration? boxDecoration,
    double? defaultPlaceHolderSize,
    Clip clipBehavior = Clip.none,
    Map<String, String>? headers,
    Function(Object? error, StackTrace? stacktrace)? onError,
    VoidCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureTapCancelCallback? onDoubleTapCancel,
    GestureTapDownCallback? onDoubleTapDown,
    GestureForcePressEndCallback? onForcePressEnd,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureDragCancelCallback? onHorizontalDragCancel,
    GestureDragDownCallback? onHorizontalDragDown,
    GestureDragEndCallback? onHorizontalDragEnd,
    GestureDragStartCallback? onHorizontalDragStart,
    GestureDragUpdateCallback? onHorizontalDragUpdate,
    GestureLongPressCallback? onLongPress,
    GestureLongPressCancelCallback? onLongPressCancel,
    GestureLongPressDownCallback? onLongPressDown,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressUpCallback? onLongPressUp,
    GestureDragCancelCallback? onPanCancel,
    GestureDragDownCallback? onPanDown,
    GestureDragEndCallback? onPanEnd,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureScaleEndCallback? onScaleEnd,
    GestureScaleStartCallback? onScaleStart,
    GestureScaleUpdateCallback? onScaleUpdate,
    GestureLongPressCallback? onSecondaryLongPress,
    GestureLongPressCancelCallback? onSecondaryLongPressCancel,
    GestureLongPressDownCallback? onSecondaryLongPressDown,
    GestureLongPressEndCallback? onSecondaryLongPressEnd,
    GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate,
    GestureLongPressStartCallback? onSecondaryLongPressStart,
    GestureLongPressUpCallback? onSecondaryLongPressUp,
    GestureTapCallback? onSecondaryTap,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureLongPressCallback? onTertiaryLongPress,
    GestureLongPressCancelCallback? onTertiaryLongPressCancel,
    GestureLongPressDownCallback? onTertiaryLongPressDown,
    GestureLongPressEndCallback? onTertiaryLongPressEnd,
    GestureLongPressMoveUpdateCallback? onTertiaryLongPressMoveUpdate,
    GestureLongPressStartCallback? onTertiaryLongPressStart,
    GestureLongPressUpCallback? onTertiaryLongPressUp,
    GestureTapCancelCallback? onTertiaryTapCancel,
    GestureTapDownCallback? onTertiaryTapDown,
    GestureTapUpCallback? onTertiaryTapUp,
    GestureDragCancelCallback? onVerticalDragCancel,
    GestureDragDownCallback? onVerticalDragDown,
    GestureDragEndCallback? onVerticalDragEnd,
    GestureDragStartCallback? onVerticalDragStart,
    GestureDragUpdateCallback? onVerticalDragUpdate,
    HitTestBehavior? behavior,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    bool excludeFromSemantics = false,
    Set<PointerDeviceKind>? supportedDevices,
    bool trackpadScrollCausesScale = false,
    Offset trackpadScrollToScaleFactor = kDefaultTrackpadScrollToScaleFactor,
    GestureTapCancelCallback? onTapCancel,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    String? semanticsLabel,
    Alignment alignment = Alignment.center,
    bool forceSvg = false,
    ImageErrorWidgetBuilder? errorWidgetBuilder,
    Widget Function(BuildContext context)? placeHolderBuilder,
    Key? key,
  }) {
    return MagicImage(
      this,
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
      blendMode: blendMode,
      boxDecoration: boxDecoration,
      clipBehavior: clipBehavior,
      color: color,
      colorFilter: colorFilter,
      errorWidget: errorWidget,
      defaultPlaceHolderSize: defaultPlaceHolderSize,
      fit: fit,
      headers: headers,
      height: height,
      onError: onError,
      placeholderWidget: placeholderWidget,
      repeat: repeat,
      squareDimension: squareDimension,
      svgPlaceHolder: svgPlaceHolder,
      width: width,
      forceSvg: forceSvg,
      semanticsLabel: semanticsLabel,
      alignment: alignment,
      errorWidgetBuilder: errorWidgetBuilder,
      placeHolderBuilder: placeHolderBuilder,
      key: key,
    );
  }
}
