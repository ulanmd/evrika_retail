
import 'package:evrika_retail/config/evrika_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../config/evrika_colors.dart';
import '../state/auth.dart';
import 'login_qr_screen.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();
    double height = MediaQuery.of(context).size.height;

    Future.delayed(Duration(seconds: 1), (){
      auth.setShowLoginAgain(false);
    });

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height / 3.6,
            child: Stack(
              children: [
                Positioned(
                  top: 0 - height / 1.3,
                  right: 0 - height / 2,
                  left: 0 - height / 2,
                  bottom: 0,
                  child: Container(
                    height: height,
                    decoration: const BoxDecoration(
                      color: EvrikaColors.kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/ic_evrika_white.svg",
                          width: 210,
                        ),
                        const SizedBox(height: 15 * 6),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  SvgPicture.asset('assets/icons/illustration.svg'),
                  const SizedBox(
                    height: 60,
                  ),
                   Text(
                    '?????????? ???????????????????? ?????????????????????????? QR ??????',
                    style: EvrikaTextStyles.darkS14W500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            primary: EvrikaColors.kPrimaryColor),
                        onPressed: () async{
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: LoginQrScreen(),
                            ),
                          );
                        },
                        child: Text('?????????????? ??????????????', style: EvrikaTextStyles.whiteS17W600,)),
                  ),
                  Spacer(),
                  Observer(
                    builder: (_) {
                      return auth.showLoginAgain
                          ? Align(
                        alignment: Alignment.centerLeft,
                            child: Container(
                              width: double.infinity,
                        decoration: BoxDecoration(
                            color: EvrikaColors.kWarningColor,
                          borderRadius: BorderRadius.all(Radius.circular(60)),
                        ),
                               padding: const EdgeInsets.all(15 / 1.5),
                            child:  Row(
                              children: [
                                Icon(
                                  Icons.warning_amber_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 15 / 2),
                                Expanded(child: Text('???????????? ??????????????????????????!', style: EvrikaTextStyles.whiteS13W500,)),
                              ],
                            ),),
                          ) : Container();
                    }
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
