import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Jumlah Klik:',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF5C6BC0).withOpacity(0.1),
                border: Border.all(color: const Color(0xFF5C6BC0), width: 3),
              ),
              child: Center(
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5C6BC0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tombol Decrement
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: _decrement,
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.remove, size: 28),
                ),
                const SizedBox(width: 24),
                // Tombol Reset
                FloatingActionButton(
                  heroTag: 'reset',
                  onPressed: _reset,
                  backgroundColor: Colors.grey.shade500,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.refresh, size: 28),
                ),
                const SizedBox(width: 24),
                // Tombol Increment
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: _increment,
                  backgroundColor: const Color(0xFF5C6BC0),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add, size: 28),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              _counter == 0
                  ? 'Tekan + untuk mulai menghitung!'
                  : _counter >= 10
                      ? 'Wah, sudah $_counter kali!'
                      : 'Terus tekan untuk lanjut!',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
