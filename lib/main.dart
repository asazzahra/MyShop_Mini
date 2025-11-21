import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import package font
import 'package:myshop_mini/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menghilangkan banner debug di pojok kanan atas
      title: 'MyShop Mini', // Judul Aplikasi
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white, // Latar lelakang default putih
        // Menerapkan Font Poppins untuk seluruh teks dalam aplikasi agar konsisten
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      // Halaman pertama yang dibuka adalah HomeScreen
      home: const HomeScreen(),
    );
  }
}
