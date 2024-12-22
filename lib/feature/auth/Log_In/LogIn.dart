import 'package:corp_cab_app/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context); // Back to previous page
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello!\nLog in to get started",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                InternationalPhoneNumberInput(
                    onInputChanged: (number) {},
                    initialValue: PhoneNumber(isoCode: 'IN'),
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.DIALOG,
                    ),
                    inputDecoration:
                        const InputDecoration(labelText: "Phone Number"),
                    textFieldController: _phoneController, // Attach controller
                    validator: (value) {
                      final value = _phoneController.text.replaceAll(RegExp(r'\s+'), '');
                      if (value.isEmpty) {
                        return 'Phone number is required';
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Enter a valid 10-digit phone number';
                      }
                      return null;
                    }),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _companyIDController,
                  decoration: const InputDecoration(labelText: "Company ID"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Company ID is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final phoneNumber = "+91${_phoneController.text.replaceAll(RegExp(r'\s+'), '').trim()}";
                        FirebaseAuthMethods(FirebaseAuth.instance).phoneSignIn(
                          context,
                          phoneNumber,
                        );
                      }
                    },
                    child: const Text("Log in", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
