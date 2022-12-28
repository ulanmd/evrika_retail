import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../config/evrika_colors.dart';

class LinkScreen extends StatelessWidget {
  const LinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: 'KZ');
    final TextEditingController _phoneNumber = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height*0.83,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Просканируйте QR-код, чтобы скачать приложение',
              textAlign: TextAlign.center,
              style: EvrikaTextStyles.darkS17W500,
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: SvgPicture.asset(
                  '$kAssetIcons/qr.svg',
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Color.fromRGBO(83, 83, 83, 0.15),
                    ),
                  ],
                ),
              ),
            ),
            //SvgPicture.asset('$kAssetIcons/qr.svg', width: MediaQuery.of(context).size.width*0.6,),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Expanded(
                  child: Divider(
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 2,
                  ),
                ),
                Text(
                  "или отправьте ссылку клинету по SMS",
                  style: EvrikaTextStyles.darkS14W500,
                ),
                Expanded(
                  child: Divider(
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Номер телефона:', style: EvrikaTextStyles.labelGrayS12W400,),
            SizedBox(height: 10,),
            InternationalPhoneNumberInput(
              maxLength: 12,
              textFieldController: _phoneNumber,
              errorMessage: 'Некорректный номер телефона',
              onInputChanged: (PhoneNumber value) {},
              initialValue: number,
              inputDecoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  //hintText: 'Введите номер',
                  hintStyle: EvrikaTextStyles.labelGrayS15W400,
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide:
                      BorderSide(color: EvrikaColors.kPrimaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: EvrikaColors.kPrimaryColor))),
              countries: [
                'KZ',
              ],
              autoValidateMode: AutovalidateMode.onUserInteraction,
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
              onInputValidated: (bool value) {},
              selectorConfig: SelectorConfig(
                  showFlags: false,
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                  setSelectorButtonAsPrefixIcon: true,
                  leadingPadding: 15,
                  trailingSpace: false),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                height: 47,
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Отправить ссылку', style: EvrikaTextStyles.whiteS16W500,)))
          ],
        ),
      ),
    );
  }
}
