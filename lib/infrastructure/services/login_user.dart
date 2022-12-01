import 'package:eco_mart/infrastructure/providers/user_provider.dart';
import 'package:eco_mart/infrastructure/services/auth_services.dart';
import 'package:eco_mart/infrastructure/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginUser {
  UserServices _userServices = UserServices();

  loginUserLogic(BuildContext context,
      {required String email, required String password}) async {
    var login = Provider.of<AuthServices>(context, listen: false);
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    return await login
        .signIn(context, email: email, password: password)
        .then((User? user) {
      if (user != null) {
        _userServices.fetchUserData(user.uid).listen((event) {
          userProvider.saveUserData(event);
        });
      }
    });
  }
}
