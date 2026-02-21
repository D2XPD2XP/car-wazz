import 'package:car_wazz/controllers/auth_controller.dart';
import 'package:car_wazz/controllers/employee_controller.dart';
import 'package:car_wazz/controllers/main_controller.dart';
import 'package:car_wazz/controllers/service_option_controller.dart';
import 'package:car_wazz/screens/employee_page.dart';
import 'package:car_wazz/screens/history_page.dart';
import 'package:car_wazz/screens/homepage.dart';
import 'package:car_wazz/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final authC = Get.find<AuthController>();
  final _mainC = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authC.currentUser.value == null) {
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(color: Color(0xFF0271BA)),
          ),
        );
      }

      if (!Get.isRegistered<EmployeeController>() &&
          !Get.isRegistered<ServiceOptionController>()) {
        Get.put(EmployeeController(authC.currentUser.value!.userId));
        Get.put(ServiceOptionController(authC.currentUser.value!.userId));
      }

      return Scaffold(
        body: IndexedStack(
          index: _mainC.currentIndex.value,
          children: [Homepage(), EmployeePage(), HistoryPage(), ProfilePage()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_2_outlined),
              label: 'Employee',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _mainC.currentIndex.value,
          selectedItemColor: Color(0xFF0271BA),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          onTap: _mainC.changePage,
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
