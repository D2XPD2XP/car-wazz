import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 8, bottom: 14),
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
            'Total Bike Washed',
            style: GoogleFonts.plusJakartaSans(
              color: Color(0xFF0271BA),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8,),
          Text(
            '981',
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
