
import 'package:flutter/material.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final List<String> images = [
    "lib/assets/Stateful Practice/bird.jpg",
    "lib/assets/Stateful Practice/bird2.jpg",
    "lib/assets/Stateful Practice/insect.jpg",
    "lib/assets/Stateful Practice/girl.jpg",
    "lib/assets/Stateful Practice/man.jpg"
  ];
  
  int index = 0;

  void showNextImage() {
    setState(() {
      index = (index + 1) % images.length;
    });
  }

  void showPreviousImage() {
    setState(() {
      index = (index - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: showPreviousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: showNextImage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[index]),
      ),
    );
  }
}

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false, // Hides the debug banner in the top-right corner.
        home:  ImageGallery(
          
        ),
      ),
    );