import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String imageAsset;
  final String menuName;
  final int hargaSatuan;

  const OrderPage({
    super.key,
    required this.imageAsset,
    required this.menuName,
    required this.hargaSatuan,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int jumlahPesan = 1;
  String? selectedLevel;
  final TextEditingController namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Menghitung total harga secara otomatis
    int totalHarga = widget.hargaSatuan * jumlahPesan;

    // Pengecekan apakah menu saat ini termasuk Makanan Berat (yang punya level pedas)
    bool isMakananBerat =
        widget.menuName.toLowerCase().contains('mie') ||
        widget.menuName.toLowerCase().contains('nasi');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Pemesanan',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        foregroundColor: const Color.fromARGB(255, 26, 26, 26),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. GAMBAR MENU DI BAGIAN ATAS
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset(widget.imageAsset, fit: BoxFit.cover),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAMA MENU & HARGA SATUAN
                  Text(
                    widget.menuName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rp ${widget.hargaSatuan.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFFA4292C),
                    ),
                  ),
                  const Divider(height: 30),

                  // 2. LEVEL PEDAS (Hanya tampil jika menu adalah Makanan Berat)
                  if (isMakananBerat) ...[
                    const Text(
                      'Level Pedas',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    RadioListTile<String>(
                      title: const Text(
                        'Level 1: B Aja',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      value: 'Level 1: B Aja',
                      groupValue: selectedLevel,
                      activeColor: const Color(0xFFA4292C),
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text(
                        'Level 2: Berani',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      value: 'Level 2: Berani',
                      groupValue: selectedLevel,
                      activeColor: const Color(0xFFA4292C),
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text(
                        'Level 3: Gagah',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      value: 'Level 3: Gagah',
                      groupValue: selectedLevel,
                      activeColor: const Color(0xFFA4292C),
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value;
                        });
                      },
                    ),
                    const Divider(height: 30),
                  ],

                  // 3. INPUT NAMA PEMESAN
                  const Text(
                    'Atas Nama Pesanan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: namaController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan nama pemesan...',
                      hintStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFA4292C),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // 4. KOTAK JUMLAH PESANAN & TOMBOL TAMBAH PESAN
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Jumlah Pesanan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (jumlahPesan > 1) jumlahPesan--;
                                    });
                                  },
                                  icon: const Icon(Icons.remove_circle_outline),
                                  color: const Color(0xFFA4292C),
                                ),
                                Text(
                                  '$jumlahPesan',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      jumlahPesan++;
                                    });
                                  },
                                  icon: const Icon(Icons.add_circle_outline),
                                  color: const Color(0xFFA4292C),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/struk');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA4292C),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Tambah Pesanan • Rp ${totalHarga.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                              style: const TextStyle(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
