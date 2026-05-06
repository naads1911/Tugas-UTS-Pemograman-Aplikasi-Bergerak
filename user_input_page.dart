import 'package:flutter/material.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({super.key});

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _pesanController = TextEditingController();

  String _selectedGender = 'Laki-laki';
  bool _setuju = false;
  String _result = '';

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _pesanController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_setuju) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Harap setujui syarat dan ketentuan!'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      setState(() {
        _result = '''
✅ Data berhasil disimpan!

Nama    : ${_namaController.text}
Email   : ${_emailController.text}
Gender  : $_selectedGender
Pesan   : ${_pesanController.text}
        ''';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form berhasil dikirim!'),
          backgroundColor: Color(0xFF5C6BC0),
        ),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _namaController.clear();
    _emailController.clear();
    _pesanController.clear();
    setState(() {
      _selectedGender = 'Laki-laki';
      _setuju = false;
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Formulir Input Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Nama
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Nama tidak boleh kosong';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
                  if (!value.contains('@')) return 'Format email tidak valid';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Gender
              const Text('Jenis Kelamin:', style: TextStyle(fontSize: 14, color: Colors.black54)),
              Row(
                children: ['Laki-laki', 'Perempuan'].map((gender) {
                  return Expanded(
                    child: RadioListTile<String>(
                      title: Text(gender, style: const TextStyle(fontSize: 14)),
                      value: gender,
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() => _selectedGender = value!);
                      },
                      activeColor: const Color(0xFF5C6BC0),
                      contentPadding: EdgeInsets.zero,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),

              // Pesan
              TextFormField(
                controller: _pesanController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Pesan',
                  alignLabelWithHint: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Icon(Icons.message_outlined),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Pesan tidak boleh kosong';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Checkbox
              CheckboxListTile(
                title: const Text('Saya setuju dengan syarat dan ketentuan', style: TextStyle(fontSize: 14)),
                value: _setuju,
                onChanged: (val) => setState(() => _setuju = val!),
                activeColor: const Color(0xFF5C6BC0),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 20),

              // Tombol
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _resetForm,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Reset'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5C6BC0),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Kirim', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),

              // Result
              if (_result.isNotEmpty) ...[
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5C6BC0).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF5C6BC0).withOpacity(0.3)),
                  ),
                  child: Text(
                    _result,
                    style: const TextStyle(fontSize: 14, height: 1.8),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
