import 'package:flutter/material.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Menu',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        foregroundColor: const Color.fromARGB(255, 26, 26, 26),
        backgroundColor:
            Colors.transparent, // Menghilangkan warna background header
        elevation:
            0, // Menghilangkan bayangan header agar menyatu saat di-scroll
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BANNER UTAMA
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset('assets/mie.png', fit: BoxFit.cover),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.black.withOpacity(0.1),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Selamat Datang di Kantin Bu Sari',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Ngomong ngomong soal menu, di Kantin Bu Sari \nmenyuguhkan Mie dan Nasi Ayam yang sangat Istimewa.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 9,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/menu_detail');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFA4292C),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                              ),
                              label: const Text(
                                'Lihat Detail Menu',
                                style: TextStyle(fontFamily: 'Poppins'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ================= KATEGORI 1: MENU MAKANAN BERAT =================
              const Text(
                "Menu Makanan Berat",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 12),

              // Baris 1 (Makanan Berat)
              Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/mie_chili.png',
                      title: 'Mie Chili Oil',
                      description:
                          'Mie lurus kenyal dengan kuah chili oil pedas gurih.',
                      price: 'Rp 12.000',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/mie_ayam.png',
                      title: 'Mie Kuah Kaldu Ayam',
                      description:
                          'Mie dengan kuah kaldu ayam asli yang kaya rempah.',
                      price: 'Rp 12.000',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Baris 2 (Makanan Berat)
              Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/nasi_ayam.png',
                      title: 'Nasi Ayam Bawang',
                      description:
                          'Nasi hangat dengan topping ayam suwir bumbu bawang.',
                      price: 'Rp 13.000',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/nasi_beef.png',
                      title: 'Nasi Beef Teriyaki',
                      description:
                          'Daging sapi empuk saus teriyaki khas Jepang.',
                      price: 'Rp 13.000',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ================= KATEGORI 2: MENU SNACK =================
              const Text(
                "Menu Snack",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 12),

              // Baris Snack
              Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/pangsit.png',
                      title: 'Pangsit Goreng',
                      description:
                          'Pangsit renyah isi ayam dengan saus cocolan.',
                      price: 'Rp 3.000',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/dimsum.png',
                      title: 'Dimsum Goreng',
                      description:
                          'Dimsum lezat digoreng garing di luar lembut di dalam.',
                      price: 'Rp 3.000',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ================= KATEGORI 3: MENU MINUMAN =================
              const Text(
                "Menu Minuman",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 12),

              // Baris Minuman (3 Card)
              Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/es_teh.png',
                      title: 'Es Teh Manis',
                      description: 'Teh melati segar pilihan dengan gula asli.',
                      price: 'Rp 5.000',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/lemon_tea.png',
                      title: 'Es Lemon Tea',
                      description: 'Teh lemon segar kaya vitamin C.',
                      price: 'Rp 5.000',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _buildMenuCard(
                      context,
                      image: 'assets/mineral.png',
                      title: 'Air Mineral',
                      description: 'Air mineral segar untuk menjaga hidrasi.',
                      price: 'Rp 4.000',
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: SizedBox()), // Kosong agar seimbang
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat Card Menu
  Widget _buildMenuCard(
    BuildContext context, {
    required String image,
    required String title,
    required String description,
    required String price,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Color(0xFFA4292C),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      // DI SINI DITAMBAHKAN PENGIRIMAN DATA KE ORDERPAGE
                      Navigator.pushNamed(
                        context,
                        '/pesan',
                        arguments: {
                          'imageAsset': image,
                          'menuName': title,
                          'hargaSatuan': int.parse(
                            price.replaceAll(RegExp(r'[^0-9]'), ''),
                          ),
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA4292C),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Pesan Sekarang',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
