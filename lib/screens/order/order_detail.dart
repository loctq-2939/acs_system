import 'package:acs_1/repository/models/order_history.dart';
import 'package:acs_1/screens/order/order_detail.controller.dart';
import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/models/order_detail_.dart';

class OrderDetailScreen extends GetWidget<OrderDetailController> {
  const OrderDetailScreen({Key? key}) : super(key: key);

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
                            controller.appointment.value.fullName ?? '',
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
                            controller.appointment.value.phone ?? '',
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
                        child: Obx(() =>  Text(
                            controller.appointment.value.address ?? '',
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
                        Obx(() =>  Text(controller.appointment.value.date ?? '', style: ACSTyphoghraphy.detail)),
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
                        child: Obx(() => Text(controller.appointment.value.quantity.toString(), style: ACSTyphoghraphy.detail)),
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
                        child: Obx(() =>  Text(
                            controller.appointment.value.description ?? '',
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
/*                  ListTile(
                    title: Text(
                      'Kiểm tra máy',
                      style: ACSTyphoghraphy.detail
                          .copyWith(color: ACSColors.text),
                      overflow: TextOverflow.clip,
                    ),
                    trailing: Text(
                      '150.000 VNĐ',
                      style: ACSTyphoghraphy.detail
                          .copyWith(color: ACSColors.secondaryText),
                      overflow: TextOverflow.clip,
                    ),
                  ),*/
                  SizedBox(
                    child: Obx(() => ListView.builder(
                        itemCount: controller.orderDetails.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          OrderDetailX detail = controller.orderDetails[index];
                          if(detail.status == 3 || detail.status == 4) {
                            return ListTile(
                              onTap: () {
                                if(detail.status != 4){
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          height: 180,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Loại dịch vụ: ',
                                                  style: ACSTyphoghraphy
                                                      .appointmentTitle
                                                      .copyWith(
                                                    color: Colors.black54,
                                                    fontSize: 18,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: detail.serviceName,
                                                      style: ACSTyphoghraphy
                                                          .appointmentDetail
                                                          .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Giá tiền: ',
                                                  style: ACSTyphoghraphy
                                                      .appointmentTitle
                                                      .copyWith(
                                                    color: Colors.black54,
                                                    fontSize: 18,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: detail.servicePrice.toString(),
                                                      style: ACSTyphoghraphy
                                                          .appointmentDetail
                                                          .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Miêu tả: ',
                                                  style: ACSTyphoghraphy
                                                      .appointmentTitle
                                                      .copyWith(
                                                    color: Colors.black54,
                                                    fontSize: 18,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: detail.description,
                                                      style: ACSTyphoghraphy
                                                          .appointmentDetail
                                                          .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 18,
                                                        overflow: TextOverflow.clip,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextButton(
                                                    onPressed: () => controller.denyOrderDetail(detail.id),
                                                    child: Text('Từ chối'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () => controller.acceptOrderDetail(detail.id),
                                                    child: Text('Đồng ý'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              title: Text(
                                detail.serviceName ?? '',
                                style: ACSTyphoghraphy.detail
                                    .copyWith(color: ACSColors.text),
                                overflow: TextOverflow.clip,
                              ),
                              trailing: Text(
                                detail.status == 4 ? detail.servicePrice.toString() : 'Chờ xác nhận',
                                style: ACSTyphoghraphy.detail
                                    .copyWith(color: ACSColors.secondaryText),
                                overflow: TextOverflow.clip,
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
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
