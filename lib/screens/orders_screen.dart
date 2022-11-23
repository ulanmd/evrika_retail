import 'package:crea_radio_button/crea_radio_button.dart';
import 'package:evrika_retail/bottom_date_picker.dart';
import 'package:evrika_retail/screens/add_items_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../consts.dart';
import '../config/evrika_colors.dart';
import '../proposal_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      child: Stack(clipBehavior: Clip.none, children: [
        Column(
          children: [
            BottomDatePickerWidget(
              isRange: true,
              text: 'Дата',
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: RadioButtonGroup(
                  buttonHeight: 30,
                  buttonWidth: MediaQuery.of(context).size.width / 3.52,
                  unselectEnabled: false,
                  circular: true,
                  mainColor: EvrikaColors.salesTextGrayColor,
                  selectedColor: EvrikaColors.kPrimaryColor,
                  preSelectedIdx: 0,
                  spaceBetween: 3,
                  textStyle: const TextStyle(fontSize: 14, color: Colors.white),
                  options: [
                    RadioOption("25.0", "Все"),
                    RadioOption("22", "В процессе"),
                    RadioOption("50.0", "Закрыто"),
                  ],
                  callback: (RadioOption val) {
                    print(val.value);
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            const ProposalItemWidget(
                type: 'inProcess',
                color: EvrikaColors.inProcessColor,
                text: 'В процессе'),
          ],
        ),
        Positioned(
          bottom: -10,
          right: -10,
          child: FloatingActionButton(
              elevation: 4,
              backgroundColor: EvrikaColors.kPrimaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: const AddItemsScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset('$kAssetIcons/add.svg'),
              )),
        ),
      ]),
    );
  }
}
