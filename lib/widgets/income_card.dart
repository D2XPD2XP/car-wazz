import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_wazz/widgets/rupiah_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class IncomeCard extends StatelessWidget {
  final double dailyIncome;
  final VoidCallback onTap;
  final bool isDispose;

  const IncomeCard({
    super.key,
    required this.onTap,
    required this.isDispose,
    required this.dailyIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      padding: EdgeInsets.only(left: 18, top: 18, right: 14),
      decoration: BoxDecoration(
        color: Color(0xFF0271BA),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Income",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    DateFormat('dd MMMM yyyy', 'en_US').format(DateTime.now()),
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 18),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isDispose == true ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFF0271BA),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 18),
          isDispose == true
              ? AutoSizeText(
                  "Rp. ...",
                  maxLines: 1,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : RupiahFormatter(price: dailyIncome, isAutoSize: true),
        ],
      ),
    );
  }
}
