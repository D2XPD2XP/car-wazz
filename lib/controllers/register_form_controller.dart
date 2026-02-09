import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  final confirmC = TextEditingController();
  final isPasswordHidden = true.obs;
  final isConfirmsHidden = true.obs;

  String get name => nameC.text.trim();
  String get email => emailC.text.trim();
  String get password => passC.text;
  String get confirm => confirmC.text;

  void togglePassword() {
    isPasswordHidden.toggle();
  }

  void toggleConfirm() {
    isConfirmsHidden.toggle();
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
    confirmC.dispose();
    super.onClose();
  }
}
