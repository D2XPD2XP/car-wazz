import 'package:car_wazz/controllers/transaction_controller.dart';
import 'package:car_wazz/models/transaction.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final query = ''.obs;
  final selectedEmployeeId = ''.obs;

  final selectedDate = Rxn<DateTime>();
  final filteredTransactions = <TransactionModel>[].obs;

  late final TransactionController trxC;

  @override
  void onInit() {
    super.onInit();

    trxC = Get.find<TransactionController>();

    everAll([
      query,
      selectedEmployeeId,
      selectedDate,
      trxC.allTransactions,
    ], (_) => _apply());

    _apply();
  }

  void setDate(DateTime? date) {
    selectedDate.value = date == null
        ? null
        : DateTime(date.year, date.month, date.day);
  }

  void clearDate() {
    selectedDate.value = null;
  }

  void _apply() {
    final q = query.value.trim().toLowerCase();
    final empId = selectedEmployeeId.value;
    final picked = selectedDate.value;

    final result = trxC.allTransactions.where((t) {
      if (q.isNotEmpty && !t.plateNumber.toLowerCase().contains(q)) {
        return false;
      }

      if (empId.isNotEmpty && t.employeeId != empId) return false;

      if (picked != null) {
        final d = _toDateTime(t.date);
        if (d == null) return false;
        final isSameDay =
            d.year == picked.year &&
            d.month == picked.month &&
            d.day == picked.day;

        if (!isSameDay) return false;
      }

      return true;
    }).toList();

    filteredTransactions.value = result;
  }

  DateTime? _toDateTime(dynamic v) {
    if (v is DateTime) return v;
    if (v is String) return DateTime.tryParse(v);
    return null;
  }
}
