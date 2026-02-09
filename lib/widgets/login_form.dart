import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/controllers/login_form_controller.dart';
import 'package:car_wazz/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final authC = Get.put(AuthController());
  final loginC = Get.put(LoginFormController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 16),
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFF7F8F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: loginC.emailC,
              cursorColor: Color(0xFF0271BA),
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF111111),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Password',
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 16),
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Color(0xFFF7F8F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: loginC.passC,
                      obscureText: loginC.isPasswordHidden.value,
                      cursorColor: Color(0xFF0271BA),
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF111111),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: loginC.togglePassword,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Icon(
                        loginC.isPasswordHidden.value == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Color(0xFF0271BA),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 40),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFF0271BA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.plusJakartaSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have and account? ",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(RegisterPage());
                },
                child: Text(
                  "Sign up",
                  style: GoogleFonts.plusJakartaSans(
                    color: Color(0xFF0271BA),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
