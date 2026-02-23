import 'package:car_wazz/controllers/transaction_controller.dart';
import 'package:car_wazz/enums/vehicle_type_enum.dart';
import 'package:car_wazz/models/transaction.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();
  final isDispose = false.obs;
  final query = ''.obs;
  late final TransactionController trxC;
  final todayIncome = 0.0.obs;
  final todayCarCount = 0.obs;
  final todayMotorCount = 0.obs;
  var searchedTransaction = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    trxC = Get.find<TransactionController>();

    ever(query, (q) {
      q = query.trim().toLowerCase();
      if (q.isEmpty) return [];

      searchedTransaction.value = trxC.todayTransactions.where((t) {
        final plate = (t.plateNumber).toLowerCase();
        return plate.contains(q);
      }).toList();
    });

    ever<List<TransactionModel>>(trxC.todayTransactions, (transactions) {
      _calculateDashboard(transactions);
    });
  }

  void _calculateDashboard(List<TransactionModel> transactions) {
    double income = 0;
    int car = 0;
    int motor = 0;

    for (final t in transactions) {
      income += t.totalAmount;

      if (t.vehicleType == VehicleTypeEnum.car) {
        car++;
      } else if (t.vehicleType == VehicleTypeEnum.bike) {
        motor++;
      }
    }

    todayIncome.value = income;
    todayCarCount.value = car;
    todayMotorCount.value = motor;
  }

  void toggleIncome() {
    isDispose.toggle();
  }
}
