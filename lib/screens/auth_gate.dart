import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/screens/login_page.dart';
import 'package:car_wazz/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthGate extends StatelessWidget {
  AuthGate({super.key});

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authC.firebaseUser.value == null) {
        return LoginPage();
      }
      return MainPage();
    });
  }
}
