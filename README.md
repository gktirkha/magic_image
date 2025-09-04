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

MagicImage(
  clipBehavior: Clip.antiAlias,
  boxDecoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
  ),
  fit: BoxFit.fill,
  textEditingController.text,
  squareDimension: 300,
  errorWidgetBuilder:
      (context, error, stackTrace) => Text("Error"),
  placeHolderBuilder: (context) => Text("Placeholder"),
)

```

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
