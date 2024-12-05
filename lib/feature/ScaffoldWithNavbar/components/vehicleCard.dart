import 'package:flutter/material.dart';

Widget buildVehicleCard(String title, String price, 
// String imagePath, 
bool isSelected,) {
  return Container(
    decoration: BoxDecoration(
      color: isSelected ? Colors.purple[100] : Colors.grey[900],
      borderRadius: BorderRadius.circular(14),
      border: isSelected ? Border.all(color: Colors.purple, width: 2) : null,
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
            color: isSelected ? Colors.purple : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: TextStyle(
            color: isSelected ? Colors.purple : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}