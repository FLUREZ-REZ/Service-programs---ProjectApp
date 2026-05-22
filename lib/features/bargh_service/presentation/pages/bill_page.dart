import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../provider/bill_provider.dart';
import 'bill_view.dart';

final sl = GetIt.instance;

class BillPage extends StatelessWidget {
  const BillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<BillProvider>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('استعلام قبض برق')),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: BillView(),
        ),
      ),
    );
  }
}
