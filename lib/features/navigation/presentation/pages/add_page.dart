import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('افزودن')),
      body: const Center(
        child: Text('این صفحه افزودن است'),
      ),
    );
  }
}
