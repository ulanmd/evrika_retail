import 'package:flutter/material.dart';

import 'evrika_colors.dart';

class AddItemBtnGroup extends StatelessWidget {
  const AddItemBtnGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            child: Container(
              padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: EvrikaColors.kPrimaryColor),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  color: Colors.white,
                ),
              child: Icon(Icons.search, color: EvrikaColors.kPrimaryColor,)
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: EvrikaColors.kPrimaryColor, width: 1),
                    bottom: BorderSide(color: EvrikaColors.kPrimaryColor, width: 1),
                  ),
                  color: Colors.white,
                ),
                child: Icon(Icons.qr_code_outlined, color: EvrikaColors.kPrimaryColor,)
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: EvrikaColors.kPrimaryColor),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                  color: Colors.white,
                ),
                child: Icon(Icons.category_outlined, color: EvrikaColors.kPrimaryColor,)
            ),
          ),
        ),
      ],
    );
  }
}
