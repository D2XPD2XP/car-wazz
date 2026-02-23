import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeVehicleCard extends StatelessWidget {
  final String type;
  final int total;

  const HomeVehicleCard({super.key, required this.type, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: double.infinity,
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            type,
            style: GoogleFonts.plusJakartaSans(
              color: Color(0xFF0271BA),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Text(
            '$total',
            style: GoogleFonts.plusJakartaSans(
              color: Color(0xFF0271BA),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
