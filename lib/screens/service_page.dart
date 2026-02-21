import 'package:car_wazz/controllers/service_option_controller.dart';
import 'package:car_wazz/widgets/service_item.dart';
import 'package:car_wazz/widgets/service_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  final ServiceOptionController serviceOptionController =
      Get.find<ServiceOptionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEEEE),
        title: Text(
          "Service",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    ServiceSheet(
                      onAdd: serviceOptionController.createServiceOption,
                    ),
                    isScrollControlled: true,
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 14),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFF0271BA),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add_rounded, color: Colors.white, size: 32),
                ),
              );
            },
          ),
        ],
      ),
      body: Obx(() {
        if (serviceOptionController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (serviceOptionController.serviceOptions.isEmpty) {
          return Center(
            child: Text(
              "No Services",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                color: Color(0xFF0271BA),
              ),
            ),
          );
        }

        return Container(
          margin: EdgeInsets.only(top: 18),
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: ListView.builder(
            itemCount: serviceOptionController.serviceOptions.length,
            itemBuilder: (context, index) => ServiceItem(
              id: serviceOptionController.serviceOptions[index].serviceId,
              name: serviceOptionController.serviceOptions[index].serviceName,
              price: serviceOptionController.serviceOptions[index].price,
              onDelete: serviceOptionController.deleteServiceOption,
              onEdit: serviceOptionController.updateServiceOption,
            ),
          ),
        );
      }),
    );
  }
}
