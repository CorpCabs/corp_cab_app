import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  // Phone Sign-In
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto verification succeeded
        await _auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone number automatically verified!")),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        // Verification failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Verification failed: ${e.message}")),
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        // Code sent to the phone number
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Verification code sent.")),
        );

        // Navigate to OTP page with verificationId
        GoRouter.of(context).go('/auth/OTP-page', extra: verificationId);

      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Timeout for auto retrieval
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Code auto-retrieval timeout.")),
        );
      },
    );
  }

  // Verify OTP
  Future<void> verifyOTP(
    BuildContext context,
    String verificationId,
    String otp,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone number verified successfully!")),
      );

      // Navigate to the next screen, e.g., the home page
      GoRouter.of(context).go('/home', extra: verificationId);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to verify OTP: $e")),
      );
    }
  }
}
