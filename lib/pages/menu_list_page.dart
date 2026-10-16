import 'package:flutter/material.dart';

class MenuListPage extends StatelessWidget {
  const MenuListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Kantin Bu Sari - Daftar Menu'),
      //   backgroundColor: Colors.deepOrange,
      //   foregroundColor: Colors.white,
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/foto.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 45),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA4292C),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(Icons.restaurant_menu, size: 32),
                  label: const Text(
                    'Lihat Detail Menu',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
