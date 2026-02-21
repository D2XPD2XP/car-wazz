import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_wazz/models/employee.dart';
import 'package:car_wazz/services/employee_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class EmployeeController extends GetxController {
  final String userId;
  final EmployeeService _service = EmployeeService();

  EmployeeController(this.userId);

  var employees = <Employee>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    employees.bindStream(_service.getEmployees(userId));

    ever(employees, (_) {
      isLoading.value = false;
    });
  }

  Future<void> createEmployee(String name, String phone) async {
    if (name.isEmpty || phone.isEmpty) {
      return Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Add Employee Failed",
            style: GoogleFonts.plusJakartaSans(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Please make sure a valid name and phone number",
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
    }

    Employee employee = Employee(
      employeeId: Uuid().v4(),
      name: name,
      phoneNumber: phone,
    );
    await _service.createEmployee(userId, employee);
    Get.back();
  }

  Future<void> updateEmployee(String docId, String name, String phone) async {
    if (name.isEmpty || phone.isEmpty) {
      return Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Edit Employee Failed",
            style: GoogleFonts.plusJakartaSans(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            "Please make sure a valid name and phone number",
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
    }

    Employee employee = Employee(
      employeeId: docId,
      name: name,
      phoneNumber: phone,
    );

    await _service.updateEmployee(userId, docId, employee);

    Get.back();
  }

  Future<void> deleteEmployee(String docId) async {
    await _service.deleteEmployee(userId, docId);
  }

  Future<Employee?> getEmployeeById(String docId) async {
    return await _service.getEmployeeByDocId(userId, docId);
  }
}
