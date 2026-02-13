import 'package:car_wazz/widgets/income_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Container(
        margin: EdgeInsets.only(),
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF0271BA),
          child: Icon(Icons.add, size: 40, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 28, right: 28, top: 68),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, DZ Carwash!",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Happy washy wash!",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 18),
            Row(children: [IncomeCard()]),
          ],
        ),
      ),
    );
  }
}
