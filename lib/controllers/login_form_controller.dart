import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormController extends GetxController {
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final isPasswordHidden = true.obs;

  String get email => emailC.text.trim();
  String get password => passC.text;

  void togglePassword() {
    isPasswordHidden.toggle();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
