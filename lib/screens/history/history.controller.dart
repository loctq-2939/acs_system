
import 'package:acs_1/repository/models/order_history.dart';
import 'package:get/get.dart';

import '../../@share/utils/util.dart';
import '../../repository/models/Profile.dart';
import '../../repository/models/order_detail_.dart';
import '../../repository/repo/service.repo.dart';
import '../../repository/storage/data.storage.dart';

class HistoryController extends GetxController {
  var listOrder = <OrderHistory>[].obs;

  final _serviceRepo = Get.find<ServiceRepo>();
  final _dataStorage = Get.find<DataStorage>();

  var orderHistory = OrderHistory().obs;

  var orderDetails = <OrderDetailX>[].obs;

  @override
  void onReady() {
    getAppointmentByCusId();
    super.onReady();
  }

  getAppointmentByCusId() async {
    Profile? profile = _dataStorage.getToken();
    if (profile != null) {
      showLoading();
      await _serviceRepo
          .getCompletedOrderByCusId(customer: profile.id ?? 0)
          .then((value) => {
        if (value != null)
          listOrder.value = value
        else
          showSnackBar(
              title: "Báo lỗi", content: "getAppointmentByCusId Lỗi"),
        hideLoading()
      });
    }
  }

  getOrderDetailsByOrderId(int? id) async {
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

}