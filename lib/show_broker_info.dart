import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/widgets/grey_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BrokerInfo extends StatelessWidget {
  const BrokerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [Text('Информация о брокере')],
          )
        ],
      ),
    );
  }
}

Future showBrokerInfoModal(context) {
  var width = MediaQuery.of(context).size.width;
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Center(
        child: Container(
          width: width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.only(bottom: 20.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, right: 15),
                          child: SvgPicture.asset(
                            '$kAssetIcons/close.svg',
                            color: EvrikaColors.kLabelGrey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Информация о брокере:',
                              style: EvrikaTextStyles.darkS15W500,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: GreyLabel(text: 'Статус брокера:')),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Одобрено',
                                  style: TextStyle(
                                      color: EvrikaColors.kSuccessColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1, child: GreyLabel(text: 'Банк:')),
                              Expanded(flex: 1, child: Text('Halyk Bank'))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1, child: GreyLabel(text: 'Период:')),
                              Expanded(flex: 1, child: Text('12 мес'))
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Divider(
                      height: 3,
                      color: EvrikaColors.boxShadowColor,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18, fontFamily: 'Nunito'),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: const Text(
                              "Закрыть",
                              style: TextStyle(height: 1, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
