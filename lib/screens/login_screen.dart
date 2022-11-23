import 'dart:ui';

import 'package:evrika_retail/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../config/evrika_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                  SvgPicture.asset('assets/icons/login3.svg'),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Чтобы продолжить просканируйте QR код',
                    style: TextStyle(fontSize: 15),
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
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/main');
                        },
                        child: const Text('Открыть сканнер')),
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
