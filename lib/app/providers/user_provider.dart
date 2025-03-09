import 'package:corp_cab_app/app/models/user_model.dart';
import 'package:corp_cab_app/app/resources/auth_methods.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    final user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
