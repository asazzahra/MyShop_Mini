import 'package:flutter/material.dart';
import 'product_detail.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName; // Menerima data kategori yang dipilih

  const ProductListScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // --- 1. DEFINISI DATA MENTAH (DUMMY DATA) PER KATEGORI ---
    // Data statis digunakan karena tidak ada database/API

    final List<Map<String, dynamic>> snacks = [
      {
        "name": "Chitato Lite",
        "weight": "68gr",
        "price": "Rp 10.500",
        "image": "assets/images/chitato.png",
        "color": Colors.orange,
        "category": "Snack",
      },
      // ... (item snack lainnya)
      {
        "name": "Lays Rumput Laut",
        "weight": "68gr",
        "price": "Rp 11.000",
        "image": "assets/images/lays.png",
        "color": Colors.orange,
        "category": "Snack",
      },
      {
        "name": "Oreo",
        "weight": "133gr",
        "price": "Rp 8.500",
        "image": "assets/images/oreo.png",
        "color": Colors.orange,
        "category": "Snack",
      },
      {
        "name": "Beng Beng",
        "weight": "25gr",
        "price": "Rp 2.000",
        "image": "assets/images/bengbeng.png",
        "color": Colors.orange,
        "category": "Snack",
      },
      {
        "name": "Silverqueen",
        "weight": "62gr",
        "price": "Rp 15.000",
        "image": "assets/images/silverqueen.png",
        "color": Colors.orange,
        "category": "Snack",
      },
      {
        "name": "Qtela",
        "weight": "180gr",
        "price": "Rp 12.500",
        "image": "assets/images/qtela.png",
        "color": Colors.orange,
        "category": "Snack",
      },
    ];

    final List<Map<String, dynamic>> drinks = [
      {
        "name": "Teh Kotak",
        "weight": "300ml",
        "price": "Rp 5.000",
        "image": "assets/images/tehkotak.png",
        "color": Colors.blue,
        "category": "Drink",
      },
      // ... (item drink lainnya)
      {
        "name": "Floridina",
        "weight": "350ml",
        "price": "Rp 3.500",
        "image": "assets/images/floridina.png",
        "color": Colors.blue,
        "category": "Drink",
      },
      {
        "name": "Good Day",
        "weight": "250ml",
        "price": "Rp 6.500",
        "image": "assets/images/goodday.png",
        "color": Colors.blue,
        "category": "Drink",
      },
      {
        "name": "Le Minerale",
        "weight": "600ml",
        "price": "Rp 3.000",
        "image": "assets/images/leminerale.png",
        "color": Colors.blue,
        "category": "Drink",
      },
      {
        "name": "Coca Cola",
        "weight": "390ml",
        "price": "Rp 5.500",
        "image": "assets/images/cocacola.png",
        "color": Colors.blue,
        "category": "Drink",
      },
      {
        "name": "Pocari Sweat",
        "weight": "500ml",
        "price": "Rp 7.000",
        "image": "assets/images/pocari.png",
        "color": Colors.blue,
        "category": "Drink",
      },
    ];

    final List<Map<String, dynamic>> electronics = [
      {
        "name": "Earphone TWS",
        "weight": "Samsung",
        "price": "Rp 80.000",
        "image": "assets/images/tws.png",
        "color": Colors.grey,
        "category": "Electronic",
      },
      // ... (item electronic lainnya)
      {
        "name": "USB Cable",
        "weight": "Type-C",
        "price": "Rp 25.000",
        "image": "assets/images/usb.png",
        "color": Colors.grey,
        "category": "Electronic",
      },
      {
        "name": "Powerbank",
        "weight": "10000mAh",
        "price": "Rp 150.000",
        "image": "assets/images/powerbank.png",
        "color": Colors.grey,
        "category": "Electronic",
      },
      {
        "name": "Mouse",
        "weight": "Wireless",
        "price": "Rp 55.000",
        "image": "assets/images/mouse.png",
        "color": Colors.grey,
        "category": "Electronic",
      },
      {
        "name": "Keyboard",
        "weight": "Mechanical",
        "price": "Rp 250.000",
        "image": "assets/images/keyboard.png",
        "color": Colors.grey,
        "category": "Electronic",
      },
      {
        "name": "Speaker",
        "weight": "Bluetooth",
        "price": "Rp 95.000",
        "image": "assets/images/speaker.png",
        "color": Colors.grey,
        "category": "Electronic",
      },
    ];

    // --- 2. LOGIKA PEMILIHAN LIST ---
    // Menentukan list mana yang ditampilkan berdasarkan kategori yang dipilih
    List<Map<String, dynamic>> displayList = [];

    if (categoryName == "Snack") {
      displayList = snacks;
    } else if (categoryName == "Drink") {
      displayList = drinks;
    } else if (categoryName == "Electronic") {
      displayList = electronics;
    } else if (categoryName == "All Products") {
      // Menggabungkan semua list jika user memilih "See More" / Explore
      displayList = [...snacks, ...drinks, ...electronics];
    } else {
      displayList = snacks; // Default fallback
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER KUSTOM
            _buildCustomHeader(context),

            const SizedBox(height: 10),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildSearchBar(),
            ),

            const SizedBox(height: 20),

            // GRID PRODUCT LIST
            // Menampilkan produk dalam format Grid 2 kolom
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Jumlah kolom 2
                  childAspectRatio: 0.65, // Rasio tinggi lebar kartu
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: displayList.length,
                itemBuilder: (context, index) {
                  final product = displayList[index];
                  return _buildGridItem(
                    context,
                    product,
                    product["color"] as Color,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue.shade50, Colors.white.withOpacity(0.5)],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black,
                ),
                // Navigasi Back (Kembali)
                onPressed: () => Navigator.pop(context),
              ),
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
                    categoryName, // Judul Halaman sesuai Kategori
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black87),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "search",
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    Map<String, dynamic> product,
    Color borderColor,
  ) {
    return GestureDetector(
      // NAVIGASI: Klik produk -> Detail Produk
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              name: product["name"]!,
              price: product["price"]!,
              imagePath: product["image"]!,
              weight: product["weight"]!,
              // Mengambil kategori langsung dari item produk agar akurat
              categoryName: product["category"]!,
              themeColor: borderColor,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product["name"]!,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              product["weight"]!,
              style: const TextStyle(fontSize: 11, color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Center(
                child: Image.asset(
                  product["image"]!,
                  fit: BoxFit.contain,
                  errorBuilder: (c, o, s) => Icon(
                    Icons.image,
                    size: 60,
                    color: borderColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product["price"]!, // Menampilkan harga
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
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
