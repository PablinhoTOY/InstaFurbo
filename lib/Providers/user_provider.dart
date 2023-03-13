import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_furbo/models/user_data.dart';
import 'package:insta_furbo/Resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  user? _user;
  final AuthMethods _authMethods = AuthMethods();

  user get getUser => _user!;

  Future<void> refreshUser() async {
    user user_ = await _authMethods.getUserDetails();
    _user = user_;
    notifyListeners();
  }
}
