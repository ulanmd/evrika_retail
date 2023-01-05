import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/modal_control_line_widget.dart';
import 'package:evrika_retail/modal_divider_widget.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class DatePickerBottomModal extends StatelessWidget {
  const DatePickerBottomModal(
      {Key? key, required this.isRange, required this.height})
      : super(key: key);

  final bool isRange;
  final double height;

  @override
  Widget build(BuildContext context) {
    print('height ' + MediaQuery.of(context).size.height.toString());
    print('height view ' + MediaQuery.of(context).padding.top.toString());
    print(height);
    return SizedBox(
      height: MediaQuery.of(context).size.height - height,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ModalControlLine(),
          SizedBox(
            height: 15,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                  child: Text(
                'Выберите дату',
                style: EvrikaTextStyles.darkS20W600,
              )),
              Positioned(
                  right: 20,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Очистить',
                      style: EvrikaTextStyles.primaryS16W600,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ModalDivider(),
          //  SizedBox(height: 20,),
          Expanded(
            child: ScrollableCleanCalendar(
              padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
              locale: 'ru',
              spaceBetweenMonthAndCalendar: 10,
              calendarController:
                  isRange ? kRangeCalendarController : kCalendarController,
              layout: Layout.BEAUTY,
              calendarCrossAxisSpacing: 0,
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: ElevatedButton(
              onPressed: () {Navigator.pop(context);},
              child: Text('Выбрать'),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
