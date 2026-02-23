import 'package:car_wazz/enums/vehicle_type_enum.dart';
import 'package:car_wazz/widgets/rupiah_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionHistoryCard extends StatelessWidget {
  final String plate;
  final String vehicleName;
  final String employeeName;
  final String serviceName;
  final VehicleTypeEnum vehicleType;
  final double total;
  final DateTime date;

  const TransactionHistoryCard({
    super.key,
    required this.plate,
    required this.vehicleName,
    required this.employeeName,
    required this.serviceName,
    required this.vehicleType,
    required this.total,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 10, right: 14, left: 14, bottom: 18),
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
                plate,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF0271BA),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.directions_car_filled_outlined,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    employeeName,
                    style: GoogleFonts.plusJakartaSans(
                      color: Color(0xFF777777),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            vehicleName,
            style: GoogleFonts.plusJakartaSans(
              color: Color(0xFF777777),
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF0271BA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    serviceName,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RupiahFormatter(
                      price: total,
                      size: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2CA600),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  DateFormat('dd MMMM yyyy', 'en_US').format(date),
                  style: GoogleFonts.plusJakartaSans(
                    color: Color(0xFF0271BA),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
