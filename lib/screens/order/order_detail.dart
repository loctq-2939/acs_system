import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatelessWidget {
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
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Tên khách hàng',
                          style: ACSTyphoghraphy.title,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Chị Uyên',
                          style: ACSTyphoghraphy.detail,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Số điện thoại',
                          style: ACSTyphoghraphy.title,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          '0378285566',
                          style: ACSTyphoghraphy.detail,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Địa chỉ',
                          style: ACSTyphoghraphy.title,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Số 123 đường S11 - Phường An Lạc - Quận Bình Tân',
                          style: ACSTyphoghraphy.detail,
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
                    children: const [
                      Expanded(
                        flex: 2,
                        child:
                            Text('Ngày sửa chữa', style: ACSTyphoghraphy.title),
                      ),
                      Expanded(
                        flex: 2,
                        child:
                            Text('07/01/2022', style: ACSTyphoghraphy.detail),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child:
                            Text('Tổng số máy', style: ACSTyphoghraphy.title),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('4', style: ACSTyphoghraphy.detail),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: Text('Tình trạng', style: ACSTyphoghraphy.title),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Hư bộ phận bơm ga, bụi bẩn',
                          style: ACSTyphoghraphy.detail,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text('Nội dung', style: ACSTyphoghraphy.title),
                  const SizedBox(height: 10),
                  ListTile(
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
                  ),
                  SizedBox(
                    child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
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
                                                text: 'Thay linh kiện',
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
                                                text: '300.000VNĐ',
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
                                                text: 'Thay dây đồng loại 1',
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
                                              onPressed: () {},
                                              child: Text('Từ chối'),
                                            ),
                                            TextButton(
                                              onPressed: () {},
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
                          },
                          title: Text(
                            'Thay linh kiện',
                            style: ACSTyphoghraphy.detail
                                .copyWith(color: ACSColors.text),
                            overflow: TextOverflow.clip,
                          ),
                          trailing: Text(
                            'Chờ xác nhận',
                            style: ACSTyphoghraphy.detail
                                .copyWith(color: ACSColors.secondaryText),
                            overflow: TextOverflow.clip,
                          ),
                        );
                      },
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
