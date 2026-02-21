import 'package:get/get.dart';

class MainController extends GetxController {
  final currentIndex = 0.obs;

  Future<void> changePage(int idx) async {
    currentIndex.value = idx;
  }
}
