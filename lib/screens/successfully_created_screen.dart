import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/evrika_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessfullyCreatedScreen extends StatelessWidget {
  const SuccessfullyCreatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 4, color: EvrikaColors.kPrimaryColor),
                ),
                child: SvgPicture.asset('$kAssetIcons/done.svg'),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Заявка успеншо создана!',
                style: TextStyle(color: EvrikaColors.darkColor, fontSize: 20),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }, child: Text('Вернуться на главную'))
            ],
          ),
        ),
      ),
    );
  }
}