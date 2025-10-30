import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog();

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  // Controller'ı State sınıfının bir parçası yapıyoruz.
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Controller'ı, widget oluşturulurken SADECE BİR KEZ yaratıyoruz.
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // Widget ağaçtan kaldırıldığında controller'ı GÜVENLE yok ediyoruz.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Yeni Görev Ekle'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Görev adı'),
        onSubmitted: (value) {
          // Enter'a basıldığında da eklemesi için
          Navigator.of(context).pop(_controller.text);
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Sadece kapatır
          child: const Text('İptal'),
        ),
        ElevatedButton(
          onPressed: () {
            // Sadece girilen metni bir önceki ekrana döndürerek kapatır.
            Navigator.of(context).pop(_controller.text);
          },
          child: const Text('Ekle'),
        ),
      ],
    );
  }
}
