import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/modal_divider_widget.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/state/auth.dart';
import 'package:evrika_retail/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'config/evrika_colors.dart';
import 'modal_control_line_widget.dart';

class ProfileBottomModal extends StatelessWidget {
  const ProfileBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();
    return SafeArea(
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ModalControlLine(),
                  SizedBox(height: 15,),
                  Center(
                    child: Text(
                      'Профиль сотрудника',
                      style: EvrikaTextStyles.darkS20W600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ФИО сотрудника:', style: EvrikaTextStyles.labelGrayS12W400,),
                      SizedBox(height: 5,),
                      Observer(
                        builder: (_) {
                          return Text(
                            '${auth.name}',
                            style: EvrikaTextStyles.darkS16W500,
                          );
                        }
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Магазин:', style: EvrikaTextStyles.labelGrayS12W400,),
                      SizedBox(height: 5,),
                      Text(
                        'Шымкент, на Севере',
                        style: EvrikaTextStyles.darkS16W500,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ModalDivider(),
                      SizedBox(height: 15,),
                      Center(
                        child: Text(
                          'Желаем успешных продаж и побольше бонусов!',
                          textAlign: TextAlign.center,
                          style: EvrikaTextStyles.primaryS15W700,
                        ),
                      ),
                      SizedBox(height: 15,),
                      ModalDivider(),
                      SizedBox(height: 15,),
                      Container(
                          height: 47,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: EvrikaColors.kErrorColor,
                                onSurface: EvrikaColors.kErrorColor,
                              ),
                              onPressed: () async{
                                auth.logout();
                                Toast.success(context, 'Вы вышли из аккаунта');
                                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                                print('f######ck');
                                print(auth.isAuth);
                              },
                              child: Text('Выйти'))),
                      SizedBox(height: 15,)
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


