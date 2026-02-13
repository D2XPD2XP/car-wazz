import 'package:car_wazz/controllers/home_controller.dart';
import 'package:car_wazz/screens/homepage.dart';
import 'package:car_wazz/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final _homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: _homeC.currentIndex.value,
          children: [Homepage(), Homepage(), Homepage(), ProfilePage()],
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
          currentIndex: _homeC.currentIndex.value,
          selectedItemColor: Color(0xFF0271BA),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          onTap: _homeC.changePage,
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
