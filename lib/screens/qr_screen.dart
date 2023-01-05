import 'dart:convert';
import 'dart:io' show Platform;

import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/qr_loading_widget.dart';
import 'package:evrika_retail/state/loading.dart';
import 'package:evrika_retail/state/orderx.dart';
import 'package:evrika_retail/state/screens/search_qrx.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import '../config/evrika_colors.dart';
import '../models/item.dart';
import '../utils/http_requests.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchQrX = SearchQrX();
    final loading = Provider.of<Loading>(context, listen: false);
    final order = Provider.of<OrderX>(context, listen: false);
    loading.setLoading(false);
    return Scaffold(
      body: Observer(builder: (_) {
        return Stack(
          children: [
            Stack(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    !searchQrX.allow
                        ? MobileScanner(
                            allowDuplicates: false,
                            controller: MobileScannerController(
                                facing: CameraFacing.back, torchEnabled: false),
                            onDetect: (barcode, args) async {
                              if (barcode.rawValue == null) {
                                debugPrint('Failed to scan Barcode');
                              } else {
                                final String code = barcode.rawValue!;
                                if (Platform.isIOS) searchQrX.setAllow(true);
                                debugPrint('Barcode found! $code');
                                searchQrX.setIncorrectCode(false);
                                loading.setLoading(true);
                                var itemFromQr =
                                    await HttpRequests.getCategoryByQr(code);
                                if (itemFromQr.statusCode == 200) {
                                  Item item = Item.fromJson(
                                      jsonDecode(itemFromQr.body)['data']);
                                  searchQrX.setItemWasFound(true);
                                  searchQrX.setItem(item);
                                  print('from if');
                                } else {
                                  searchQrX.setIncorrectCode(true);
                                  searchQrX.setItemWasFound(false);
                                  print('from else');
                                }
                                loading.setLoading(false);
                                if (Platform.isIOS) searchQrX.setAllow(false);
                              }
                            })
                        : Container(),
                    Positioned(
                      child: !loading.isLoading
                          ? SvgPicture.asset(
                              '$kAssetIcons/qr_scanner.svg',
                            )
                          : Center(
                              child: QrLoading(),
                            ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: (searchQrX.itemWasFound && !loading.isLoading) &&
                          !searchQrX.incorrectCode
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 15, top: 15, bottom: 15, right: 5),
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
                                    Image.network(
                                      searchQrX.foundItem.attributes?.photo ??
                                          'fuck',
                                      width: 50,
                                      height: 50,
                                      errorBuilder:
                                          (context, exception, stackTrace) {
                                        return Placeholder(
                                          fallbackHeight: 50,
                                          fallbackWidth: 50,
                                          color: EvrikaColors.kPrimaryColor,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            searchQrX.foundItem.attributes
                                                    ?.fullName ??
                                                '',
                                            style: EvrikaTextStyles.darkS15W600,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          PriceLabel(
                                            price: '1 000 000',
                                            fontSize: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        order.addItem(searchQrX.foundItem);
                                        Navigator.pop(context);
                                      },
                                      child: SvgPicture.asset(
                                          '$kAssetIcons/plus.svg'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(20),
                          child: searchQrX.incorrectCode
                              ? Container(
                                  padding: EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15, right: 5),
                                  width: double.infinity * 0.8,
                                  decoration: BoxDecoration(
                                    color: EvrikaColors.kErrorColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    'Некорректный QR код! Попробуйте заново',
                                    style: EvrikaTextStyles.whiteS15W500,
                                  ),
                                )
                              : Container(),
                        ),
                )
              ],
            ),
            Positioned(
              top: 5,
              left: 5,
              child: SafeArea(
                  child: IconButton(
                icon: SvgPicture.asset('$kAssetIcons/back_btn_white.svg'),
                onPressed: () => Navigator.pop(context),
              )),
            )
          ],
        );
      }),
    );
  }
}
