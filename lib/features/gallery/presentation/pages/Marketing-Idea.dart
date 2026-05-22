import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/core/di/injection.dart';
import 'package:weatherapp/features/auth/presentation/pages/home_page.dart';
import 'package:weatherapp/features/bargh_service/presentation/pages/bill_view.dart';
import 'package:weatherapp/features/bargh_service/presentation/provider/bill_provider.dart';

class MarketingIdea extends StatelessWidget {
  const MarketingIdea({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => sl<BillProvider>(),

      child: Scaffold(

        appBar: AppBar(

          leading: IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage()));
          }, icon: Icon(Icons.arrow_back_ios_new , color: Colors.white,)),
          backgroundColor: Color.fromRGBO(25, 30, 40, 1),
        ),

        body: Column(


          children: [
            Container(
              color: Color.fromRGBO(59, 71, 94, 1),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.03,
              ),
              child: Text("میتوانید شناسه را در سامانه برق من و هم در قبض برق خود مشاهده کنید !" , textDirection: TextDirection.rtl, style: TextStyle(color: Colors.white , fontFamily: 'iran' , fontSize: 13),),
            ),
            Expanded(child: BillView())
          ],
        ),

      ),

    );
  }
}
