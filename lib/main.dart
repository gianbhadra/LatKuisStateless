import 'package:flutter/material.dart';

import 'login_page.dart';


void main() {
  runApp(const MyApp());
}


// ==========================================================
// APLIKASI UTAMA
// ==========================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Resto Kita',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),

        useMaterial3: true,
      ),

      // Halaman pertama adalah Login
      home: const LoginPage(),
    );
  }
}