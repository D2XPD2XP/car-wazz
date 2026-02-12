import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authC.isLoading.value) {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(color: Color(0xFF0271BA)),
          ),
        );
      }

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Sign Up",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 76, right: 76),
                child: Image.asset(
                  'assets/logo_only.png',
                  width: 259,
                  height: 183,
                ),
              ),
              RegisterForm(),
            ],
          ),
        ),
      );
    });
  }
}
