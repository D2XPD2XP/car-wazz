import 'package:car_wazz/controllers/transaction_form_controller.dart';
import 'package:car_wazz/enums/vehicle_type_enum.dart';
import 'package:car_wazz/models/employee.dart';
import 'package:car_wazz/models/service_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionSheet extends StatelessWidget {
  final RxList<Employee> employees;
  final RxList<ServiceOption> services;
  final Future<void> Function(
    String,
    String,
    String,
    VehicleTypeEnum,
    String,
    double,
  )
  onTap;

  TransactionSheet({
    super.key,
    required this.employees,
    required this.services,
    required this.onTap,
  });

  final TransactionFormController transactionFormController = Get.put(
    TransactionFormController(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
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
            "Add Transaction",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 18),
          TextField(
            controller: transactionFormController.nameC,
            cursorColor: Color(0xFF0271BA),
            decoration: InputDecoration(
              labelText: 'Vehicle Name',
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
            controller: transactionFormController.plateC,
            cursorColor: Color(0xFF0271BA),
            decoration: InputDecoration(
              labelText: 'Plate Number',
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
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<VehicleTypeEnum>(
                        value: transactionFormController.type.value,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        isDense: true,
                        iconSize: 18,
                        items: VehicleTypeEnum.values
                            .map(
                              (vType) => DropdownMenuItem(
                                value: vType,
                                child: Text(vType.name.toUpperCase()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            transactionFormController.type.value = value;
                          }
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<Employee>(
                        hint: const Text('Select Employee'),
                        value: transactionFormController.selectedEmployee.value,
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        isDense: true,
                        iconSize: 18,
                        icon: const Icon(Icons.keyboard_arrow_down),

                        items: employees
                            .map(
                              (employee) => DropdownMenuItem<Employee>(
                                value: employee,
                                child: Text(employee.name),
                              ),
                            )
                            .toList(),

                        onChanged: (value) {
                          transactionFormController.selectedEmployee.value =
                              value;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(
              () => DropdownButtonHideUnderline(
                child: DropdownButton<ServiceOption>(
                  hint: const Text('Select Service'),
                  value: transactionFormController.selectedService.value,
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  isDense: true,
                  iconSize: 18,
                  icon: Icon(Icons.keyboard_arrow_down),

                  items: services
                      .map(
                        (service) => DropdownMenuItem<ServiceOption>(
                          value: service,
                          child: Text(service.serviceName),
                        ),
                      )
                      .toList(),

                  onChanged: (value) {
                    transactionFormController.selectedService.value = value;
                  },
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
                final selectedEmp =
                    transactionFormController.selectedEmployee.value;
                final selectedServ =
                    transactionFormController.selectedService.value;

                if (selectedEmp == null || selectedServ == null) {
                  Get.snackbar(
                    "Warning",
                    "Please select employee and service",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                  return;
                }

                await onTap(
                  selectedEmp.employeeId,
                  selectedServ.serviceId,
                  transactionFormController.plateC.text,
                  transactionFormController.type.value,
                  transactionFormController.nameC.text,
                  selectedServ.price,
                );
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
