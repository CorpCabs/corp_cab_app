import 'package:flutter/material.dart';

Widget buildVehicleCard(
  String title,
  String price,
// String imagePath,
  bool isSelected,
) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? const Color(0xff7b81ed) : Colors.grey[900],
      borderRadius: BorderRadius.circular(14),
      border: isSelected
          ? Border.all(color: const Color(0xff7b81ed), width: 2)
          : null,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image.asset(
        //   imagePath,
        //   height: 50,
        //   fit: BoxFit.contain,
        // ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}
