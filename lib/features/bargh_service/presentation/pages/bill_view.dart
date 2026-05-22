import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/features/bargh_service/presentation/provider/bill_provider.dart';

class BillView extends StatefulWidget {
  const BillView({super.key});

  @override
  State<BillView> createState() => _BillViewState();
}

class _BillViewState extends State<BillView> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<BillProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(25, 30, 40, 1),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.03,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            style: const TextStyle(
                              fontFamily: 'iran',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                            controller: controller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(59, 71, 94, 1),
                              hintText: "شناسه قبض",
                              hintStyle: TextStyle(color: Colors.white , fontSize: 12),
                              suffixIcon: Icon(CupertinoIcons.doc_text , color: Colors.white60, size: 20,),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),

                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.white
                              ),
                            ),
                            onPressed: provider.isLoading
                                ? null
                                : () {
                              final id = controller.text.trim();
                              if (id.isNotEmpty) {
                                provider.fetchBill(id);
                              }
                            },
                            child: provider.isLoading
                                ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : const Text(
                              'استعلام',
                              style: TextStyle(
                                fontFamily: 'iran',
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),

                          if (provider.isLoading)
                            const Center(child: CircularProgressIndicator())
                          else if (provider.errorMessage != null)
                            Text(
                              provider.errorMessage!,
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            )
                          else if (provider.bill != null)
                              Text(
                                'Bill loaded: ${provider.bill!.amount}',
                                textAlign: TextAlign.center,
                              )
                            else
                              const Text(
                                'شناسه قبض را در کادر بالا وارد نمایید',
                                style: TextStyle(fontFamily: 'iran' , color: Colors.white , fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
