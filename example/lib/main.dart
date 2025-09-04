import 'package:flutter/material.dart';
import 'package:magic_image/magic_image.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(), debugShowCheckedModeBanner: false);
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final TextEditingController textEditingController = TextEditingController(
    text: "https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Any File / Url / asset path",
                ),
                controller: textEditingController,
                onSubmitted: (value) {
                  showImage(context);
                },
              ),
            ),
            SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                showImage(context);
              },
              child: Text("Show Image"),
            ),
          ],
        ),
      ),
    );
  }

  showImage(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Image Dialog",
      barrierDismissible: true,
      context: context,
      pageBuilder:
          (context, animation, secondaryAnimation) => Center(
            child: Material(
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: MagicImage(
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
                      ),
                    ),

                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
