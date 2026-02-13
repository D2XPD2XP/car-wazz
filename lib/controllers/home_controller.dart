import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  Future<void> changePage(int idx) async {
    currentIndex.value = idx;
  }
}
