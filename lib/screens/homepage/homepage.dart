import 'package:acs_1/styles/acs_colors.dart';
import 'package:acs_1/styles/acs_typhoghraphy.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _images = [
      'assets/images/banner-1.jpg',
      'assets/images/promotion-1.png',
      'assets/images/slide-1.jpg',
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'Air Conditioner Service',
                    style: ACSTyphoghraphy.homeHeading,
                  ),
                ],
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 2),
                  aspectRatio: 2,
                ),
                itemCount: _images.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(24)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        _images[index],
                        height: 250,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Tất cả các dịch vụ',
                  style: ACSTyphoghraphy.homeHeading,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ACSColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ACSColors.secondaryText),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/ve-sinh.png',
                            height: 45, width: 45),
                        const SizedBox(height: 10),
                        const Text(
                          'Vệ sinh',
                          style: ACSTyphoghraphy.radioTitle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ACSColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ACSColors.secondaryText),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/sua-chua.png',
                            height: 45, width: 45),
                        const SizedBox(height: 10),
                        const Text(
                          'Sửa chữa',
                          style: ACSTyphoghraphy.radioTitle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ACSColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ACSColors.secondaryText),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/service-1.png',
                            height: 45, width: 45),
                        const SizedBox(height: 10),
                        const Text(
                          'Bảo trì',
                          style: ACSTyphoghraphy.radioTitle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Khuyến mãi',
                  style: ACSTyphoghraphy.homeHeading,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset('assets/images/banner-1.jpg'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset('assets/images/banner-3.jpg'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset('assets/images/banner-3.jpg'),
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
