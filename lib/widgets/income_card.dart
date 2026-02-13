import 'package:flutter/material.dart';

class IncomeCard extends StatelessWidget{
  const IncomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 140,
      padding: EdgeInsets.only(left: 18, top: 18),
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
      child: Column(),
    );
  }
}