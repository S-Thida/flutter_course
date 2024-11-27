import 'package:flutter/material.dart';
enum Product {
  dart(
    title: 'Dart',
    description: 'The best object language',
    image: 'lib/assets/Stateless Practice/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    image: 'lib/assets/Stateless Practice/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    image: 'lib/assets/Stateless Practice/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}
class ProductCard extends StatelessWidget {
  Product product;
   ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16), // Adds padding inside the Card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.image,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(height: 8), // Space between image and text
                   Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                   Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.blue,
    appBar: AppBar(
      title: const Text(" Product "),
    ),
    body: Padding(
      padding:  const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductCard(product: Product.dart), 
          const SizedBox(height: 15),
          ProductCard(product: Product.flutter),
          const SizedBox(height: 15),
          ProductCard(product: Product.firebase),
        ],
      ),
    ),
  )));
}

