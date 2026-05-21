import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsPage(),
    );
  }
}

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List products = [];

  Future fetchProducts() async {
    final response = await http.get(
      Uri.parse("http://localhost/flutter_api/get_products.php"),
    );

    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      print("Error loading data");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.green,
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return ProductItem(
                  imagePath: "images/${item['image']}",
                  title: item['title'],
                  brand: item['brand'],
                  description: item['description'],
                  price: item['price'],
                );
              },
            ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String brand;
  final String description;
  final String price;

  const ProductItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.brand,
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

                  Text(
                    'Brand: $brand',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
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
