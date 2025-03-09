import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corp_cab_app/app/models/user_model.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  // AuthMethods() {
  //   _auth.useAuthEmulator('localhost', 9099);
  // }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';

  // get user details
  Future<model.User> getUserDetails() async {
    final currentUser = _auth.currentUser;

    final DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser?.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  // Sending OTP
  Future<String> sendOTP({required String phoneNumber}) async {
    var res = 'Some error Occurred';
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          res = e.message ?? 'Verification failed';
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          res = 'OTP sent successfully';
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // Verifying OTP and signing in
  Future<String> verifyOTP({
    required String otp,
    required String phone,
  }) async {
    var res = 'Some error Occurred';
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: otp,
      );
      final userCredential = await _auth.signInWithCredential(credential);

      final user = model.User(
        phone: phone,
        uid: userCredential.user!.uid,
      );

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user.toJson());
      res = 'success';
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // Signing out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
