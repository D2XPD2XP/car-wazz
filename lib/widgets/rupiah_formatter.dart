import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RupiahFormatter extends StatelessWidget {
  final double price;
  final double size;
  final FontWeight fontWeight;
  final Color? color;

  const RupiahFormatter({
    super.key,
    required this.price,
    required this.size,
    required this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    String formattedPrice = currencyFormatter.format(price);

    return Text(
      formattedPrice,
      style: GoogleFonts.plusJakartaSans(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}