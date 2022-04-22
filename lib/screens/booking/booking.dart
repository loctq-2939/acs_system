import 'package:acs_1/repository/models/date.dart';
import 'package:acs_1/repository/models/distric.dart';
import 'package:acs_1/repository/models/ward.dart';
import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../repository/models/city.dart';
import '../../repository/models/service.dart';
import 'booking.controller.dart';
import 'package:velocity_x/velocity_x.dart';

class BookingScreen extends GetWidget<BookingController> {
  const BookingScreen({Key? key}) : super(key: key);

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
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  useSafeArea: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Bạn xác nhận thoát khỏi giao diện đặt lịch?',
                        style: ACSTyphoghraphy.confirmHeading
                            .copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      insetPadding: const EdgeInsets.symmetric(horizontal: 22),
                      contentPadding: const EdgeInsets.all(16),
                      actionsPadding: const EdgeInsets.only(bottom: 16),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child:
                              Text('Hủy', style: ACSTyphoghraphy.buttonTitle),
                          style: ElevatedButton.styleFrom(
                            primary: ACSColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 5,
                            minimumSize: const Size(130, 42),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text('Đồng ý',
                              style: ACSTyphoghraphy.buttonTitle),
                          style: ElevatedButton.styleFrom(
                            primary: ACSColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 5,
                            minimumSize: const Size(130, 42),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Image.asset(
                'assets/icons/close-square.png',
                color: ACSColors.white,
                height: 40,
                width: 40,
              ),
            ),
          ],
          title: const Text('Đặt lịch', style: ACSTyphoghraphy.titleAppbar),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ACSColors.primary.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Text('1',
                            style: ACSTyphoghraphy.stepNumber,
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Địa chỉ',
                        style: ACSTyphoghraphy.stepTitle,
                      ),
                    ],
                  ),
                ),
                _thongTinDiaChi(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ACSColors.primary.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '2',
                          style: ACSTyphoghraphy.stepNumber,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Thông tin đơn hàng',
                        style: ACSTyphoghraphy.stepTitle,
                      ),
                    ],
                  ),
                ),
                _thongTinDonHang(),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: ACSColors.primary.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '3',
                          style: ACSTyphoghraphy.stepNumber,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Thông tin khách hàng',
                        style: ACSTyphoghraphy.stepTitle,
                      ),
                    ],
                  ),
                ),
                _thongTinKhachHang(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.donePage();
                    },
                    child: const Text('Xác nhận đặt lịch',
                        style: ACSTyphoghraphy.buttonTitle),
                    style: ElevatedButton.styleFrom(
                      primary: ACSColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      minimumSize: const Size(double.infinity, 42),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //  IntroductionScreen(
          //   key: controller.introKey,
          //   freeze: true,
          //   showBackButton: false,
          //   showNextButton: false,
          //   showDoneButton: false,
          //   animationDuration: 500,
          //   initialPage: 0,
          //   pages: [
          //     //Page 1
          //     PageViewModel(
          //       titleWidget: Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Container(
          //               padding: const EdgeInsets.all(10),
          //               decoration: BoxDecoration(
          //                 color: ACSColors.primary.withOpacity(0.8),
          //                 shape: BoxShape.circle,
          //               ),
          //               child: const Text(
          //                 '1',
          //                 style: ACSTyphoghraphy.stepNumber,
          //                 textAlign: TextAlign.center,
          //               ),
          //             ),
          //             const SizedBox(width: 10),
          //             const Text(
          //               'Thông tin đơn hàng',
          //               style: ACSTyphoghraphy.stepTitle,
          //             ),
          //           ],
          //         ),
          //       ),
          //       bodyWidget: _bookingFirst(),
          //     ),
          //     //Page 2
          //     PageViewModel(
          //       titleWidget: Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Container(
          //               padding: const EdgeInsets.all(10),
          //               decoration: BoxDecoration(
          //                 color: ACSColors.primary.withOpacity(0.8),
          //                 shape: BoxShape.circle,
          //               ),
          //               child: const Text(
          //                 '2',
          //                 style: ACSTyphoghraphy.stepNumber,
          //                 textAlign: TextAlign.center,
          //               ),
          //             ),
          //             const SizedBox(width: 10),
          //             const Text(
          //               'Địa chỉ',
          //               style: ACSTyphoghraphy.stepTitle,
          //             ),
          //           ],
          //         ),
          //       ),
          //       bodyWidget: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           const Padding(
          //             padding: EdgeInsets.only(left: 16, top: 16),
          //             child: Text('Chọn thành phố',
          //                 style: ACSTyphoghraphy.heading1),
          //           ),
          //           const SizedBox(height: 20),
          //           Container(
          //             margin: const EdgeInsets.symmetric(horizontal: 16),
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12, vertical: 2),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //               border: Border.all(color: ACSColors.primary, width: 1),
          //             ),
          //             child: DropdownButtonHideUnderline(
          //               child: DropdownButton<City>(
          //                 items: controller.listCity
          //                     .map((e) => buildMenuItemCity(e))
          //                     .toList(),
          //                 icon: Image.asset('assets/icons/arrow-down.png'),
          //                 elevation: 0,
          //                 isExpanded: true,
          //                 onChanged: (value) {
          //                   if (value != null) {
          //                     controller.citySelected.value = value;
          //                     controller.getListDistrict(value.id);
          //                     controller.districtSelected.value = District();
          //                   }
          //                 },
          //                 value: controller.citySelected.value.id != null
          //                     ? controller.citySelected.value
          //                     : null,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(height: 20),
          //           const Padding(
          //             padding: EdgeInsets.only(left: 16, top: 16),
          //             child: Text('Chọn Quận/ Huyện',
          //                 style: ACSTyphoghraphy.heading1),
          //           ),
          //           const SizedBox(height: 20),
          //           Container(
          //             margin: const EdgeInsets.symmetric(horizontal: 16),
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12, vertical: 2),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //               border: Border.all(color: ACSColors.primary, width: 1),
          //             ),
          //             child: DropdownButtonHideUnderline(
          //               child: DropdownButton<District>(
          //                 items: controller.listDistrict
          //                     .map((e) => buildMenuItemDistrict(e))
          //                     .toList(),
          //                 icon: Image.asset('assets/icons/arrow-down.png'),
          //                 elevation: 0,
          //                 isExpanded: true,
          //                 onChanged: (value) {
          //                   if (value != null) {
          //                     controller.districtSelected.value = value;
          //                     controller.getListWard(value.id);
          //                     controller.wardSelected.value = Ward();
          //                   }
          //                 },
          //                 value: controller.districtSelected.value.id != null
          //                     ? controller.districtSelected.value
          //                     : null,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(height: 20),
          //           const Padding(
          //             padding: EdgeInsets.only(left: 16, top: 16),
          //             child: Text('Chọn Phường/ Xã',
          //                 style: ACSTyphoghraphy.heading1),
          //           ),
          //           const SizedBox(height: 20),
          //           Container(
          //             margin: const EdgeInsets.symmetric(horizontal: 16),
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 12, vertical: 2),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(8),
          //               border: Border.all(color: ACSColors.primary, width: 1),
          //             ),
          //             child: DropdownButtonHideUnderline(
          //               child: DropdownButton<Ward>(
          //                 items: controller.listWard
          //                     .map((e) => buildMenuItemWard(e))
          //                     .toList(),
          //                 icon: Image.asset('assets/icons/arrow-down.png'),
          //                 elevation: 0,
          //                 isExpanded: true,
          //                 onChanged: (value) {
          //                   if (value != null) {
          //                     controller.wardSelected.value = value;
          //                   }
          //                 },
          //                 value: controller.wardSelected.value.id != null
          //                     ? controller.wardSelected.value
          //                     : null,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(height: 20),
          //           const Padding(
          //             padding: EdgeInsets.only(left: 16, top: 16),
          //             child: Text('Nhập số nhà, tên đường',
          //                 style: ACSTyphoghraphy.heading1),
          //           ),
          //           Container(
          //             margin: const EdgeInsets.symmetric(
          //                 horizontal: 16, vertical: 16),
          //             child: Form(
          //               key: controller.addressFormKey,
          //               child: TextFormField(
          //                 controller: controller.addressController,
          //                 validator: controller.validatorAddress,
          //                 decoration: InputDecoration(
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8),
          //                     borderSide: const BorderSide(
          //                         color: ACSColors.primary, width: 1),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //           footer(controller.nextSecondPage)
          //         ],
          //       ),
          //     ),
          //     //Page 3
          //     PageViewModel(
          //       titleWidget: Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Container(
          //               padding: const EdgeInsets.all(10),
          //               decoration: BoxDecoration(
          //                 color: ACSColors.primary.withOpacity(0.8),
          //                 shape: BoxShape.circle,
          //               ),
          //               child: const Text(
          //                 '3',
          //                 style: ACSTyphoghraphy.stepNumber,
          //                 textAlign: TextAlign.center,
          //               ),
          //             ),
          //             const SizedBox(width: 10),
          //             const Text(
          //               'Thông tin khách hàng',
          //               style: ACSTyphoghraphy.stepTitle,
          //             ),
          //           ],
          //         ),
          //       ),
          //       bodyWidget: Form(
          //         key: controller.infoUserFormKey,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Row(
          //               children: [
          //                 Expanded(
          //                   flex: 1,
          //                   child: Obx(
          //                     () => RadioListTile<bool>(
          //                       value: true,
          //                       groupValue: controller.isMale.value,
          //                       onChanged: (value) {
          //                         controller.isMale.value = value ?? false;
          //                       },
          //                       title: const Text('Anh',
          //                           style: ACSTyphoghraphy.radioTitle),
          //                     ),
          //                   ),
          //                 ),
          //                 Expanded(
          //                   flex: 1,
          //                   child: Obx(
          //                     () => RadioListTile<bool>(
          //                       value: false,
          //                       groupValue: controller.isMale.value,
          //                       onChanged: (value) {
          //                         controller.isMale.value = value ?? false;
          //                       },
          //                       title: const Text('Chị',
          //                           style: ACSTyphoghraphy.radioTitle),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const Padding(
          //               padding: EdgeInsets.only(left: 16, top: 16),
          //               child:
          //                   Text('Họ của bạn', style: ACSTyphoghraphy.heading1),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.symmetric(
          //                   horizontal: 16, vertical: 16),
          //               child: TextFormField(
          //                 validator: controller.validatorLastName,
          //                 controller: controller.lastNameController,
          //                 decoration: InputDecoration(
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8),
          //                     borderSide: const BorderSide(
          //                         color: ACSColors.primary, width: 1),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             const Padding(
          //               padding: EdgeInsets.only(left: 16, top: 16),
          //               child: Text('Tên của bạn',
          //                   style: ACSTyphoghraphy.heading1),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.symmetric(
          //                   horizontal: 16, vertical: 16),
          //               child: TextFormField(
          //                 validator: controller.validatorFirstName,
          //                 controller: controller.firstNameController,
          //                 decoration: InputDecoration(
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8),
          //                     borderSide: const BorderSide(
          //                         color: ACSColors.primary, width: 1),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             const Padding(
          //               padding: EdgeInsets.only(left: 16, top: 16),
          //               child: Text('Số điện thoại',
          //                   style: ACSTyphoghraphy.heading1),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.symmetric(
          //                   horizontal: 16, vertical: 16),
          //               child: TextFormField(
          //                 validator: controller.validatorPhone,
          //                 controller: controller.phoneController,
          //                 decoration: InputDecoration(
          //                   border: OutlineInputBorder(
          //                     borderRadius: BorderRadius.circular(8),
          //                     borderSide: const BorderSide(
          //                         color: ACSColors.primary, width: 1),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             footer(controller.donePage)
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          //   dotsDecorator: const DotsDecorator(
          //     size: Size.square(0),
          //     activeColor: Colors.transparent,
          //     color: Colors.transparent,
          //   ),
          //   next: const Text('Sau', style: ACSTyphoghraphy.buttonTitle),
          //   nextStyle: ElevatedButton.styleFrom(
          //     primary: ACSColors.primary,
          //     minimumSize: const Size(140, 42),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8)),
          //   ),
          //   done: const Text('Xong', style: ACSTyphoghraphy.buttonTitle),
          //   doneStyle: ElevatedButton.styleFrom(
          //     primary: ACSColors.primary,
          //     minimumSize: const Size(140, 42),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8)),
          //   ),
          //   back: const Text('Trước', style: ACSTyphoghraphy.buttonTitle),
          //   backStyle: ElevatedButton.styleFrom(
          //     primary: ACSColors.primary,
          //     minimumSize: const Size(140, 42),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(8)),
          //   ),
          //   onDone: () => Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => ConfirmBooking())),
          // ),
        ),
      ),
    );
  }

  Widget _thongTinKhachHang() {
    return SizedBox(
      child: Form(
        key: controller.infoUserFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text('Họ của bạn', style: ACSTyphoghraphy.heading1),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                validator: controller.validatorLastName,
                controller: controller.lastNameController,
                decoration: InputDecoration(
                  hintText: 'Nhập họ của bạn',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ACSColors.primary, width: 1),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text('Tên của bạn', style: ACSTyphoghraphy.heading1),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                validator: controller.validatorFirstName,
                controller: controller.firstNameController,
                decoration: InputDecoration(
                  hintText: 'Nhập tên của bạn',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ACSColors.primary, width: 1),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text('Số điện thoại', style: ACSTyphoghraphy.heading1),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: TextFormField(
                validator: controller.validatorPhone,
                controller: controller.phoneController,
                decoration: InputDecoration(
                  hintText: 'Nhập số điện thoại',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ACSColors.primary, width: 1),
                  ),
                ),
              ),
            ),
            // footer(controller.donePage)
          ],
        ),
      ),
    );
  }

  Widget _thongTinDiaChi() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Tỉnh/Thành phố', style: ACSTyphoghraphy.heading1),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ACSColors.primary, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<City>(
                items: controller.listCity
                    .map((e) => buildMenuItemCity(e))
                    .toList(),
                icon: Image.asset('assets/icons/arrow-down.png'),
                elevation: 0,
                isExpanded: true,
                hint: const Text("Chọn Tỉnh/Thành phố",
                    style: ACSTyphoghraphy.heading1),
                onChanged: (value) {
                  if (value != null) {
                    controller.citySelected.value = value;
                    controller.getListDistrict(value.id);
                    controller.districtSelected.value = District();
                  }
                },
                value: controller.citySelected.value.id != null
                    ? controller.citySelected.value
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Quận/ Huyện', style: ACSTyphoghraphy.heading1),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ACSColors.primary, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<District>(
                items: controller.listDistrict
                    .map((e) => buildMenuItemDistrict(e))
                    .toList(),
                icon: Image.asset('assets/icons/arrow-down.png'),
                elevation: 0,
                isExpanded: true,
                hint: const Text("Chọn Quận/Huyện",
                    style: ACSTyphoghraphy.heading1),
                onChanged: (value) {
                  if (value != null) {
                    controller.districtSelected.value = value;
                    controller.getListWard(value.id);
                    controller.wardSelected.value = Ward();
                  }
                },
                value: controller.districtSelected.value.id != null
                    ? controller.districtSelected.value
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Phường/ Xã', style: ACSTyphoghraphy.heading1),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ACSColors.primary, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Ward>(
                items: controller.listWard
                    .map((e) => buildMenuItemWard(e))
                    .toList(),
                icon: Image.asset('assets/icons/arrow-down.png'),
                elevation: 0,
                isExpanded: true,
                hint: const Text("Chọn Phường/Xã",
                    style: ACSTyphoghraphy.heading1),
                onChanged: (value) {
                  if (value != null) {
                    controller.wardSelected.value = value;
                    controller.getAvailableSlot(value.id , controller.dateSelected.value.value);
                  }
                },
                value: controller.wardSelected.value.id != null
                    ? controller.wardSelected.value
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Địa chỉ', style: ACSTyphoghraphy.heading1),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Form(
              key: controller.addressFormKey,
              child: TextFormField(
                controller: controller.addressController,
                validator: controller.validatorAddress,
                decoration: InputDecoration(
                  hintText: 'Nhập số nhà và tên đường',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: ACSColors.primary, width: 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _thongTinDonHang() {
    return Form(
      key: controller.firstPageFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Nhập số lượng máy
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Số lượng máy', style: ACSTyphoghraphy.heading1),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              controller: controller.amountController,
              validator: controller.validatorAmount,
              decoration: InputDecoration(
                hintText: 'Nhập số lượng máy',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: ACSColors.primary, width: 1),
                ),
              ),
            ),
          ),
          //Thời gian sửa chữa dự kiến
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Thời gian sửa chữa dự kiến',
                style: ACSTyphoghraphy.heading1),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ACSColors.primary, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<DateObject>(
                items: controller.listDate
                    .map((e) => buildMenuItemDate(e))
                    .toList(),
                icon: Image.asset('assets/icons/arrow-down.png'),
                elevation: 0,
                isExpanded: true,
                hint: const Text("Chọn ngày", style: ACSTyphoghraphy.heading1),
                onChanged: (value) {
                  if (value != null) {
                    controller.dateSelected.value = value;
                    controller.getAvailableSlot(controller.wardSelected.value.id , value.value);
                  }
                },
                value: controller.dateSelected.value.id != null
                    ? controller.dateSelected.value
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ACSColors.primary, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: controller.listHour
                    .map((e) => buildMenuItem2(e))
                    .toList(),
                icon: Image.asset('assets/icons/arrow-down.png'),
                elevation: 0,
                isExpanded: true,
                hint: const Text("Chọn giờ", style: ACSTyphoghraphy.heading1),
                onChanged: (value) {
                  controller.hourSelected.value = value ?? "";
                },
                value: controller.hourSelected.value.isEmptyOrNull ? null : controller.hourSelected.value,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Thông tin máy bị như thế nào
          const Padding(
            padding: EdgeInsets.only(left: 16, bottom: 10),
            child: Text('Ghi chú', style: ACSTyphoghraphy.heading1),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              controller: controller.descriptionController,
              validator: controller.validatorDescription,
              minLines: 4,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Miêu tả tình trạng máy của bạn',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: ACSColors.primary, width: 1),
                ),
              ),
            ),
          ),

          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 16),
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     border: Border.all(color: ACSColors.primary, width: 1),
          //   ),
          //   child: DropdownButtonHideUnderline(
          //     child: DropdownButton<Service>(
          //       items: controller.listServices
          //           .map((e) => buildMenuItem1(e))
          //           .toList(),
          //       icon: Image.asset('assets/icons/arrow-down.png'),
          //       elevation: 0,
          //       isExpanded: true,
          //       value: controller.serviceSelected.value.id != null
          //           ? controller.serviceSelected.value
          //           : null,
          //       onChanged: (value) {
          //         if (value != null) {
          //           controller.serviceSelected.value = value;
          //         }
          //       },
          //     ),
          //   ),
          // ),

          // footer(controller.nextFirstPage)
        ],
      ),
    );
  }

  DropdownMenuItem<Service> buildMenuItem1(Service item) => DropdownMenuItem(
        child: Text(item.name ?? '', style: ACSTyphoghraphy.heading1),
        value: item,
      );

  DropdownMenuItem<City> buildMenuItemCity(City item) => DropdownMenuItem(
        child: Text(item.name ?? '', style: ACSTyphoghraphy.heading1),
        value: item,
      );

  DropdownMenuItem<District> buildMenuItemDistrict(District item) =>
      DropdownMenuItem(
        child: Text(item.name ?? '', style: ACSTyphoghraphy.heading1),
        value: item,
      );

  DropdownMenuItem<Ward> buildMenuItemWard(Ward item) => DropdownMenuItem(
        child: Text(item.name ?? '', style: ACSTyphoghraphy.heading1),
        value: item,
      );

  DropdownMenuItem<DateObject> buildMenuItemDate(DateObject item) =>
      DropdownMenuItem(
        child: Text(item.value ?? '', style: ACSTyphoghraphy.heading1),
        value: item,
      );

  DropdownMenuItem<String> buildMenuItem2(String item) => DropdownMenuItem(
        child: Text(item, style: ACSTyphoghraphy.heading1),
        value: item,
      );

  Widget footer(VoidCallback? functionNext) => Row(children: [
        const Text("Trước", style: ACSTyphoghraphy.buttonTitle)
            .box
            .withDecoration(BoxDecoration(
                color: ACSColors.primary,
                borderRadius: BorderRadius.circular(8)))
            .padding(const EdgeInsets.symmetric(vertical: 15, horizontal: 50))
            .make()
            .onTap(() {
          controller.backPage();
        }),
        const Text("Sau", style: ACSTyphoghraphy.buttonTitle)
            .box
            .withDecoration(BoxDecoration(
                color: ACSColors.primary,
                borderRadius: BorderRadius.circular(8)))
            .padding(const EdgeInsets.symmetric(vertical: 15, horizontal: 50))
            .make()
            .onTap(() {
          if (functionNext != null) functionNext();
        }),
      ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
          .marginSymmetric(vertical: 50);
}

class BookingData {
  static final times = ['Chọn giờ', '10:30', '11:30', '14:30'];
}
