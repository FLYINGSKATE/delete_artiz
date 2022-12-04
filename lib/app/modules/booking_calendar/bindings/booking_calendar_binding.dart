import 'package:get/get.dart';

import '../controllers/booking_calendar_controller.dart';


class BookingCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingCalendarController>(
      () => BookingCalendarController(),
    );
  }
}
