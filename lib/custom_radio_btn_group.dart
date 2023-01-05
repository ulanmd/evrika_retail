import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StatusRadioButtonGroup extends StatefulWidget {
  const StatusRadioButtonGroup({Key? key, required this.options}) : super(key: key);

  final List<String> options;

  @override
  State<StatusRadioButtonGroup> createState() => _StatusRadioButtonGroupState();
}

class _StatusRadioButtonGroupState extends State<StatusRadioButtonGroup> {
  int selectedBtn = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedBtn = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: index == selectedBtn
                          ? EvrikaColors.filterSelectedColor
                          : Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 30),
                    child: Row(
                      children: [
                        Text(
                          widget.options[index],
                          style: EvrikaTextStyles.darkS13W400,
                        ),
                        Spacer(),
                        index == selectedBtn
                            ? SvgPicture.asset(
                                '$kAssetIcons/done.svg',
                                width: 10,
                                height: 13,
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
              );
            })
        );
  }
}
