import 'package:evrika_retail/grey_label.dart';
import 'package:flutter/material.dart';

class SaleItemWidget extends StatelessWidget {
  const SaleItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
               Expanded(
                 flex: 1,
                   child: GreyLabel(text:'Номер заявки:')),
              Expanded(
                  flex: 2,
                  child: Text('Zayavka 123'))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: GreyLabel(text:'Бонусы:')),
              Expanded(
                  flex: 2,
                  child: Text('300 ₸'))
            ],
          )
        ],
      ),
    );
  }
}
