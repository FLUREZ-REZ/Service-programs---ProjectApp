import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('گالری')),
      body: const Center(
        child: Text('این صفحه گالری است'),
      ),
    );
  }
}
