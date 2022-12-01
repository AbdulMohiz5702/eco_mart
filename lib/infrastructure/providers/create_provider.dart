import 'package:eco_mart/infrastructure/models/user_model.dart';
import 'package:eco_mart/infrastructure/services/auth_services.dart';
import 'package:eco_mart/infrastructure/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum SignUpStatus { Initial, Registered, Registering, Failed }

enum ValidatedStatus { Validated, NotValidated }

class SignUpProvider with ChangeNotifier {
  SignUpStatus _status = SignUpStatus.Initial;

  SignUpStatus get status => _status;

  void setState(SignUpStatus status) {
    _status = status;
    notifyListeners();
  }

  AuthServices _authServices = AuthServices.instance();

  UserServices _userServices = UserServices();

  ///Register new user and Add its details in Firestore
  Future registerNewUser(
      {required String email,
      required String password,
      required UserModel userModel,
      required BuildContext context,
      required User? user}) async {
    _status = SignUpStatus.Registering;
    notifyListeners();

    return _authServices
        .signUp(
      context,
      email: email,
      password: password,
    )
        .then((User? user) {
      if (user != null) {
        setState(SignUpStatus.Registered);
        _userServices.createUser(context, model: userModel, uid: user.uid);
        _authServices.signOut();
      } else {
        setState(SignUpStatus.Failed);
      }
    });
  }
}
