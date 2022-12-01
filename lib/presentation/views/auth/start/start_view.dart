import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/views/auth/start/layout/start_body.dart';
import 'package:flutter/material.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: StartViewBody(),
    );
  }
}
