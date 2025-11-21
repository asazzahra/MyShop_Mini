import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  // Menerima data produk dari halaman list
  final String name;
  final String price;
  final String imagePath;
  final String weight;
  final String categoryName;
  final Color themeColor;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.weight,
    required this.categoryName,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // --- BAGIAN ATAS: GAMBAR & GRADIENT ---
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                // 1. Background Gradient
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.1, 1.0],
                      colors: [Colors.white, themeColor.withOpacity(0.4)],
                    ),
                  ),
                ),

                // 2. Header Icons (Tombol Back & Cart)
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          // Navigasi Kembali (Pop)
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios, size: 20),
                        ),
                        const Icon(Icons.shopping_bag_outlined, size: 24),
                      ],
                    ),
                  ),
                ),

                // 3. Gambar Produk
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      errorBuilder: (c, o, s) =>
                          Icon(Icons.image, size: 100, color: themeColor),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- BAGIAN BAWAH: INFORMASI PRODUK ---
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Baris 1: Kategori & Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categoryName,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(color: Colors.black),
                              children: [
                                const TextSpan(
                                  text: "4.8 ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: "(1.000 reviews)",
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Baris 2: Nama Produk & Harga
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        price,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Baris 3: Berat & Stok
                  Row(
                    children: [
                      Text(
                        weight,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Stok Wonten",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Deskripsi Produk (Dinamis sesuai kategori)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        _getDescription(categoryName, name),
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black54,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),

                  // --- TOMBOL BOTTOM (Add to Cart) ---
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      // Tombol Add to Cart
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add, color: Colors.black),
                            label: Text(
                              "Add to cart",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      // Tombol Favorite
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi Helper untuk Deskripsi Dinamis
  String _getDescription(String category, String productName) {
    if (category == "Snack") {
      return "$productName menika dipun olah saking bahan-bahan pilihan kanthi kualitas ingkang sae. Nggadhahi cita rasa ingkang istimewa, teksturipun pas, lan cocok sanget kagem kanca santai utawi suguhan tamu.";
    } else if (category == "Drink") {
      return "$productName menika unjukan seger ingkang dipun damel saking bahan alami pilihan. Raosipun manis pas, mboten damel serak. Cocok sanget dipun unjuk nalika hawa panas utawi kagem kanca dhahar.";
    } else if (category == "Electronic") {
      return "$productName menika piranti elektronik kanthi teknologi paling enggal. Desainipun modern, awet, lan gampil dipun ginakaken. Garansi resmi, cocok kagem panjenengan ingkang remen teknologi canggih.";
    }
    return "$productName menika produk pilihan kanthi kualitas ingkang sae. Cocok sanget kagem kabetahan panjenengan sadinten-dinten.";
  }
}
