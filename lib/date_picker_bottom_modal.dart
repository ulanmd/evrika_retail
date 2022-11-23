import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class DatePickerBottomModal extends StatelessWidget {
  const DatePickerBottomModal({Key? key, required this.isRange}) : super(key: key);

  final bool isRange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              children: [
                Text(
                  'Выберите дату',
                  style: TextStyle(color: EvrikaColors.darkColor, fontSize: 20),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  //style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: SvgPicture.asset(
                    '$kAssetIcons/close.svg',
                    color: EvrikaColors.kLabelGrey,
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: ScrollableCleanCalendar(
                      padding: EdgeInsets.only(
                          left: 10, top: 10, right: 10, bottom: 0),
                      locale: 'ru',
                      spaceBetweenMonthAndCalendar: 10,
                      calendarController: isRange ? kRangeCalendarController : kCalendarController,
                      layout: Layout.BEAUTY,
                      calendarCrossAxisSpacing: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Очистить',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Spacer(),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: const Text(
                        //     'Отмена',
                        //     style: TextStyle(
                        //       color: EvrikaColors.kPrimaryColor,
                        //       fontSize: 15,
                        //
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          width: 197,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cохранить',
                              // style: TextStyle(
                              //     color: EvrikaColors.kPrimaryColor, fontSize: 18),
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
        ],
      ),
    );
  }
}
