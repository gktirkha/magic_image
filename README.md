# MagicImage Widget

The `MagicImage` widget is a versatile Flutter widget that displays an image from a given path, supporting both network and asset images, including SVG format. It provides various customization options such as fit, color, dimensions, and placeholder/error widgets.

## Features

- Load images from a URL or local assets.
- Support for both raster and SVG images.
- Customizable dimensions, fit, and color.
- Placeholder and error widgets for better user experience.

## Installation

Add the following dependencies to your `pubspec.yaml` file:

```yaml
magic_image:
    git: https://github.com/gktirkha/magic_image
```

## Usage
### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:your_package/magic_image.dart';

class MyWidget extends StatelessWidget {
@override
Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: Text('MagicImage Example'),
    ),
    body: Center(
        child: MagicImage('assets/images/sample.png'),
    ),
    );
}
}
```

## Network Image with Placeholder and Error Widget

```dart
import 'package:flutter/material.dart';
import 'package:your_package/magic_image.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MagicImage Example'),
      ),
      body: Center(
        child: MagicImage(
          'https://example.com/sample.png',
          placeholderWidget: CircularProgressIndicator(),
          errorWidget: Icon(Icons.error),
        ),
      ),
    );
  }
}

```

## SVG Image with Custom Color and Fit

```dart
import 'package:flutter/material.dart';
import 'package:your_package/magic_image.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MagicImage Example'),
      ),
      body: Center(
        child: MagicImage(
          'assets/images/sample.svg',
          srcColor: Colors.red,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
```

## Parameters

- **path**: The path of the image to display. It can be a URL for network images or a local asset path.
- **fit**: How to inscribe the image into the space allocated during layout. Default is `BoxFit.contain`.
- **srcColor**: The color to use when drawing the SVG. It is applied as a color filter.
- **height**: The height of the image.
- **width**: The width of the image.
- **squareDimension**: If specified, the image will be rendered with this square dimension.
- **placeholderWidget**: A widget to display while the image is loading.
- **errorWidget**: A widget to display if an error occurs while loading the image.
- **svgPlaceHolder**: A widget to display as a placeholder while loading an SVG image.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
