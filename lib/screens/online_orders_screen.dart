import 'package:evrika_retail/widgets/grey_label_widget.dart';
import 'package:flutter/material.dart';

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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                hintText: 'Введите номер заказа...'),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/online_order');
              },
              child: Text('Найти заказ'))
        ],
      ),
    );
  }
}
