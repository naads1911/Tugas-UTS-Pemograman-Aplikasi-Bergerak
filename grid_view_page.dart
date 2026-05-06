import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _crossAxisCount = 2;

  final List<Map<String, dynamic>> _items = [
    {'title': 'Flutter', 'icon': Icons.phone_android, 'color': Colors.blue},
    {'title': 'Dart', 'icon': Icons.code, 'color': Colors.teal},
    {'title': 'Firebase', 'icon': Icons.local_fire_department, 'color': Colors.orange},
    {'title': 'Android', 'icon': Icons.android, 'color': Colors.green},
    {'title': 'iOS', 'icon': Icons.apple, 'color': Colors.grey},
    {'title': 'API', 'icon': Icons.cloud_outlined, 'color': Colors.indigo},
    {'title': 'Database', 'icon': Icons.storage, 'color': Colors.purple},
    {'title': 'UI/UX', 'icon': Icons.design_services, 'color': Colors.pink},
    {'title': 'Git', 'icon': Icons.merge_type, 'color': Colors.red},
    {'title': 'VS Code', 'icon': Icons.edit_note, 'color': Colors.blue},
    {'title': 'Testing', 'icon': Icons.bug_report_outlined, 'color': Colors.amber},
    {'title': 'Deploy', 'icon': Icons.rocket_launch_outlined, 'color': Colors.deepOrange},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
        actions: [
          // Toggle jumlah kolom
          Row(
            children: [
              const Text('Kolom:', style: TextStyle(color: Colors.white70, fontSize: 12)),
              const SizedBox(width: 4),
              DropdownButton<int>(
                value: _crossAxisCount,
                dropdownColor: const Color(0xFF5C6BC0),
                style: const TextStyle(color: Colors.white),
                underline: const SizedBox(),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                items: [2, 3, 4].map((count) {
                  return DropdownMenuItem(
                    value: count,
                    child: Text('$count', style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _crossAxisCount = val);
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.0,
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            final Color color = item['color'] as Color;
            return _buildGridItem(item['title'] as String, item['icon'] as IconData, color);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
