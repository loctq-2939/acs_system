import 'package:acs_1/@share/router/pages.dart';
import 'package:acs_1/repository/models/appointment.dart';
import 'package:get/get.dart';

import '../../@share/utils/util.dart';
import '../../repository/models/Profile.dart';
import '../../repository/models/order.dart';
import '../../repository/models/order_history.dart';
import '../../repository/models/order_detail_.dart';
import '../../repository/repo/service.repo.dart';
import '../../repository/storage/data.storage.dart';

class OrderDetailController extends GetxController {

  var appointment = Appointment().obs;
  final _serviceRepo = Get.find<ServiceRepo>();

  var orderDetails = <OrderDetailX>[].obs;

  Order? order;

  @override
  void onReady() {
    appointment.value = Get.arguments[0];
    getOrderByAppointmentId();
    super.onReady();
  }

  getOrderByAppointmentId() async {
    var id = appointment.value.id;
    if (id != null) {
      showLoading();
      await _serviceRepo
          .getOrderByAppointmentId(appointmentId: id)
          .then((value) => {
        if (value != null) {
          order = value,
          getOrderDetailsByOrderId()
        }
        else
          showSnackBar(
              title: "Báo lỗi", content: "getOrderByAppointmentId Lỗi"),
        hideLoading()
      });
    }
  }

  getOrderDetailsByOrderId() async {
    var id = order?.id;
    if (id != null) {
      showLoading();
      await _serviceRepo
          .getOrderDetailsByOrderId(orderId: id)
          .then((value) => {
        if (value != null)
          orderDetails.value = value
        else
          showSnackBar(
              title: "Báo lỗi", content: "getOrderDetailsByOrderId Lỗi"),
        hideLoading()
      });
    }
  }

  acceptOrderDetail(int? id) async {
    if (id != null) {
      showLoading();
      await _serviceRepo
          .acceptOrderDetail(id: id)
          .then((value) => {
        if (value) {
          getOrderDetailsByOrderId(),
          goBack()
        }
        else
          showSnackBar(
              title: "Báo lỗi", content: "acceptOrderDetail Lỗi"),
        hideLoading()
      });
    }
  }

  denyOrderDetail(int? id) async {
    if (id != null) {
      showLoading();
      await _serviceRepo
          .denyOrderDetail(id: id)
          .then((value) => {
        if (value) {
          getOrderDetailsByOrderId(),
          goBack()
        }
        else
          showSnackBar(
              title: "Báo lỗi", content: "denyOrderDetail Lỗi"),
        hideLoading()
      });
    }
  }

}
