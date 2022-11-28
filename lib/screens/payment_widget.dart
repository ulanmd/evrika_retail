import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/screens/successfully_created_screen.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    bool toDelivery = false;
    String gender = "male";
    return WillPopScope(
      onWillPop: ()async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: EvrikaColors.boxShadowColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GreyLabel(text: 'Клиент:', fontSize: 12,),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Марина Редина',
                        style: EvrikaTextStyles.darkS15W400,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GreyLabel(text: 'Бонусы:', fontSize: 12,),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '5000 ₸',
                        style: EvrikaTextStyles.primaryS15W400
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Партнер',
                style: EvrikaTextStyles.darkS17W400
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  activeColor: EvrikaColors.kPrimaryColor,
                  value: toDelivery,
                  onChanged: (bool value) {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          GreyLabel(text: 'Cпособ оплаты', fontSize: 12,),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border:
                        Border.all(width: 1, color: EvrikaColors.kLightGray),
                  ),
                  child: RadioListTile(
                    title: Text("Банк"),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border:
                    Border.all(width: 1, color: EvrikaColors.kLightGray),
                  ),
                  child: RadioListTile(
                    title: Text("Касса"),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GreyLabel(text: 'ИИН клиента', fontSize: 12,),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 47,
            child: TextField(),
          ),
          SizedBox(
            height: 30,
          ),
          GreyLabel(text: 'Первоначальный взнос', fontSize: 12,),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 47,
            child: TextField(),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SuccessfullyCreatedScreen()),
                );
              },
              child: Text('Создать заяку', style: EvrikaTextStyles.whiteS17W600,))
        ],
      ),

    );
  }
}
