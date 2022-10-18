import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'evrika_colors.dart';

class ProfileBottomModal extends StatelessWidget {
  const ProfileBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Профиль сотрудника',
                          style: TextStyle(
                            color: EvrikaColors.darkColor,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: SvgPicture.asset('$kAssetIcons/close.svg'))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Маржан Досыбаева - UI/UX designer',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Магазин - Шымкент, на Севере',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            'Желаем успешных продаж и побольше бонусов!',
                            style: TextStyle(
                                fontSize: 14,
                                color: EvrikaColors.kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // Spacer(),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: EvrikaColors.kErrorColor,
                          onSurface: EvrikaColors.kErrorColor,
                        ),
                        onPressed: () {},
                        child: Text('Выйти')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
