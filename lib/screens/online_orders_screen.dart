import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/widgets/grey_label_widget.dart';
import 'package:flutter/material.dart';

import '../config/evrika_colors.dart';

class OnlineOrderScreen extends StatelessWidget {
  const OnlineOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GreyLabel(text: 'Номер заказа'),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(5.0),
                    ),
                    borderSide:
                    BorderSide(color: EvrikaColors.kPrimaryColor)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                hintText: 'Введите номер заказа...', hintStyle: EvrikaTextStyles.lightGrayS15W400),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 47,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/online_order');
                },
                child: Text('Найти заказ', style: EvrikaTextStyles.whiteS17W600,)),
          )
        ],
      ),
    );
  }
}
