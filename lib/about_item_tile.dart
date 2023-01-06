import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/quantity_counter.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:flutter/material.dart';

import 'custom_dropdown.dart';
import 'config/evrika_colors.dart';

class AboutItemTile extends StatefulWidget {
  AboutItemTile({Key? key}) : super(key: key);

  @override
  State<AboutItemTile> createState() => _AboutItemTileState();
}

class _AboutItemTileState extends State<AboutItemTile> {
  bool _customTileExpanded = false;
  String _showHideText = 'Показать';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: EvrikaColors.kLightColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          'Информация о товаре',
          style: EvrikaTextStyles.darkS17W400,
        ),
        trailing: InkWell(
          child: Text(
            _showHideText,
            style: EvrikaTextStyles.primaryS15W400,
          ),
        ),
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
            _showHideText = _customTileExpanded ? 'Скрыть' : 'Показать';
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GreyLabel(
                  text: 'Cклад:',
                  fontSize: 12,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDropdown(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GreyLabel(
                            text: 'Качество:',
                            fontSize: 12,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomDropdown(
                            isHalfScreen: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GreyLabel(
                            text: 'Количество:',
                            fontSize: 12,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          QuantityCounter()
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
