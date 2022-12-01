import 'package:eco_mart/infrastructure/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel _userModel = UserModel();

  UserModel get getUserData => _userModel;

  void saveUserData(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }
}
