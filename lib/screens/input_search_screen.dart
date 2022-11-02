import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/evrika_colors.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InputSearchScreen extends StatelessWidget {
  const InputSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithBackBtn(context, 'Поиск товара'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 47,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Введите название товара...',
                  suffixIcon: IconButton(
                    onPressed: () => print('you clicked me'),
                    icon: SvgPicture.asset('$kAssetIcons/search.svg'),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 20.0, 10.0),
                ),
                //   decoration: InputDecoration(
                //       suffixIcon: IconButton(
                //           icon: Icon(Icons.arrow_forward_ios),
                //           onPressed: () => print('suffixIcon pressed')),
                // ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 47,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: EvrikaColors.boxShadowColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Text('iPhone 13 Pro Max'),
                  Spacer(),
                  SvgPicture.asset('$kAssetIcons/plus.svg')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
