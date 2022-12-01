import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/views/auth/login/layout/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../../infrastructure/services/auth_services.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthServices>(context);
    return LoadingOverlay(
      isLoading: auth.status == Status.Authenticating,
      progressIndicator: const SpinKitSpinningLines(
        color: FrontEndConfigs.kPrimaryColor,
        size: 50,
      ),
      child: const Scaffold(
        backgroundColor: FrontEndConfigs.kSecondaryColor,
        body: LoginBody(),
      ),
    );
  }
}
