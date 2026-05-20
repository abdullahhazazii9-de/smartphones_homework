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
      title: 'Products',
      locale: const Locale('ar', 'SA'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: ProductsPage(),
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("قائمة المنتجات"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          ProductItem(
            imagePath: 'images/iphone.png',
            title: 'iPhone',
            brand: 'Apple',
            description: 'A stylish and powerful smartphone',
            price: '1000',
          ),
          ProductItem(
            imagePath: 'images/pixel.png',
            title: 'Pixel',
            brand: 'Google',
            description: 'A feature-rich Android phone',
            price: '800',
          ),
          ProductItem(
            imagePath: 'images/laptop.png',
            title: 'Laptop',
            brand: 'HP',
            description: 'A productive development machine',
            price: '2000',
          ),
          ProductItem(
            imagePath: 'images/tablet.png',
            title: 'iPad',
            brand: 'Apple',
            description: 'A useful device for meetings and study',
            price: '1500',
          ),
          ProductItem(
            imagePath: 'images/pendrive.png',
            title: 'Pendrive',
            brand: 'SanDisk',
            description: 'A portable storage device',
            price: '50',
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
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
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isExpanded = !isExpanded),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "اضغط هنا للحصول على التفاصيل...",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isExpanded ? null : 0,
              child: isExpanded
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(),
                          const SizedBox(height: 10),

                          _detailRow("اسم المنتج:", widget.title),
                          _detailRow("الماركة:", widget.brand),
                          _detailRow("السعر:", "${widget.price} ريال"),

                          const SizedBox(height: 15),
                          const Text(
                            "الوصف الكامل:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          const SizedBox(height: 5),

                          Text(
                            widget.description,
                            style: const TextStyle(fontSize: 14, height: 1.5),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Text(value, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
