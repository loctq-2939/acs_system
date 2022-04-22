import 'package:acs_1/screens/confirmbooking/confirm_booking.controller.dart';
import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmBooking extends GetWidget<ConfirmBookingController> {
  const ConfirmBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ACSColors.background,
        appBar: AppBar(
          backgroundColor: ACSColors.primary,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Xác nhận đặt lịch',
            style: ACSTyphoghraphy.titleAppbar,
          ),
        ),
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ACSColors.white,
                  border: Border.all(color: ACSColors.primary, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: ACSColors.secondaryText.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                    BoxShadow(
                      color: ACSColors.secondaryText.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1. Thông tin khách hàng',
                      style: ACSTyphoghraphy.confirmHeading,
                    ),
                    const Divider(
                        color: ACSColors.secondaryText,
                        thickness: 0.5,
                        height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Tên khách hàng',
                            style: ACSTyphoghraphy.confirmTitle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                              controller.appointment.value.fullName ?? '',
                              style: ACSTyphoghraphy.confirmSubTitle),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Số điện thoại',
                            style: ACSTyphoghraphy.confirmTitle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(controller.appointment.value.phone ?? '',
                              style: ACSTyphoghraphy.confirmSubTitle),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Địa chỉ',
                            style: ACSTyphoghraphy.confirmTitle,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                              controller.appointment.value.address ?? '',
                              style: ACSTyphoghraphy.confirmSubTitle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ACSColors.white,
                  border: Border.all(color: ACSColors.primary, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: ACSColors.secondaryText.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                    BoxShadow(
                      color: ACSColors.secondaryText.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '2. Thông tin dịch vụ',
                      style: ACSTyphoghraphy.confirmHeading,
                    ),
                    const Divider(
                        color: ACSColors.secondaryText,
                        thickness: 0.5,
                        height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Loại dịch vụ',
                            style: ACSTyphoghraphy.confirmTitle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                              controller.appointment.value.description ?? '',
                              style: ACSTyphoghraphy.confirmSubTitle),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Thời gian',
                            style: ACSTyphoghraphy.confirmTitle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(controller.appointment.value.time ?? '',
                              style: ACSTyphoghraphy.confirmSubTitle),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            'Ngày hẹn',
                            style: ACSTyphoghraphy.confirmTitle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                              controller.appointment.value.date.toString() ??
                                  '',
                              style: ACSTyphoghraphy.confirmSubTitle),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Quay lại',
                        style: ACSTyphoghraphy.buttonTitle),
                    style: ElevatedButton.styleFrom(
                      primary: ACSColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 5,
                      minimumSize: const Size(142, 42),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.confirmBooking(),
                    child: const Text('Xác nhận',
                        style: ACSTyphoghraphy.buttonTitle),
                    style: ElevatedButton.styleFrom(
                      primary: ACSColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 5,
                      minimumSize: const Size(142, 42),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
