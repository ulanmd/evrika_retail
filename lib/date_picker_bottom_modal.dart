import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/evrika_colors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class DatePickerBottomModal extends StatelessWidget {
  const DatePickerBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: ScrollableCleanCalendar(
                  locale: 'ru',
                  calendarController: kCalendarController,
                  layout: Layout.BEAUTY,
                  calendarCrossAxisSpacing: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Выбрать период',
                      style: TextStyle(
                          color: EvrikaColors.kPrimaryColor, fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Очистить',
                      style: TextStyle(
                          color: Colors.red, fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Отмена',
                      style: TextStyle(
                          color: EvrikaColors.kPrimaryColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
