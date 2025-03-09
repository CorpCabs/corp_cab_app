import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  const User({
    required this.phone,
    required this.uid,
  });

  final String uid;
  final String phone;

  static User fromSnap(DocumentSnapshot snap) {
    final snapshot = snap.data()! as Map<String, dynamic>;

    return User(
      phone: snapshot['phone'] as String,
      uid: snapshot['uid'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'username': phone,
        'uid': uid,
      };
}
