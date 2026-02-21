import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_wazz/widgets/employee_sheet.dart';
import 'package:car_wazz/widgets/rupiah_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeItem extends StatelessWidget {
  final String id;
  final String name;
  final String phoneNumber;
  final double? income;
  final Future<void> Function(String) onDelete;
  final Future<void> Function(String, String, String) onEdit;

  const EmployeeItem({
    super.key,
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.onDelete,
    required this.onEdit,
    this.income
  });

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
              Expanded(
                child: AutoSizeText(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.plusJakartaSans(
                    color: Color(0xFF0271BA),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.bottomSheet(EmployeeSheet(id: id, name: name, pNumber: phoneNumber, onEdit: onEdit), isScrollControlled: true);
                },
                icon: Icon(Icons.edit_outlined),
                color: Color(0xFF0271BA),
              ),
              IconButton(
                onPressed: () async{
                  await onDelete(id);
                },
                icon: Icon(Icons.delete_outline),
                color: const Color.fromARGB(255, 182, 26, 15),
              ),
            ],
          ),
          Text(
            phoneNumber,
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
                  price: income ?? 0,
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
