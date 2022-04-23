import 'package:acs_1/@share/router/pages.dart';
import 'package:acs_1/screens/booking/booking.binding.dart';
import 'package:acs_1/screens/booking/booking.dart';
import 'package:acs_1/screens/build_nav_bar.binding.dart';
import 'package:acs_1/screens/build_nav_bar.dart';
import 'package:acs_1/screens/confirmbooking/confirm_booking.binding.dart';
import 'package:acs_1/screens/login/login.screen.dart';
import 'package:acs_1/screens/order/order_detail.binding.dart';
import 'package:acs_1/screens/order/order_detail.dart';
import 'package:acs_1/screens/register/register.binding.dart';
import 'package:acs_1/screens/register/register.screen.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../screens/confirmbooking/confirm_booking.dart';
import '../../screens/login/login.binding.dart';

class Routers {
  static final route = [
    GetPage(name: ROUTER_LOGIN, page: () => const LoginScreen(), binding: LoginBinding()),
    GetPage(name: ROUTER_REGISTER, page: () => const RegisterScreen(), binding: RegisterBinding()),
    GetPage(name: ROUTER_BOOKING, page: () => const BookingScreen(), binding: BookingBinding()),
    GetPage(name: ROUTER_CONFIRM_BOOKING, page: () => const ConfirmBooking(), binding: ConfirmBookingBinding()),
    GetPage(name: ROUTER_CONFIRM_BOOKING, page: () => const ConfirmBooking(), binding: ConfirmBookingBinding()),
    GetPage(name: ROUTER_NAVBAR, page: () => const BuildBottomNavBar(), binding: NavBarBinding()),
    GetPage(name: ROUTER_ORDER_DETAIL, page: () => const OrderDetailScreen(), binding: OrderDetailBinding()),
  ];
}
