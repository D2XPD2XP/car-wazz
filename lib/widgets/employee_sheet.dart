import 'package:car_wazz/controllers/employee_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeSheet extends StatelessWidget {
  final String? id;
  final String? name;
  final String? pNumber;
  final Future<void> Function(String, String)? onAdd;
  final Future<void> Function(String, String, String)? onEdit;

  EmployeeSheet({
    super.key,
    this.id,
    this.name,
    this.pNumber,
    this.onAdd,
    this.onEdit,
  });

  final employeeformC = Get.put(EmployeeFormController());

  @override
  Widget build(BuildContext context) {
    employeeformC.clearForm();

    if (onEdit != null) {
      employeeformC.editEmployee(name!, pNumber!);
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 18),
          Text(
            onAdd != null ? "Add Employee" : "Edit Employee",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 18),
          TextField(
            controller: employeeformC.nameC,
            cursorColor: Color(0xFF0271BA),
            decoration: InputDecoration(
              labelText: 'Name',
              floatingLabelStyle: TextStyle(color: Color(0xFF0271BA)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey, // abu normal
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF0271BA),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: employeeformC.phoneC,
            keyboardType: TextInputType.phone,
            cursorColor: Color(0xFF0271BA),
            decoration: InputDecoration(
              labelText: 'Phone Number',
              floatingLabelStyle: TextStyle(color: Color(0xFF0271BA)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey, // abu normal
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF0271BA),
                  width: 2,
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0271BA),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                if (onAdd != null) {
                  await onAdd!(employeeformC.name, employeeformC.phoneNumber);
                } else if (onEdit != null) {
                  await onEdit!(
                    id!,
                    employeeformC.name,
                    employeeformC.phoneNumber,
                  );
                }
              },
              child: Text(
                "Confirm",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
