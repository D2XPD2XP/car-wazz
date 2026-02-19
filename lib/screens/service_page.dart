import 'package:car_wazz/widgets/service_item.dart';
import 'package:car_wazz/widgets/service_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEEEE),
        title: Text(
          "Service",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    const ServiceSheet(),
                    isScrollControlled: true,
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 14),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFF0271BA),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add_rounded, color: Colors.white, size: 32),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 18),
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => ServiceItem(),
        ),
      ),
    );
  }
}
