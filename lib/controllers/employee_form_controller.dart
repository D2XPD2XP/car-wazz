import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EmployeeFormController extends GetxController {
  var nameC = TextEditingController();
  var phoneC = TextEditingController();

  String get name => nameC.text;
  String get phoneNumber => phoneC.text;

  void clearForm() {
    nameC.clear();
    phoneC.clear();
  }

  void editEmployee(String eName, String ePhone) {
    nameC.text = eName;
    phoneC.text = ePhone;
  }

  @override
  void onClose() {
    nameC.dispose();
    phoneC.dispose();
    super.onClose();
  }
}
