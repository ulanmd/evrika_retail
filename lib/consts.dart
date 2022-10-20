import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

const kAssetIcons = 'assets/icons';

final kCalendarController =  CleanCalendarController(
  minDate: DateTime.now().subtract(const Duration(days: 365)),
  maxDate: DateTime.now(),
  onRangeSelected: (firstDate, secondDate) {},
  onDayTapped: (date) {},
  // readOnly: true,
  onPreviousMinDateTapped: (date) {},
  onAfterMaxDateTapped: (date) {},
  weekdayStart: DateTime.monday,
  initialFocusDate: DateTime.now(),
  // initialDateSelected: DateTime(2022, 3, 15),
  // endDateSelected: DateTime(2022, 3, 20),
);