/// [magic_image] is a Flutter Package that displays an image from a given path, with support for both network and asset images, including SVG format.
/// It provides various customization options such as fit, color, dimensions, and placeholder/error widgets.

library magic_image;

export './src/magic_image_io/magic_image_extension.dart'
    if (dart.library.js_interop) './src/magic_image_web/magic_image_web.dart';
export './src/magic_image_io/magic_image_io.dart'
    if (dart.library.js_interop) './src/magic_image_web/magic_image_extension.dart';
