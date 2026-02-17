import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: const [
            ProductItem(
             imagePath: 'images/iphone.png',
              title: 'iPhone',
              description: 'iPhone is the stylish phone ever',
              price: '1000',
            ),
            ProductItem(
              imagePath: 'images/pixel.png',
              title: 'Pixel',
              description: 'Pixel is the most featureful phone ever',
              price: '800',
            ),
            ProductItem(
              imagePath: 'images/laptop.png',
              title: 'Laptop',
              description: 'Laptop is most productive development tool',
              price: '2000',
            ),
            ProductItem(
              imagePath: 'images/tablet.png',
              title: 'Tablet',
              description: 'Tablet is the most useful device ever for meeting',
              price: '1500',
            ),
            ProductItem(
              imagePath: 'images/pendrive.png',
              title: 'Pendrive',
              description: 'Pendrive is useful storage device',
              price: '100',
            ),
          ],
        ),
      ),
    );
  }
}
class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String price;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(description),
                  const SizedBox(height: 6),
                  Text(
                    'Price: $price',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
