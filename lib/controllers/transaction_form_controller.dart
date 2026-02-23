import 'package:car_wazz/enums/vehicle_type_enum.dart';
import 'package:car_wazz/models/employee.dart';
import 'package:car_wazz/models/service_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionFormController extends GetxController{
  var nameC = TextEditingController();
  var plateC = TextEditingController();
  final type = VehicleTypeEnum.car.obs;
  final selectedEmployee = Rxn<Employee>();
  final selectedService = Rxn<ServiceOption>();

  String get name => nameC.text;
  String get plate => plateC.text;

  void clearForm() {
    nameC.clear();
    plateC.clear();
  }

  void editService(String vName, String vPlate) {
    nameC.text = vName;
    plateC.text = vPlate;
  }

  @override
  void onClose() {
    nameC.dispose();
    plateC.dispose();
    super.onClose();
  }
}