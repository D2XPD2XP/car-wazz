import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/widgets/custom_search_bar.dart';
import 'package:car_wazz/widgets/employee_card.dart';
import 'package:car_wazz/widgets/home_vehicle_card.dart';
import 'package:car_wazz/widgets/income_card.dart';
import 'package:car_wazz/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final _authC = Get.find<AuthController>();

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
          onPressed: () {},
          backgroundColor: const Color(0xFF0271BA),
          shape: CircleBorder(),
          child: Icon(Icons.add, size: 40, color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (_authC.currentUser.value == null) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xFF0271BA)),
          );
        }

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
                        Expanded(flex: 2, child: IncomeCard()),
                        SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              HomeVehicleCard(),
                              SizedBox(height: 6),
                              HomeVehicleCard(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    CustomSearchBar(),
                  ],
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                height: 45,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => EmployeeCard(),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Container(
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
                      itemCount: 20,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Dismissible(
                        key: ValueKey(index),
                        background: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.only(
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
                        onDismissed: (direction) {},
                        child: TransactionCard(),
                      ),
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
