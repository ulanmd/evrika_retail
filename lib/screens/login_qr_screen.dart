import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;

class LoginQrScreen extends StatefulWidget {
  const LoginQrScreen({Key? key}) : super(key: key);

  @override
  State<LoginQrScreen> createState() => _LoginQrScreenState();
}

class _LoginQrScreenState extends State<LoginQrScreen> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Отсканируйте QR'),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
              allowDuplicates: false,
              controller: MobileScannerController(
                  facing: CameraFacing.back, torchEnabled: false),
              onDetect: (barcode, args) async{
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  final String code = barcode.rawValue!;
                  debugPrint('Barcode found! $code');
                  setState((){isLoading = true;});
                print(isLoading);
                  var response = await http.post(Uri.parse('https://a079-89-218-145-198.in.ngrok.io/api/v1/login/token'),
                    headers: {
                      "Accept": "application/json",
                    },
                    body: {
                    "token" : "${barcode.rawValue!}"
                    }
                  );

                  debugPrint('Response ${response.body}');
                  if(response.statusCode == 200){
                    setState((){isLoading = false;});
                    print(isLoading);
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  }
                }
              }),
          Positioned(
            child: isLoading ? Text('loading...') : SizedBox(
              child: SvgPicture.asset(
                '$kAssetIcons/qr_scanner.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
