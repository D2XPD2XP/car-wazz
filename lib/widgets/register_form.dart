import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/controllers/register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final authC = Get.find<AuthController>();
  final registerC = Get.put(RegisterFormController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
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
              controller: registerC.nameC,
              cursorColor: Color(0xFF0271BA),
              decoration: InputDecoration(
                hintText: 'Enter your username',
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
              controller: registerC.emailC,
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
                      controller: registerC.passC,
                      obscureText: registerC.isPasswordHidden.value,
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
                    onTap: registerC.togglePassword,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Icon(
                        registerC.isPasswordHidden.value == true
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
          SizedBox(height: 20),
          Text(
            'Confirm Password',
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
                      controller: registerC.confirmC,
                      obscureText: registerC.isConfirmsHidden.value,
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
                    onTap: registerC.toggleConfirm,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Icon(
                        registerC.isConfirmsHidden.value == true
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
            onTap: () async {
              await authC.register(
                registerC.email,
                registerC.password,
                registerC.name,
              );
            },
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xFF0271BA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Sign Up',
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
        ],
      ),
    );
  }
}
