import 'package:flutter/material.dart';

Widget commonTextField({
  required String labelText,
  required String hintText,
  required BuildContext context,
  required TextEditingController controller,
  required String? Function(String? value) validator, // Updated
  required void Function(String value) onChanged,
  void Function(String value)? onSubmitted,
}) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(color: Colors.white),
    onChanged: onChanged,
    onFieldSubmitted: onSubmitted,
    validator: validator, // Hooked up the validator
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
      errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
    ),
  );
}
