import 'package:car_wazz/widgets/rupiah_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 8, right: 14, left: 14, bottom: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Asep',
                style: GoogleFonts.plusJakartaSans(
                  color: Color(0xFF0271BA),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit_outlined),
                color: Color(0xFF0271BA),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete_outline),
                color: const Color.fromARGB(255, 182, 26, 15),
              ),
            ],
          ),
          Text(
            '08210009944',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Today's Earnings:",
                style: GoogleFonts.plusJakartaSans(
                  color: Color(0xFF777777),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4),
              Flexible(
                child: RupiahFormatter(
                  price: 800000,
                  size: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2CA600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
