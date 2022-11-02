import 'package:evrika_retail/evrika_colors.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/item_title_label.dart';
import 'package:flutter/material.dart';

class CategorySearchScreen extends StatelessWidget {
  const CategorySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Поиск товара'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: EvrikaColors.boxShadowColor,
                  borderRadius: BorderRadius.all(Radius.circular(7))
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Placeholder(
                      fallbackWidth: 30,
                      fallbackHeight: 30,
                      color: EvrikaColors.kPrimaryColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ItemTitleLabel(
                      title: 'Товары',
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: EvrikaColors.boxShadowColor,
                    borderRadius: BorderRadius.all(Radius.circular(7))
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Placeholder(
                      fallbackWidth: 30,
                      fallbackHeight: 30,
                      color: EvrikaColors.kPrimaryColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ItemTitleLabel(
                      title: 'Услуги',
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
