import 'package:flutter/material.dart';

class TentangSayaPage extends StatelessWidget {
  const TentangSayaPage({super.key});

  // ============================================================
  // GANTI DATA DI BAWAH INI DENGAN DATA KAMU SENDIRI!
  // ============================================================
  static const String npm = '20241320069';
  static const String nama = 'Nadia Dinda Nabila Maharani';
  static const String deskripsi =
      'Sekilas tentang saya...\n\n'
      'Saya adalah mahasiswa Program Studi Sistem Informasi yang '
      'sedang belajar pemrograman aplikasi bergerak menggunakan Flutter. '
      'Saya tertarik dengan pengembangan aplikasi mobile dan teknologi informasi.';
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header background
            Container(
              width: double.infinity,
              color: const Color(0xFF5C6BC0).withOpacity(0.08),
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  // Foto profil - GANTI dengan foto kamu
                  // Jika ingin pakai gambar dari asset:
                  // CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/images/foto.jpeg'))
                  // Jika ingin pakai gambar dari network:
                  // CircleAvatar(radius: 60, backgroundImage: NetworkImage('URL_FOTO'))
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF5C6BC0).withOpacity(0.15),
                      border: Border.all(
                        color: const Color(0xFF5C6BC0),
                        width: 3,
                      ),
                    ),
                    // Ganti Icon di bawah dengan foto kamu
                    child: ClipOval(
                      child: Image.asset('assets/images/foto.jpeg',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Nama
                  const Text(
                    nama,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // NPM
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5C6BC0).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'NPM: $npm',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF5C6BC0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Deskripsi singkat
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5C6BC0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Tentang Saya',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5C6BC0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: const Text(
                      deskripsi,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Info tambahan
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFF5C6BC0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Informasi',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5C6BC0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.school_outlined, 'Program Studi', 'Sistem Informasi'),
                  _buildInfoRow(Icons.account_balance_outlined, 'Universitas', 'Universitas Kebangsaan RI'),
                  _buildInfoRow(Icons.book_outlined, 'Mata Kuliah', 'Pemrograman Aplikasi Bergerak'),
                  _buildInfoRow(Icons.phone_android_outlined, 'Framework', 'Flutter & Dart'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF5C6BC0)),
          const SizedBox(width: 12),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
