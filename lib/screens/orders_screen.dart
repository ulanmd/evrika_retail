import 'package:crea_radio_button/crea_radio_button.dart';
import 'package:evrika_retail/bottom_date_picker.dart';
import 'package:evrika_retail/screens/add_items_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../consts.dart';
import '../evrika_colors.dart';
import '../proposal_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      child: Stack(children: [
        Column(
          children: [
            BottomDatePickerWidget(),
            SizedBox(
              height: 12,
            ),
            Center(
              child: RadioButtonGroup(
                  buttonHeight: 35,
                  buttonWidth: MediaQuery.of(context).size.width / 3.52,
                  unselectEnabled: false,
                  circular: true,
                  mainColor: EvrikaColors.kLightGray,
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
              height: 30,
            ),
            const ProposalItemWidget(
                type: 'inProcess',
                color: EvrikaColors.inProcessColor,
                text: 'В процессе'),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: FloatingActionButton(
              backgroundColor: EvrikaColors.kPrimaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop, child: const AddItemsScreen()));
              },
              child: SvgPicture.asset('$kAssetIcons/add.svg')),
        ),
      ]),
    );
  }
}
