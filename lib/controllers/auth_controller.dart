import 'package:car_wazz/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final firebaseUser = Rxn<User>();
  final isLoading = false.obs;

  @override
  void onInit() {
    firebaseUser.bindStream(_authService.authState());
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await _authService.login(email, password);
    } catch (e) {
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Login Failed",
            style: GoogleFonts.plusJakartaSans(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Please make sure a valid email or password",
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.red),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> register(
    String email,
    String password,
    String name,
    String confirm,
  ) async {
    try {
      isLoading.value = true;
      await _authService.register(email, password, name);
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Sign Up Success",
            style: GoogleFonts.plusJakartaSans(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Your account has been created",
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.lightGreen),
                ),
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Sign Up Failed",
            style: GoogleFonts.plusJakartaSans(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Please make sure a valid email or password",
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  foregroundColor: WidgetStateProperty.all(Colors.red),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() {
    return _authService.logout();
  }
}
