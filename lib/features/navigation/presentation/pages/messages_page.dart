import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('پیام‌ها')),
      body: const Center(
        child: Text('این صفحه پیام‌ها است'),
      ),
    );
  }
}
