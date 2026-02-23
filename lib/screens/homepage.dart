import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/controllers/employee_controller.dart';
import 'package:car_wazz/controllers/home_controller.dart';
import 'package:car_wazz/controllers/service_option_controller.dart';
import 'package:car_wazz/controllers/transaction_controller.dart';
import 'package:car_wazz/widgets/custom_search_bar.dart';
import 'package:car_wazz/widgets/home_vehicle_card.dart';
import 'package:car_wazz/widgets/income_card.dart';
import 'package:car_wazz/widgets/transaction_card.dart';
import 'package:car_wazz/widgets/transaction_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final _authC = Get.find<AuthController>();
  final _employeeC = Get.find<EmployeeController>();
  final _serviceC = Get.find<ServiceOptionController>();
  final _transactionC = Get.find<TransactionController>();
  final _homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      floatingActionButton: Container(
        margin: EdgeInsets.only(),
        height: 60,
        width: 60,
        child: FloatingActionButton(
          heroTag: 'homeFab',
          onPressed: () {
            Get.bottomSheet(
              TransactionSheet(
                employees: _employeeC.employees,
                services: _serviceC.serviceOptions,
                onTap: _transactionC.createTransaction,
              ),
              isScrollControlled: true,
            );
          },
          backgroundColor: const Color(0xFF0271BA),
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 40, color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (_authC.currentUser.value == null ||
            _employeeC.isLoading.value ||
            _transactionC.isLoading.value ||
            _serviceC.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xFF0271BA)),
          );
        }

        final currentTransactions = _homeC.query.isNotEmpty
            ? _homeC.searchedTransaction
            : _transactionC.todayTransactions;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 28, right: 28, top: 68),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, ${_authC.currentUser.value!.username}!",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Happy washy wash!",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Obx(() {
                            return IncomeCard(
                              dailyIncome: _homeC.todayIncome.value,
                              onTap: _homeC.toggleIncome,
                              isDispose: _homeC.isDispose.value,
                            );
                          }),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              HomeVehicleCard(
                                type: 'Car',
                                total: _homeC.todayCarCount.value,
                              ),
                              SizedBox(height: 6),
                              HomeVehicleCard(
                                type: 'Bike',
                                total: _homeC.todayMotorCount.value,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    CustomSearchBar(
                      onSearch: (q) {
                        _homeC.query.value = q;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              currentTransactions.isEmpty
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 50),
                      child: Center(
                        child: Text(
                          "No Transaction",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: Color(0xFF0271BA),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today's Transaction",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: currentTransactions.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final transaction = currentTransactions[index];

                              final employee = _employeeC.employees
                                  .firstWhereOrNull(
                                    (e) =>
                                        e.employeeId == transaction.employeeId,
                                  );

                              final service = _serviceC.serviceOptions
                                  .firstWhereOrNull(
                                    (e) => e.serviceId == transaction.serviceId,
                                  );

                              return Dismissible(
                                key: Key(transaction.transactionId),
                                background: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  padding: EdgeInsets.only(
                                    top: 10,
                                    right: 14,
                                    left: 14,
                                    bottom: 18,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                      255,
                                      153,
                                      28,
                                      19,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onDismissed: (direction) {
                                  _transactionC.deleteTransaction(
                                    transaction.transactionId,
                                  );
                                },
                                child: TransactionCard(
                                  vehicleName: transaction.vehicleName,
                                  plate: transaction.plateNumber,
                                  employeeName: employee?.name ?? "-",
                                  serviceName: service?.serviceName ?? "-",
                                  vehicleType: transaction.vehicleType,
                                  total: transaction.totalAmount,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }
}
