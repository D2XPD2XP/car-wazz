import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'SEARCH PLATE',
          hintStyle: TextStyle(color: Color(0xFF777777), fontSize: 10),
          prefixIcon: Icon(Icons.search, size: 20, color: Color(0xFF0271BA)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 2),
        ),
      ),
    );
  }
}
