import 'package:car_wazz/enums/vehicle_type_enum.dart';
import 'package:car_wazz/models/transaction.dart';
import 'package:car_wazz/services/transaction_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class TransactionController extends GetxController {
  final String userId;
  final TransactionService _service = TransactionService();

  TransactionController(this.userId);

  var allTransactions = <TransactionModel>[].obs;
  var todayTransactions = <TransactionModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    allTransactions.bindStream(_service.getAllTransactions(userId));
    todayTransactions.bindStream(_service.getTodayTransactions(userId));

    ever(allTransactions, (_) => isLoading.value = false);
  }

  Future<void> createTransaction(
    String employeeId,
    String serviceId,
    String plateNumber,
    VehicleTypeEnum vehicleType,
    String vehicleName,
    double totalAmount,
  ) async {
    try {
      if (plateNumber.isEmpty ||
          vehicleName.isEmpty ||
          totalAmount <= 0 ||
          employeeId.isEmpty) {
        _showErrorDialog("Add Transaction Failed");
        return;
      }

      final transaction = TransactionModel(
        transactionId: const Uuid().v4(),
        employeeId: employeeId,
        serviceId: serviceId,
        plateNumber: plateNumber,
        vehicleType: vehicleType,
        vehicleName: vehicleName,
        date: DateTime.now(),
        totalAmount: totalAmount,
      );

      await _service.addTransaction(userId, transaction);
      Get.back();
    } catch (e) {
      _showErrorDialog("Error: ${e.toString()}");
    }
  }

  Future<void> deleteTransaction(String transactionId) async {
    try {
      await _service.deleteTransaction(userId, transactionId);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to delete transaction",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  List<TransactionModel> filterByEmployee(String employeeId) {
    return allTransactions.where((t) => t.employeeId == employeeId).toList();
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
          "Please check all fields and try again.",
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
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
