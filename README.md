# MagicImage

`MagicImage` is a Flutter Package that displays an image from a given path, with support for both network and asset images, including SVG format. It provides various customization options such as fit, color, dimensions, and placeholder/error widgets.

## Features

- Display images from both network URLs and local asset paths.
- Support for SVG images.
- Customizable fit, color, dimensions, and more.
- Placeholder and error widgets for loading and error states.
- Optional box decoration for the container holding the image.
- Customizable loading indicator size.

> If you prefer, You may find the dart-doc version of the documentation [here](https://gktirkha.github.io/flutter_packages_doc/magic_image/)

## Installation

To use `MagicImage` in your Flutter project, add the necessary dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  magic_image:
    git: https://github.com/gktirkha/magic_image
```

## Usage
### Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:magic_image/magic_image.dart'; 

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
import 'package:magic_image/magic_image.dart';

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

## SVG Image with Custom Color and Fit

```dart
import 'package:flutter/material.dart';
import 'package:magic_image/magic_image.dart';

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
          color: Colors.red,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

```

## Parameters

| Parameter               | Type            | Description                                                                      |
|-------------------------|-----------------|----------------------------------------------------------------------------------|
| `path`                  | `String`        | The path of the image to display (URL or local asset path).                      |
| `fit`                   | `BoxFit?`       | How to inscribe the image into the space allocated during layout.                |
| `height`                | `double?`       | The height of the image.                                                         |
| `width`                 | `double?`       | The width of the image.                                                          |
| `squareDimension`       | `double?`       | If specified, the image will be rendered with this square dimension.             |
| `placeholderWidget`     | `Widget?`       | A widget to display while the image is loading.                                  |
| `errorWidget`           | `Widget?`       | A widget to display if an error occurs while loading the image.                  |
| `svgPlaceHolder`        | `Widget?`       | A widget to display as a placeholder while loading an SVG image.                 |
| `repeat`                | `ImageRepeat`   | How to paint any portions of the image that are not covered by the source image. |
| `color`                 | `Color?`        | The color to blend with the image.                                               |
| `blendMode`             | `BlendMode?`    | The blend mode to apply when blending the image with the color.                  |
| `colorFilter`           | `ColorFilter?`  | A color filter to apply to the image.                                            |
| `boxDecoration`         | `BoxDecoration?`| A decoration to apply to the container holding the image.                        |
| `defaultPlaceHolderSize`| `double?`       | The size of the default loading indicator.                                       |
| `clipBehavior`          | `Clip?`         | Clip Behavior For image                                                          |


## Contributing

Contributions are welcome! Please open an issue or submit a pull request on [GitHub.](https://github.com/gktirkha/magic_image)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
