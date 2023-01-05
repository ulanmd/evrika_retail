import 'package:evrika_retail/screens/completed_order_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

const kAssetIcons = 'assets/icons';

final kCalendarController =  CleanCalendarController(
  rangeMode: false,
  minDate: DateTime.now(),
  maxDate: DateTime.now().add(const Duration(days: 14)),
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

final kRangeCalendarController =  CleanCalendarController(
  minDate: DateTime.now().subtract(const Duration(days: 365)),
  maxDate: DateTime.now(),
  onRangeSelected: (firstDate, secondDate) {},
  onDayTapped: (date) {},
  onPreviousMinDateTapped: (date) {},
  onAfterMaxDateTapped: (date) {},
  weekdayStart: DateTime.monday,
  initialFocusDate: DateTime.now(),
  //initialDateSelected: DateTime.now()
   initialDateSelected: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  // endDateSelected: DateTime(2022, 3, 20),
);


final PageTransition saleDetail = PageTransition(
    type: PageTransitionType.bottomToTop, child: CompletedOrderScreen());