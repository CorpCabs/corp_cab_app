import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

// SignUp Page
class SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyIDController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello!\nSignup to get started",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                TextFormField(
                controller: _NameController,
                decoration: const InputDecoration(labelText: "Full Name"),
                validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Company ID is required';
                    }
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                controller: _companyIDController,
                decoration: const InputDecoration(labelText: "Company ID"),
                validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Company ID is required';
                    }
                  },
                ),
                const SizedBox(height: 12),
                InternationalPhoneNumberInput(
                onInputChanged: (number) {},
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                inputDecoration: const InputDecoration(labelText: "Phone Number"),
                textFieldController: _phoneController, // Attach controller
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit phone number';
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      if (_formKey.currentState!.validate()){
                        context.pushNamed('OTP-page');
                      }
                    },
                    child: const Text("Sign up", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}