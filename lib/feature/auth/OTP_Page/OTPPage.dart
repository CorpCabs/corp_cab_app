import 'package:corp_cab_app/app/common/toast.dart';
import 'package:corp_cab_app/app/resources/auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _otpController = TextEditingController();

  bool _isLoading = false;

  Future<void> verifyOTP(phoneNumber) async {
    setState(() {
      _isLoading = true;
    });
    final res = await AuthMethods().verifyOTP(
      otp: _otpController.text.trim(),
      phone: phoneNumber as String,
    );
    if (res == 'success') {
      if (context.mounted) {
        context.goNamed('home');

        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        // showSnackBar(context, res);
        ToastUtils.showErrorToast(res);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumber = GoRouterState.of(context).extra as String?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter your OTP.',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Enter the OTP we've sent to your phone number.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'OTP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _isLoading
                    ? null
                    : () {
                        final userOTP = _otpController.text.trim();
                        verifyOTP(phoneNumber);
                      },
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Verify', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
