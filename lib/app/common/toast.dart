import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Toast toastLength = Toast.LENGTH_SHORT,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static void showErrorToast(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.red,
      gravity: ToastGravity.CENTER,
    );
  }

  static void showSuccessToast(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.green,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static void showInfoToast(String message) {
    showToast(
      message: message,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
