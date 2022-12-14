import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/state/auth.dart';
import 'package:evrika_retail/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'config/evrika_colors.dart';

class ProfileBottomModal extends StatelessWidget {
  const ProfileBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
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
                        Observer(
                          builder: (_) {
                            return Text(
                              '${auth.name}',
                              style: TextStyle(fontSize: 18),
                            );
                          }
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Магазин - Шымкент, на Севере',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Желаем успешных продаж и побольше бонусов!',
                            style: TextStyle(
                                fontSize: 14,
                                color: EvrikaColors.kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                        onPressed: () async{
                          auth.logout();
                          Toast.success(context, 'Вы вышли из аккаунта');
                          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                          print('f######ck');
                          print(auth.isAuth);
                        },
                        child: Text('Выйти')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
