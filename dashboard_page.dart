import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  // Menyimpan status tombol mana saja yang sudah diklik
  final Set<int> _clickedButtons = {};

  final List<Map<String, dynamic>> _menuItems = [
    {'title': 'Counter', 'route': '/counter', 'icon': Icons.add_circle_outline},
    {'title': 'Widget Bertingkat', 'route': '/widget-bertingkat', 'icon': Icons.layers_outlined},
    {'title': 'User Input Example', 'route': '/user-input', 'icon': Icons.edit_outlined},
    {'title': 'Dynamic List Example', 'route': '/dynamic-list', 'icon': Icons.list_alt_outlined},
    {'title': 'Navigasi Sederhana', 'route': '/navigasi-sederhana', 'icon': Icons.swap_horiz_outlined},
    {'title': 'Grid View', 'route': '/grid-view', 'icon': Icons.grid_view_outlined},
    {'title': 'Tentang Saya', 'route': '/tentang-saya', 'icon': Icons.person_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPorto',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cek hasil karyaku disini:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  final bool isClicked = _clickedButtons.contains(index);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _clickedButtons.add(index);
                          });
                          Navigator.pushNamed(context, item['route'] as String);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isClicked
                              ? const Color(0xFF5C6BC0) // warna indigo jika sudah diklik
                              : const Color(0xFFE0E0E0), // abu muda default
                          foregroundColor: isClicked ? Colors.white : Colors.black87,
                          elevation: isClicked ? 3 : 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'] as IconData,
                              size: 18,
                              color: isClicked ? Colors.white70 : Colors.black54,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['title'] as String,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
