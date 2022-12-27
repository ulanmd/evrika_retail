import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';

class DiscountsScreen extends StatelessWidget {
  const DiscountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Акции и скидки'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
