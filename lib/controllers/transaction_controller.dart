// import 'dart:async';
// import 'package:get/get.dart';
// import '../models/transaction.dart';
// import '../services/transaction_service.dart';
// import '../enums/vehicle_type_enum.dart';

// class TransactionController extends GetxController {
//   final TransactionService _service = TransactionService();

//   final RxList<TransactionModel> transactions = <TransactionModel>[].obs;
//   final RxBool isLoading = false.obs;

//   StreamSubscription<List<TransactionModel>>? _subscription;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAllTransactions();
//   }

//   @override
//   void onClose() {
//     _subscription?.cancel();
//     super.onClose();
//   }

//   void _bindStream(Stream<List<TransactionModel>> stream) {
//     isLoading.value = true;
//     _subscription?.cancel();

//     _subscription = stream.listen((data) {
//       transactions.assignAll(data);
//       isLoading.value = false;
//     });
//   }

//   void fetchAllTransactions() {
//     _bindStream(_service.getAllTransactions());
//   }

//   void fetchTransactionsByEmployee(String employeeId) {
//     _bindStream(_service.getTransactionsByEmployee(employeeId));
//   }

//   void fetchTodayTransactions() {
//     _bindStream(_service.getTodayTransactions());
//   }

//   void fetchTodayTransactionsByEmployee(String employeeId) {
//     _bindStream(_service.getTodayTransactionsByEmployee(employeeId));
//   }

//   int get totalTransactionCount {
//     return transactions.length;
//   }

//   Map<VehicleTypeEnum, int> get totalTransactionCountByVehicleType {
//     final Map<VehicleTypeEnum, int> result = {};
//     for (final trx in transactions) {
//       result.update(
//         trx.vehicleType,
//         (value) => value + 1,
//         ifAbsent: () => 1,
//       );
//     }
//     return result;
//   }

//   Map<VehicleTypeEnum, int> get todayTransactionCountByVehicleType {
//     final now = DateTime.now();
//     final Map<VehicleTypeEnum, int> result = {};

//     for (final trx in transactions) {
//       final isToday =
//           trx.date.year == now.year &&
//           trx.date.month == now.month &&
//           trx.date.day == now.day;

//       if (isToday) {
//         result.update(
//           trx.vehicleType,
//           (value) => value + 1,
//           ifAbsent: () => 1,
//         );
//       }
//     }
//     return result;
//   }

//   Map<VehicleTypeEnum, double> get totalIncomeByVehicleType {
//     final Map<VehicleTypeEnum, double> result = {};
//     for (final trx in transactions) {
//       result.update(
//         trx.vehicleType,
//         (value) => value + trx.totalAmount,
//         ifAbsent: () => trx.totalAmount,
//       );
//     }
//     return result;
//   }

//   Map<VehicleTypeEnum, double> get todayIncomeByVehicleType {
//     final now = DateTime.now();
//     final Map<VehicleTypeEnum, double> result = {};

//     for (final trx in transactions) {
//       final isToday =
//           trx.date.year == now.year &&
//           trx.date.month == now.month &&
//           trx.date.day == now.day;

//       if (isToday) {
//         result.update(
//           trx.vehicleType,
//           (value) => value + trx.totalAmount,
//           ifAbsent: () => trx.totalAmount,
//         );
//       }
//     }
//     return result;
//   }

//   double get totalIncome {
//     return transactions.fold(
//         0.0, (sum, trx) => sum + trx.totalAmount);
//   }

//   Future<void> addTransaction(TransactionModel transaction) async {
//     isLoading.value = true;
//     await _service.addTransaction(transaction);
//     isLoading.value = false;
//   }

//   Future<void> updateTransaction(TransactionModel transaction) async {
//     isLoading.value = true;
//     await _service.updateTransaction(transaction);
//     isLoading.value = false;
//   }

//   Future<void> deleteTransaction(String id) async {
//     isLoading.value = true;
//     await _service.deleteTransaction(id);
//     isLoading.value = false;
//   }
// }