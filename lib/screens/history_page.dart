import 'package:car_wazz/widgets/custom_search_bar.dart';
import 'package:car_wazz/widgets/transaction_history_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "History",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 18),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomSearchBar(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD5D5D5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: '',
                            dropdownColor: Colors.white,
                            isDense: true,
                            iconSize: 18,
                            items: const [
                              DropdownMenuItem(
                                value: '',
                                child: Text(
                                  'All Employees',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Jawa Barat',
                                child: Text('Jawa Barat'),
                              ),
                            ],
                            onChanged: (value) {},
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD5D5D5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: '',
                            dropdownColor: Colors.white,
                            isDense: true,
                            iconSize: 18,
                            items: const [
                              DropdownMenuItem(
                                value: '',
                                child: Text(
                                  'All Dates',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Jawa Barat',
                                child: Text('Jawa Barat'),
                              ),
                            ],
                            onChanged: (value) {},
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Dismissible(
                  key: ValueKey(index),
                  background: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.only(
                      top: 10,
                      right: 14,
                      left: 14,
                      bottom: 18,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 153, 28, 19),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onDismissed: (direction) {},
                  child: const TransactionHistoryCard(),
                ),
                childCount: 20,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }
}

