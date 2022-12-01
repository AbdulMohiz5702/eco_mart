import 'package:eco_mart/infrastructure/services/auth_services.dart';
import 'package:eco_mart/infrastructure/services/login_user.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/error_dialog.dart';
import 'package:eco_mart/presentation/views/bottom_nav/bottom_nav_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../infrastructure/providers/error_provider.dart';

class LoginCallBacks {
  static loginUser(
      {required BuildContext context,
      required LoginUser data,
      required String email,
      required AuthServices auth,
      required String password}) {
    print("Called");
    data
        .loginUserLogic(
      context,
      email: email,
      password: password,
    )
        .then((val) async {
      if (auth.status == Status.Authenticated) {
        NavigationHelper.pushReplacement(context, BottomNavView());
      } else {
        showErrorDialog(context,
            message: Provider.of<ErrorString>(context, listen: false)
                .getErrorString());
      }
    });
  }
}
