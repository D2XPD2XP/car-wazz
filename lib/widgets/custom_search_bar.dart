import 'package:car_wazz/controllers/search_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(dynamic)? onSearch;

  CustomSearchBar({super.key, this.onSearch});

  final searchBarController = Get.put(SearchBarController());

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
        controller: searchBarController.searchController,
        decoration: InputDecoration(
          hintText: 'SEARCH PLATE',
          hintStyle: TextStyle(color: Color(0xFF777777), fontSize: 10),
          prefixIcon: Icon(Icons.search, size: 20, color: Color(0xFF0271BA)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 2),
        ),
        onChanged: onSearch,
      ),
    );
  }
}
