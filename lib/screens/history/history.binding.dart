import 'package:acs_1/repository/repo/service.repo.dart';
import 'package:acs_1/screens/order/order_detail.controller.dart';
import 'package:get/get.dart';

import '../../repository/apis/service.api.dart';
import '../../repository/storage/data.storage.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataStorage());
    Get.lazyPut(() => ServiceApi());
    Get.put(ServiceRepo(Get.find()));
    Get.put(OrderDetailController());
  }
}