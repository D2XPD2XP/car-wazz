import 'package:car_wazz/controllers/employee_controller.dart';
import 'package:car_wazz/widgets/employee_item.dart';
import 'package:car_wazz/widgets/employee_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeePage extends StatelessWidget {
  EmployeePage({super.key});

  final employeeC = Get.find<EmployeeController>();

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
            Get.bottomSheet(
              EmployeeSheet(onAdd: employeeC.createEmployee),
              isScrollControlled: true,
            );
          },
          backgroundColor: const Color(0xFF0271BA),
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 40, color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (employeeC.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF0271BA)),
          );
        }

        if (employeeC.employees.isEmpty) {
          return Center(
            child: Text(
              "No Employees",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                color: Color(0xFF0271BA),
              ),
            ),
          );
        }

        return Container(
          margin: EdgeInsets.only(top: 18),
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: ListView.builder(
            itemCount: employeeC.employees.length,
            itemBuilder: (context, index) => EmployeeItem(
              id: employeeC.employees[index].employeeId,
              name: employeeC.employees[index].name,
              phoneNumber: employeeC.employees[index].phoneNumber,
              onDelete: employeeC.deleteEmployee,
              onEdit: employeeC.updateEmployee,
            ),
          ),
        );
      }),
    );
  }
}
