import 'package:acs_1/screens/appointment/appointment.controller.dart';
import 'package:acs_1/screens/appointment/appointment_detail.dart';
import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class AppointmentScreen extends GetWidget<AppointmentController> {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ACSColors.background,
        appBar: AppBar(
          backgroundColor: ACSColors.primary,
          title: const Text('Lịch hẹn', style: ACSTyphoghraphy.titleAppbar),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.listAppointment.value.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          controller.appointment.value =
                              controller.listAppointment[index];
                          Get.to(
                            () => const AppointmentDetail(),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 20),
                          padding: const EdgeInsets.all(16),
                          height: 130,
                          decoration: BoxDecoration(
                            color: ACSColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: ACSColors.primary, width: 1),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text('Dịch vụ',
                                        style:
                                            ACSTyphoghraphy.appointmentTitle),
                                    SizedBox(height: 8),
                                    Text('Trạng thái',
                                        style:
                                            ACSTyphoghraphy.appointmentTitle),
                                    SizedBox(height: 8),
                                    Text('Thời gian',
                                        style:
                                            ACSTyphoghraphy.appointmentTitle),
                                    SizedBox(height: 8),
                                    Text('Ngày',
                                        style:
                                            ACSTyphoghraphy.appointmentTitle),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.listAppointment[index]
                                                .description ??
                                            '',
                                        style:
                                            ACSTyphoghraphy.appointmentDetail,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Obx(() => changeTextStatus(controller
                                        .listAppointment[index].status)),
                                    const SizedBox(height: 8),
                                    Obx(
                                      () => Text(
                                          controller.listAppointment[index]
                                                  .time ??
                                              '',
                                          style: ACSTyphoghraphy
                                              .appointmentDetail),
                                    ),
                                    const SizedBox(height: 8),
                                    Obx(
                                      () => Text(
                                          Jiffy(controller
                                                      .listAppointment[index]
                                                      .date)
                                                  .format('dd-MM-yyyy') ??
                                              '',
                                          style: ACSTyphoghraphy
                                              .appointmentDetail),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Text(
          item,
          style: ACSTyphoghraphy.heading1,
        ),
        value: item,
      );

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
}
