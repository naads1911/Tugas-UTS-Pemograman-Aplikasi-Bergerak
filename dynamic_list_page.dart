import 'package:flutter/material.dart';

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _items = [
    {'text': 'Belajar Flutter', 'done': false},
    {'text': 'Praktikum Pemrograman Mobile', 'done': true},
    {'text': 'Membuat Aplikasi MyPorto', 'done': false},
  ];

  void _addItem() {
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _items.add({'text': _controller.text.trim(), 'done': false});
      _controller.clear();
    });
  }

  void _toggleDone(int index) {
    setState(() {
      _items[index]['done'] = !_items[index]['done'];
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int doneCount = _items.where((item) => item['done'] == true).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic List Example'),
      ),
      body: Column(
        children: [
          // Header statistik
          Container(
            color: const Color(0xFF5C6BC0).withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${_items.length} item',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Selesai: $doneCount',
                  style: const TextStyle(
                    color: Color(0xFF5C6BC0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Input tambah item
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Tambah item baru...',
                      prefixIcon: const Icon(Icons.add_task),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onSubmitted: (_) => _addItem(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C6BC0),
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(14),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          // List item
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox_outlined, size: 60, color: Colors.grey),
                        SizedBox(height: 12),
                        Text('Belum ada item', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return Dismissible(
                        key: Key('$index-${item['text']}'),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (_) => _deleteItem(index),
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          elevation: 1,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: GestureDetector(
                              onTap: () => _toggleDone(index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: item['done'] == true
                                      ? const Color(0xFF5C6BC0)
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: item['done'] == true
                                        ? const Color(0xFF5C6BC0)
                                        : Colors.grey.shade400,
                                    width: 2,
                                  ),
                                ),
                                child: item['done'] == true
                                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                                    : null,
                              ),
                            ),
                            title: Text(
                              item['text'] as String,
                              style: TextStyle(
                                decoration: item['done'] == true
                                    ? TextDecoration.lineThrough
                                    : null,
                                color: item['done'] == true
                                    ? Colors.grey
                                    : Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline, color: Colors.red),
                              onPressed: () => _deleteItem(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Geser item ke kiri untuk menghapus',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ),
        ],
      ),
    );
  }
}
