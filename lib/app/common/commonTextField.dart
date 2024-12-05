import 'package:flutter/material.dart';

Widget commonTextField({
  required String labelText,
  required String hintText,
}) {
  return TextField(
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        // borderSide: BorderSide.none,
      ),
    ),
  );
}
