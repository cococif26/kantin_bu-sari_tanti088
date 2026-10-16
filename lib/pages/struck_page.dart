import 'package:flutter/material.dart';

class StrukPage extends StatelessWidget {
  const StrukPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Menerima data arguments yang dikirim dari OrderPage (jika ada)
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Nilai default / fallback jika dibuka secara langsung
    final String menuName = args?['menuName'] ?? 'Mie Kuah Kaldu Ayam';
    final int hargaSatuan = args?['hargaSatuan'] ?? 12000;
    final int jumlahPesan = args?['jumlahPesan'] ?? 1;
    final String? selectedLevel = args?['selectedLevel'];
    final String namaPemesan = args?['namaPemesan'] ?? '-';

    final int totalHarga = hargaSatuan * jumlahPesan;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Struk Pesanan',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        foregroundColor: const Color.fromARGB(255, 26, 26, 26),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // 1. ICON CHECK BESAR DI TENGAH
            const Center(
              child: Icon(Icons.check_circle, color: Colors.green, size: 80),
            ),
            const SizedBox(height: 16),

            // 2. TULISAN TERIMA KASIH
            const Text(
              'Terima kasih sudah order',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // 3. TULISAN ABU-ABU INSTRUKSI PEMBAYARAN
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Pembayaran dilakukan di kasir dengan menunjukan struk dan tunggu dipanggil untuk mengambil pesanan',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // 4. KOTAK DETAIL PESANAN
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detail Pesanan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Divider(height: 24),

                  _buildDetailRow('Atas Nama', namaPemesan),
                  const SizedBox(height: 12),
                  _buildDetailRow('Menu', menuName),
                  if (selectedLevel != null) ...[
                    const SizedBox(height: 12),
                    _buildDetailRow('Level Pedas', selectedLevel),
                  ],
                  const SizedBox(height: 12),
                  _buildDetailRow('Jumlah', '$jumlahPesan Porsi'),
                  const SizedBox(height: 12),
                  _buildDetailRow(
                    'Harga Satuan',
                    'Rp ${hargaSatuan.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  ),

                  const Divider(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Pembayaran',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        'Rp ${totalHarga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Color(0xFFA4292C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // 5. TOMBOL KEMBALI KE MENU UTAMA
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Kembali ke halaman awal / menu list
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA4292C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Selesai / Kembali ke Menu',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget untuk baris detail
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
            fontFamily: 'Poppins',
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
