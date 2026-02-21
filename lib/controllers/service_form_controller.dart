import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ServiceFormController extends GetxController {
  var nameC = TextEditingController();
  var priceC = TextEditingController();

  String get name => nameC.text;
  String get price => priceC.text;

  void clearForm() {
    nameC.clear();
    priceC.clear();
  }

  void editService(String sName, String sPrice) {
    nameC.text = sName;
    priceC.text = sPrice;
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
