import 'package:acs_1/@share/router/pages.dart';
import 'package:acs_1/@share/utils/util.dart';
import 'package:acs_1/screens/appointment/appointment.controller.dart';
import 'package:acs_1/screens/history/history_detail.dart';
import 'package:acs_1/screens/order/order_detail.dart';
import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDetail extends GetWidget<AppointmentController> {
  const AppointmentDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ACSColors.background,
      appBar: AppBar(
        backgroundColor: ACSColors.primary,
        title:
            const Text('Chi tiết lịch hẹn', style: ACSTyphoghraphy.titleAppbar),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child:
                      Text('Trạng thái', style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => changeTextStatus(controller.appointment.value.status),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('Tên khách hàng',
                      style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      controller.appointment.value.fullName ?? '',
                      style: ACSTyphoghraphy.confirmSubTitle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('Số điện thoại',
                      style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      controller.appointment.value.phone ?? '',
                      style: ACSTyphoghraphy.confirmSubTitle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('Dịch vụ', style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      controller.appointment.value.description ?? '',
                      style: ACSTyphoghraphy.confirmSubTitle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('Số lượng', style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      controller.appointment.value.quantity.toString() ?? '',
                      style: ACSTyphoghraphy.confirmSubTitle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('Thời gian', style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      controller.appointment.value.time ?? '',
                      style: ACSTyphoghraphy.confirmSubTitle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('Ngày hẹn', style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      controller.appointment.value.date ?? '',
                      style: ACSTyphoghraphy.confirmSubTitle,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text('Địa chỉ', style: ACSTyphoghraphy.confirmTitle),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Text(
                      controller.appointment.value.address ?? '',
                      style: ACSTyphoghraphy.confirmSubTitle,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Obx(
          () => changeButtonByStatus(controller.appointment.value.status),
          // () => ElevatedButton(
          //   onPressed: changeStateButton(controller.appointment.value.status),
          //   child: const Text(
          //     'Hủy đơn',
          //     style: ACSTyphoghraphy.buttonTitle,
          //   ),
          //   style: ElevatedButton.styleFrom(
          //       primary: ACSColors.red,
          //       padding: const EdgeInsets.all(10),
          //       minimumSize: const Size(160, 48),
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10))),
          // ),
        ),
      ),
    );
  }

  ElevatedButton changeButtonByStatus(int? status) {
    if (status == 2) {
      return ElevatedButton(
        onPressed: () {
          goTo(screen: ROUTER_ORDER_DETAIL,argument: [controller.appointment.value]);
        },
        child: const Text(
          'Xem hóa đơn',
          style: ACSTyphoghraphy.buttonTitle,
        ),
        style: ElevatedButton.styleFrom(
            primary: ACSColors.primary,
            padding: const EdgeInsets.all(10),
            minimumSize: const Size(160, 48),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      );
    } else if (status == 1) {
      return ElevatedButton(
        onPressed: changeStateButton(controller.appointment.value.status),
        child: const Text(
          'Đóng',
          style: ACSTyphoghraphy.buttonTitle,
        ),
        style: ElevatedButton.styleFrom(
            primary: ACSColors.primary,
            padding: const EdgeInsets.all(10),
            minimumSize: const Size(160, 48),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      );
    } else if (status == 3) {
      return ElevatedButton(
        onPressed: changeStateButton(controller.appointment.value.status),
        child: const Text(
          'Hủy lịch hẹn',
          style: ACSTyphoghraphy.buttonTitle,
        ),
        style: ElevatedButton.styleFrom(
            primary: ACSColors.primary,
            padding: const EdgeInsets.all(10),
            minimumSize: const Size(160, 48),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      );
    }
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'Xem hóa đơn',
        style: ACSTyphoghraphy.buttonTitle,
      ),
      style: ElevatedButton.styleFrom(
          primary: ACSColors.primary,
          padding: const EdgeInsets.all(10),
          minimumSize: const Size(160, 48),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  Text changeTextStatus(int? status) {
    if (status == 1) {
      return Text(
        'Đã hủy',
        style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.red),
      );
    } else if (status == 2) {
      return Text(
        'Đã tiếp nhận',
        style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.blue),
      );
    } else if (status == 3) {
      return Text(
        'Đang chờ',
        style: ACSTyphoghraphy.appointmentDetail
            .copyWith(color: Colors.yellow.shade700),
      );
    }
    return Text(
      'Đã hoàn thành',
      style: ACSTyphoghraphy.appointmentDetail.copyWith(color: Colors.green),
    );
  }

  VoidCallback? changeStateButton(int? status) {
    if (status == 1) {
      return null;
    } else if (status == 2) {
      return null;
    }
    return () {
      controller.cancelAppointment(controller.appointment.value.id);
    };
  }
}
