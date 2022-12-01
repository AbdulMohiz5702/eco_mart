import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/infrastructure/providers/create_provider.dart';
import 'package:eco_mart/presentation/views/auth/signup/layout/signup_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpProvider signUp = Provider.of<SignUpProvider>(context);
    return LoadingOverlay(
      isLoading: signUp.status == SignUpStatus.Registering,
      progressIndicator: const SpinKitSpinningLines(
        color: FrontEndConfigs.kPrimaryColor, size: 50,),
      child: const Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: SignUpBody(),
    ),);
  }
}
