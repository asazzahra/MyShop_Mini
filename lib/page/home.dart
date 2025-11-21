import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_list.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Variabel untuk mengatur tab aktif di bottom bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HEADER: Menampilkan Logo dan Nama Aplikasi [cite: 16]
              _buildHeader(),

              const SizedBox(height: 20),

              // SEARCH BAR: Fitur tambahan untuk estetika UI
              _buildSearchBar(),

              const SizedBox(height: 20),

              // 2. BANNER POSTER: Area promosi visual (Banner Javanese Copywriting)
              _buildBannerModern(),

              const SizedBox(height: 25),

              // 3. KATEGORI [cite: 9]
              // Bagian ini memenuhi syarat menampilkan daftar kategori
              Text(
                "Category",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              // Layout Kategori menggunakan Row agar sejajar horizontal [cite: 20]
              Row(
                children: [
                  Expanded(
                    child: _buildCategoryItem(
                      context,
                      "Snack",
                      "assets/images/snack.png",
                      Colors.orange.shade100,
                      Colors.orange.shade50,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildCategoryItem(
                      context,
                      "Drink",
                      "assets/images/drink.png",
                      Colors.blue.shade100,
                      Colors.blue.shade50,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildCategoryItem(
                      context,
                      "Electronic",
                      "assets/images/electronic.png",
                      Colors.grey.shade300,
                      Colors.grey.shade100,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // 4. EXPLORE SECTION: Menampilkan beberapa produk unggulan di Home
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke list produk dengan kategori 'All Products'
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => const ProductListScreen(
                            categoryName: "All Products",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "See More",
                      style: GoogleFonts.poppins(color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // List Produk Horizontal (Explore)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildProductCard(
                      context,
                      "Chitato Lite",
                      "68gr",
                      "Rp 10.500",
                      "assets/images/chitato.png",
                      Colors.orange,
                      "Snack",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildProductCard(
                      context,
                      "Teh Kotak",
                      "300ml",
                      "Rp 5.000",
                      "assets/images/tehkotak.png",
                      Colors.blue,
                      "Drink",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildProductCard(
                      context,
                      "Earphone TWS",
                      "Samsung",
                      "Rp 80.000",
                      "assets/images/tws.png",
                      Colors.grey,
                      "Electronic",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar untuk navigasi menu bawah
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Like",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // WIDGET BUILDER METHODS

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.menu, size: 28),
        Column(
          children: [
            SizedBox(
              height: 40,
              child: Image.asset(
                'assets/images/logo_myshop.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "MyShop Mini",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                height: 1.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Icon(Icons.notifications_none, size: 28),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black87),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "search",
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.search, color: Colors.black, size: 28),
        ),
      ),
    );
  }

  Widget _buildBannerModern() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.0, 0.6, 1.0],
          colors: [
            Colors.blue.shade100.withOpacity(0.8),
            Colors.white,
            Colors.yellow.shade100.withOpacity(0.5),
          ],
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            height: 90,
            child: Image.asset('assets/images/cart.png', fit: BoxFit.contain),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Monggo sanak-sanak!",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 114, 114, 114),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Ampun Namung Nyawang,\nMonggo Enggal Dipun Pinang.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Item Kategori [cite: 21]
  Widget _buildCategoryItem(
    BuildContext context,
    String label,
    String imagePath,
    Color colorTop,
    Color colorBottom,
  ) {
    // Menggunakan GestureDetector untuk menangani klik [cite: 22]
    return GestureDetector(
      onTap: () {
        // NAVIGASI: Berpindah ke ProductListScreen dengan membawa nama kategori [cite: 23]
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ProductListScreen(categoryName: label),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colorTop, Colors.white],
              ),
            ),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  // Widget Kartu Produk (untuk bagian Explore)
  Widget _buildProductCard(
    BuildContext context,
    String title,
    String subTitle,
    String price,
    String imagePath,
    Color borderColor,
    String category,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ProductDetailScreen(
              name: title,
              price: price,
              imagePath: imagePath,
              weight: subTitle,
              categoryName: category,
              themeColor: borderColor,
            ),
          ),
        );
      },
      child: Container(
        height: 240,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(child: Image.asset(imagePath, fit: BoxFit.contain)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const Icon(Icons.favorite, color: Colors.red, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
