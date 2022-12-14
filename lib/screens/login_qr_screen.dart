import 'dart:convert';

import 'package:evrika_retail/utils/http_client.dart';
import 'package:provider/provider.dart';

import '../qr_loading_widget.dart';
import '../state/auth.dart';
import '../toast.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/state/loading.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

final loading = Loading();

class LoginQrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();
    loading.setLoading(false);
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Отсканируйте QR'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
              allowDuplicates: false,
              controller: MobileScannerController(
                  facing: CameraFacing.back, torchEnabled: false),
              onDetect: (barcode, args) async {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  final String qrCode = barcode.rawValue!;
                  debugPrint('Barcode found! $qrCode');
                  loading.setLoading(true);
                  var response = await HttpClient.authRequest(qrCode);
                  if (response.statusCode == 200) {
                    var json = jsonDecode(response.body);
                    var token = json['data']['access_token'];
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    await sp.setString('accessToken', token);
                    var meResponse = await HttpClient.meRequest(token);
                    var catsResponse = await HttpClient.getCategories();
                    print('catsResponse' + catsResponse);
                    await sp.setString('categories', catsResponse);
                    String employeeName = jsonDecode(meResponse.body)['data']['attributes']['name'];
                    await sp.setStringList('me', 
                        [employeeName]);
                    Toast.success(context, 'Авторизация прошла успешно');
                    await auth.login(token);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false);
                    loading.setLoading(false);
                  }else{
                    print('houston we have a problem');
                    Toast.error(context, 'Что-то пошло не так');
                    loading.setLoading(false);
                  }
                }
              }),
          Observer(builder: (_) {
            return Positioned(
              child: loading.isLoading
                  ? QrLoading()
                  : SizedBox(
                      child: SvgPicture.asset(
                        '$kAssetIcons/qr_scanner.svg',
                      ),
                    ),
            );
          }),
        ],
      ),
    );
  }
}

