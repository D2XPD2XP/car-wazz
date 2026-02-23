import 'package:car_wazz/widgets/rupiah_formatter.dart';
import 'package:car_wazz/widgets/service_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceItem extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final Future<void> Function(String) onDelete;
  final Future<void> Function(String, String, String) onEdit;

  const ServiceItem({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 12, right: 14, left: 14, bottom: 14),
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
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF0271BA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    name,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              RupiahFormatter(
                price: price,
                size: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2CA600),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                ServiceSheet(id: id, name: name, price: price, onEdit: onEdit),
                isScrollControlled: true,
              );
            },
            icon: Icon(Icons.edit_outlined, color: Color(0xFF0271BA)),
          ),
          IconButton(
            onPressed: () async {
              await onDelete(id);
            },
            icon: Icon(
              Icons.delete_outline,
              color: const Color.fromARGB(255, 182, 26, 15),
            ),
          ),
        ],
      ),
    );
  }
}
