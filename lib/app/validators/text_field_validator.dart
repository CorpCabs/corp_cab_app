// Validator function
String? validateField(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName cannot be empty';
  }
  return null;
}
