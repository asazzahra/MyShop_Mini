import 'package:flutter/material.dart';
import 'product_list.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

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
              // 1. HEADER (Logo + Teks MyShop Mini)
              _buildHeader(),

              const SizedBox(height: 20),
              _buildSearchBar(),

              const SizedBox(height: 20),

              // 2. BANNER POSTER (Desain Ulang: Gradient + Image Widget + Text)
              _buildBannerModern(),

              const SizedBox(height: 25),

              // 3. KATEGORI
              const Text(
                "Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem(
                    context,
                    "Snack",
                    "assets/images/snack.png",
                    Colors.orange.shade100,
                    Colors.orange.shade50,
                  ),
                  _buildCategoryItem(
                    context,
                    "Drink",
                    "assets/images/drink.png",
                    Colors.blue.shade100,
                    Colors.blue.shade50,
                  ),
                  _buildCategoryItem(
                    context,
                    "Electronic",
                    "assets/images/electronic.png",
                    Colors.grey.shade300,
                    Colors.grey.shade100,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // 4. EXPLORE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Explore",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
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
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // 6. LIST PRODUK
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductCard(
                    context,
                    "Chitato Lite",
                    "68gr",
                    "Rp 10.500",
                    "assets/images/chitato.png",
                    Colors.orange,
                  ),
                  _buildProductCard(
                    context,
                    "Teh Kotak",
                    "300ml",
                    "Rp 5.000",
                    "assets/images/tehkotak.png",
                    Colors.blue,
                  ),
                  _buildProductCard(
                    context,
                    "Earphone TWS",
                    "Samsung",
                    "Rp 80.000",
                    "assets/images/tws.png",
                    Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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

  // --- REVISI 1: HEADER DENGAN TEKS DI BAWAH LOGO ---
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment:
          CrossAxisAlignment.center, // Pastikan sejajar tengah vertikal
      children: [
        const Icon(Icons.menu, size: 28),

        // Kolom Tengah: Logo + Teks
        Column(
          children: [
            // Gambar Logo Keranjang
            SizedBox(
              height: 40,
              child: Image.asset(
                'assets/images/logo_myshop.png', // Gambar keranjang saja
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 4), // Jarak kecil
            // Teks di bawah logo
            const Text(
              "MyShop Mini",
              style: TextStyle(
                fontWeight: FontWeight.w800, // Extra Bold agar mirip gambar
                fontSize: 22, // Ukuran font besar
                height: 1.0, // Merapatkan jarak baris
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
        border: Border.all(
          color: Colors.black87,
        ), // Border agak gelap sesuai gambar
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "search",
          hintStyle: TextStyle(color: Colors.grey), // Warna hint abu-abu
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: Colors.black, size: 28),
        ),
      ),
    );
  }

  // --- REVISI 3: BANNER DIBUAT MANUAL (GRADIENT + IMAGE + TEXT) ---
  Widget _buildBannerModern() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black12,
        ), // Border tipis di sekeliling banner
        // Gradasi warna: Biru muda ke Kuning muda/Putih
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.0, 0.6, 1.0],
          colors: [
            Colors.blue.shade100.withOpacity(0.8), // Biru pudar di kiri
            Colors.white,
            Colors.yellow.shade100.withOpacity(0.5), // Kuning pudar di kanan
          ],
        ),
      ),
      child: Row(
        children: [
          // BAGIAN KIRI: GAMBAR ILUSTRASI (Bukan Logo)
          SizedBox(
            width: 90,
            height: 90,
            // Pastikan ini gambar PNG keranjang belanja transparan (bukan logo header)
            child: Image.asset(
              'assets/images/cart_illustration.png',
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(width: 15), // Jarak gambar ke teks
          // BAGIAN KANAN: TEKS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Monggo sanak-sanak!",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.brown,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Ampun Namung Nyawang,\nMonggo Enggal Dipun Pinang.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold, // Bold font Poppins
                    color: Colors.black87,
                    height: 1.3, // Spasi antar baris
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    String label,
    String imagePath,
    Color colorTop,
    Color colorBottom,
  ) {
    return GestureDetector(
      onTap: () {
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
            height: 80,
            width: 90, // Sedikit lebih lebar agar proporsional
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8,
              ), // Radius agak kotak sesuai gambar
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [colorTop, Colors.white],
              ),
            ),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String title,
    String subTitle,
    String price,
    String imagePath,
    Color borderColor,
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
            ),
          ),
        );
      },
      child: Container(
        width: 105,
        padding: const EdgeInsets.all(10), // Padding dalam card
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8), // Radius agak tajam
          border: Border.all(color: borderColor, width: 1), // Border berwarna
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 80,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ), // Teks kecil
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Ikon hati merah kecil
                const Icon(Icons.favorite, color: Colors.red, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
