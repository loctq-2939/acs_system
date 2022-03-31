import 'package:acs_1/screens/build_nav_bar.dart';
import 'package:acs_1/screens/register/register.dart';
import 'package:acs_1/styles/acs_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ACSColors.background,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    const SizedBox(height: 0),
                    const Text(
                      'Chào mừng bạn đến với ACS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: ACSColors.primary),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Số điện thoại',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ACSColors.primary),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: 'Nhập số điện thoại',
                          labelStyle:
                              TextStyle(color: Color(0xf888888), fontSize: 15)),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Mật khẩu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ACSColors.primary),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: 'Nhập mật khẩu',
                          labelStyle:
                              TextStyle(color: Color(0xf888888), fontSize: 15)),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ACSColors.primary,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                        ),
                        onPressed: onSendClicked,
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: onRegisterClick,
                          child: const Text(
                            'Tạo tài khoản',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  void onSendClicked() {
    Get.to(() => const BuildBottomNavBar());
  }

  void onRegisterClick() {
    Get.to(() => const RegisterScreen());
  }
}
