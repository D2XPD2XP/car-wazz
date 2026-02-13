import 'package:car_wazz/widgets/profile_card.dart';
import 'package:car_wazz/widgets/profile_menu_item.dart';
import 'package:car_wazz/widgets/vehicle_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Account",
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
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 28, right: 28, left: 28),
        child: Column(
          children: [
            ProfileCard(),
            SizedBox(height: 14),
            Row(
              children: [
                Expanded(child: VehicleCard()),
                SizedBox(width: 12),
                Expanded(child: VehicleCard()),
              ],
            ),
            SizedBox(height: 18),
            ProfileMenuItem(
              icon: Icons.person_outline,
              color: Color(0xFF0271BA),
              title: 'Edit Profile',
            ),
            SizedBox(height: 14,),
            ProfileMenuItem(
              icon: Icons.logout,
              color: Colors.red,
              title: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
