import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionSheet extends StatelessWidget {
  const TransactionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.58,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 18),
          Text(
            "Add Transaction",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 18),
          TextField(
            cursorColor: Color(0xFF0271BA),
            decoration: InputDecoration(
              labelText: 'Vehicle Name',
              floatingLabelStyle: TextStyle(color: Color(0xFF0271BA)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey, // abu normal
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF0271BA),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            cursorColor: Color(0xFF0271BA),
            decoration: InputDecoration(
              labelText: 'Plate Number',
              floatingLabelStyle: TextStyle(color: Color(0xFF0271BA)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey, // abu normal
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF0271BA),
                  width: 2,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: '',
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      isDense: true,
                      iconSize: 18,
                      items: const [
                        DropdownMenuItem(
                          value: '',
                          child: Text(
                            'Select Service',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Wash and Detailing',
                          child: Text(
                            'Wash and Detailing',
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      icon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: '',
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      isDense: true,
                      iconSize: 18,
                      items: const [
                        DropdownMenuItem(
                          value: '',
                          child: Text(
                            'Select Employee',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        DropdownMenuItem(value: 'Asep Septian', child: Text('Asep Septian Nugraha Aji')),
                      ],
                      onChanged: (value) {},
                      icon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0271BA),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Confirm",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
