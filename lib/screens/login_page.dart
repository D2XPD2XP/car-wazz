import 'package:car_wazz/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
