import 'package:car_wazz/widgets/employee_item.dart';
import 'package:car_wazz/widgets/employee_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Employee",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(),
        height: 60,
        width: 60,
        child: FloatingActionButton(
          heroTag: 'employeeFab',
          onPressed: () {
            Get.bottomSheet(const EmployeeSheet(), isScrollControlled: true);
          },
          backgroundColor: const Color(0xFF0271BA),
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 40, color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 18),
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => EmployeeItem(),
        ),
      ),
    );
  }
}
