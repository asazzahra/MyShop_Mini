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
      debugShowCheckedModeBanner: false,
      title: 'MyShop Mini',
      theme: ThemeData(
        useMaterial3: true,
        // 2. MENGGUNAKAN FONT POPPINS SECARA GLOBAL
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomeScreen(),
    );
  }
}
