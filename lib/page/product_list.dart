import 'package:flutter/material.dart';
import 'product_detail.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  const ProductListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName), // Judul sesuai kategori yang diklik
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Tampilan Grid 2 Kolom
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75, // Mengatur rasio tinggi/lebar kartu
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: 6, // Contoh jumlah produk dummy
          itemBuilder: (context, index) {
            return _buildGridItem(context);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetailScreen(
              name: "Contoh Produk",
              price: "Rp 10.000",
              imagePath: "assets/chitato.png",
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.image,
              size: 60,
              color: Colors.orange,
            ), // Placeholder gambar
            SizedBox(height: 10),
            Text("Nama Produk", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Rp 15.000", style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
