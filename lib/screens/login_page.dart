import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 120, left: 76, right: 76),
                child: Image.asset(
                  'assets/logo_only.png',
                  width: 259,
                  height: 183,
                ),
              ),
              Text(
                'Welcome to CarWazz!',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'Your simple carwash dashboard',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 42),
              LoginForm(),
            ],
          ),
        ),
      );
    });
  }
}
