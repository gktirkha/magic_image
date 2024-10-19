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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              "https://photographylife.com/wp-content/uploads/2023/05/Nikon-Z8-Official-Samples-00001.jpg"
                  .toMagicImage(
                squareDimension: 200,
                fit: BoxFit.fill,
              ),
              const MagicImage(
                "https://photographylife.com/wp-content/uploads/2023/05/Nikon-Z8-Official-Samples-00001.jpg",
                squareDimension: 200,
                fit: BoxFit.fill,
              )
            ],
          ),
        ),
      ),
    );
  }
}
