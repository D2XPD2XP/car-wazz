import 'package:get/get.dart';

class HomeController extends GetxController {
  final isDispose = false.obs;

  void toggleIncome() {
    isDispose.toggle();
  }
}
