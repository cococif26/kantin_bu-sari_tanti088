import 'package:flutter/material.dart';

import 'pages/menu_list_page.dart';
import 'pages/menu_detail_page.dart';
import 'pages/order_page.dart';
import 'pages/struck_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kantin Bu Sari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA4292C)),
        useMaterial3: true,
        fontFamily: 'poppins',
      ),

      // Best practice: daftarkan semua route di satu tempat
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuListPage(),
        '/detail': (context) => const MenuDetailPage(),
        '/pesan': (context) {
          // Mengambil arguments dengan aman menggunakan as? agar tidak error jika null
          final arguments =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;

          return OrderPage(
            imageAsset:
                arguments?['imageAsset'] as String? ?? 'assets/mie_ayam.png',
            menuName:
                arguments?['menuName'] as String? ?? 'Mie Kuah Kaldu Ayam',
            hargaSatuan: arguments?['hargaSatuan'] as int? ?? 12000,
          );
        },
        '/struk': (context) => const StrukPage(),
      },
    );
  }
}
