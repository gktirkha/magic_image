import 'package:flutter/material.dart';
import 'package:magic_image/magic_image.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
            Center(child: ("https://placehold.jp/150x150.png".toMagicImage())),
      ),
    );
  }
}
