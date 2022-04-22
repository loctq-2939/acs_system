import 'package:acs_1/repository/models/appointment.dart';
import 'package:get/get.dart';

import '../../@share/router/pages.dart';
import '../../@share/utils/util.dart';
import '../../repository/repo/service.repo.dart';
import '../build_nav_bar.dart';

class ConfirmBookingController extends GetxController {
  var appointment = Appointment().obs;
  final _serviceRepo = Get.find<ServiceRepo>();

  @override
  void onReady() {
    try {
      appointment.value = Get.arguments;
    } catch (e) {
      Get.log(e.toString());
    }
    super.onReady();
  }

  confirmBooking() async {
    showLoading();
    await _serviceRepo
        .createAppointment(appointment: appointment.value)
        .then((value) => {
              if (value)
                {
                  showSnackBar(
                      title: "Thông báo", content: "Booking thành công"),
                  goToAndRemoveAll(screen: ROUTER_NAVBAR)
                }
              else
                showSnackBar(
                    title: "Báo lỗi",
                    content: "Booking lỗi"),
              hideLoading()
            });
  }
}
