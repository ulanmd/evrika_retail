import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Отсканируйте QR'),
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              MobileScanner(
                  allowDuplicates: false,
                  controller: MobileScannerController(
                      facing: CameraFacing.back, torchEnabled: false),
                  onDetect: (barcode, args) {
                    if (barcode.rawValue == null) {
                      debugPrint('Failed to scan Barcode');
                    } else {
                      final String code = barcode.rawValue!;
                      debugPrint('Barcode found! $code');
                    }
                  }),
              Positioned(
                child: SizedBox(
                  child: SvgPicture.asset(
                    '$kAssetIcons/qr_scanner.svg',
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Найдено:'),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Placeholder(
                          fallbackWidth: 50,
                          fallbackHeight: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'iPhone 14 Pro Max 1Tb',
                              style: EvrikaTextStyles.darkS15W600,
                            ),
                            PriceLabel(
                              price: '1 000 000',
                              fontSize: 15,
                            )
                          ],
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset('$kAssetIcons/plus.svg'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
