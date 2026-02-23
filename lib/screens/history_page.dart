import 'package:car_wazz/controllers/employee_controller.dart';
import 'package:car_wazz/controllers/history_controller.dart';
import 'package:car_wazz/controllers/service_option_controller.dart';
import 'package:car_wazz/controllers/transaction_controller.dart';
import 'package:car_wazz/widgets/custom_search_bar.dart';
import 'package:car_wazz/widgets/transaction_history_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final _transactionC = Get.find<TransactionController>();
  final _employeeC = Get.find<EmployeeController>();
  final _serviceC = Get.find<ServiceOptionController>();
  final _historyC = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "History",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: Obx(() {
        if (_employeeC.isLoading.value ||
            _transactionC.isLoading.value ||
            _serviceC.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xFF0271BA)),
          );
        }

        final currentTransactions = _historyC.filteredTransactions;

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 18)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomSearchBar(
                      onSearch: (q) {
                        _historyC.query.value = q;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() {
                          final employees = _employeeC.employees;

                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD5D5D5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _historyC.selectedEmployeeId.value,
                                dropdownColor: Colors.white,
                                isDense: true,
                                iconSize: 18,
                                items: [
                                  const DropdownMenuItem(
                                    value: '',
                                    child: Text(
                                      'All Employees',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  ...employees.map(
                                    (e) => DropdownMenuItem(
                                      value: e.employeeId,
                                      child: Text(
                                        e.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                onChanged: (value) =>
                                    _historyC.selectedEmployeeId.value =
                                        value ?? '',
                                icon: const Icon(Icons.keyboard_arrow_down),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(width: 12),
                        Obx(() {
                          final d = _historyC.selectedDate.value;
                          final label = d == null
                              ? 'All Dates'
                              : DateFormat('dd MMM yyyy').format(d);

                          return InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              final now = DateTime.now();
                              final initial =
                                  d ?? DateTime(now.year, now.month, now.day);

                              final picked = await showDatePicker(
                                context: context,
                                initialDate: initial,
                                firstDate: DateTime(2000, 1, 1),
                                lastDate: DateTime(
                                  DateTime.now().year + 5,
                                  12,
                                  31,
                                ),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: const ColorScheme.light(
                                        primary: Color(0xFF0271BA),
                                        onPrimary: Colors.white,
                                        onSurface: Colors.black,
                                      ),
                                      datePickerTheme:
                                          const DatePickerThemeData(
                                            backgroundColor: Colors.white,
                                            headerBackgroundColor: Color(
                                              0xFF0271BA,
                                            ),
                                            headerForegroundColor: Colors.white,
                                            dayForegroundColor:
                                                WidgetStatePropertyAll(
                                                  Colors.black,
                                                ),
                                            todayForegroundColor:
                                                WidgetStatePropertyAll(
                                                  Color(0xFF0271BA),
                                                ),
                                            todayBorder: BorderSide(
                                              color: Color(0xFF0271BA),
                                            ),
                                          ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (picked != null) _historyC.setDate(picked);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD5D5D5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.calendar_month, size: 18),
                                  const SizedBox(width: 6),
                                  Text(
                                    label,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                  if (d != null) ...[
                                    const SizedBox(width: 6),
                                    InkWell(
                                      onTap: () => _historyC.clearDate(),
                                      child: const Icon(Icons.close, size: 16),
                                    ),
                                  ] else ...[
                                    const SizedBox(width: 6),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 18,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
            currentTransactions.isEmpty
                ? SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          "No Transaction",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: Color(0xFF0271BA),
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final transaction = currentTransactions[index];

                        final employee = _employeeC.employees.firstWhereOrNull(
                          (e) => e.employeeId == transaction.employeeId,
                        );

                        final service = _serviceC.serviceOptions
                            .firstWhereOrNull(
                              (e) => e.serviceId == transaction.serviceId,
                            );

                        return Dismissible(
                          key: Key(transaction.transactionId),
                          background: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            padding: const EdgeInsets.only(
                              top: 10,
                              right: 14,
                              left: 14,
                              bottom: 18,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 153, 28, 19),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onDismissed: (direction) {
                            _transactionC.deleteTransaction(
                              transaction.transactionId,
                            );
                          },
                          child: TransactionHistoryCard(
                            vehicleName: transaction.vehicleName,
                            plate: transaction.plateNumber,
                            employeeName: employee?.name ?? "-",
                            serviceName: service?.serviceName ?? "-",
                            vehicleType: transaction.vehicleType,
                            total: transaction.totalAmount,
                            date: transaction.date,
                          ),
                        );
                      }, childCount: currentTransactions.length),
                    ),
                  ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        );
      }),
    );
  }
}
