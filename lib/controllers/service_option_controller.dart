import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:car_wazz/models/service_option.dart';
import 'package:car_wazz/services/service_option_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class ServiceOptionController extends GetxController {
  final String userId;
  final ServiceOptionService _service = ServiceOptionService();

  ServiceOptionController(this.userId);

  var serviceOptions = <ServiceOption>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    serviceOptions.bindStream(_service.getServiceOptions(userId));
    ever(serviceOptions, (_) => isLoading.value = false);
  }

  Future<void> createServiceOption(String name, String priceStr) async {
    double? price = double.tryParse(priceStr);

    if (name.isEmpty || price == null) {
      _showErrorDialog("Add Service Failed");
      return;
    }

    ServiceOption service = ServiceOption(
      serviceId: const Uuid().v4(),
      serviceName: name,
      price: price,
    );

    await _service.createServiceOption(userId, service);
    Get.back();
  }

  Future<void> updateServiceOption(
    String serviceId,
    String name,
    String priceStr,
  ) async {
    double? price = double.tryParse(priceStr);

    if (name.isEmpty || price == null) {
      _showErrorDialog("Edit Service Failed");
      return;
    }

    await _service.updateServiceOption(userId, serviceId, {
      'service_name': name,
      'price': price,
    });
    Get.back();
  }

  Future<void> deleteServiceOption(String serviceId) async {
    await _service.deleteServiceOption(userId, serviceId);
  }

  void _showErrorDialog(String title) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        content: Text(
          "Please make sure a valid name and price",
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(Colors.red),
              ),
              child: const Text(
                "OK",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
