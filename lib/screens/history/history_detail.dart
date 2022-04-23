import 'package:acs_1/repository/models/order_detail_.dart';
import 'package:acs_1/screens/history/history.controller.dart';
import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetail extends GetWidget<HistoryController> {
  const HistoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ACSColors.background,
      appBar: AppBar(
        backgroundColor: ACSColors.primary,
        title:
            const Text('Chi tiết đơn hàng', style: ACSTyphoghraphy.titleAppbar),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Image.asset('assets/icons/close-square.png',
                height: 30, width: 30),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ACSColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Thông tin khách hàng',
                    style: ACSTyphoghraphy.confirmTitle.copyWith(
                      fontFamily: 'CrimsonPro-Bold',
                      fontSize: 20,
                      color: ACSColors.secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Divider(color: ACSColors.background, thickness: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Tên khách hàng',
                          style: ACSTyphoghraphy.title,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(
                            controller.orderHistory.value.fullName.toString(),
                            style: ACSTyphoghraphy.detail,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Số điện thoại',
                          style: ACSTyphoghraphy.title,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(
                            controller.orderHistory.value.phone.toString(),
                            style: ACSTyphoghraphy.detail,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Địa chỉ',
                          style: ACSTyphoghraphy.title,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(
                            controller.orderHistory.value.address.toString(),
                            style: ACSTyphoghraphy.detail,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ACSColors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '2. Nội dung sửa chữa',
                    style: ACSTyphoghraphy.confirmTitle.copyWith(
                      fontFamily: 'CrimsonPro-Bold',
                      fontSize: 20,
                      color: ACSColors.secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Divider(color: ACSColors.background, thickness: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child:
                            Text('Ngày sửa chữa', style: ACSTyphoghraphy.title),
                      ),
                      Expanded(
                        flex: 2,
                        child:
                        Obx(() => Text(controller.orderHistory.value.date.toString(), style: ACSTyphoghraphy.detail)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child:
                            Text('Tổng số máy', style: ACSTyphoghraphy.title),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(controller.orderHistory.value.quantity.toString(), style: ACSTyphoghraphy.detail)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('Tình trạng', style: ACSTyphoghraphy.title),
                      ),
                      Expanded(
                        flex: 2,
                        child: Obx(() => Text(
                            controller.orderHistory.value.description.toString(),
                            style: ACSTyphoghraphy.detail,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Nội dung', style: ACSTyphoghraphy.title),
                  const SizedBox(height: 10),

                  SizedBox(
                    child: Obx(() => ListView.builder(
                        itemCount: controller.orderDetails.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          OrderDetailX order = controller.orderDetails[index];
                          return ListTile(
                            title: Text(
                              order.serviceName.toString(),
                              style: ACSTyphoghraphy.detail
                                  .copyWith(color: ACSColors.text),
                              overflow: TextOverflow.clip,
                            ),
                            trailing: Text(
                              order.servicePrice.toString(),
                              style: ACSTyphoghraphy.detail
                                  .copyWith(color: ACSColors.secondaryText),
                              overflow: TextOverflow.clip,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // tổng cộng
                  const Divider(color: ACSColors.background, thickness: 2),
                  // Tổng giá được api trả về
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 2,
                        child: Text('Tổng cộng', style: ACSTyphoghraphy.detail),
                      ),
                      Expanded(
                        flex: 1,
                        child: Obx(() => Text(
                            controller.orderHistory.value.orderTotalPrice.toString(),
                            style: ACSTyphoghraphy.detail.copyWith(
                              color: const Color.fromRGBO(14, 151, 19, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text(
            'Đóng',
            style: ACSTyphoghraphy.buttonTitle,
          ),
          style: ElevatedButton.styleFrom(
              primary: ACSColors.primary,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}
