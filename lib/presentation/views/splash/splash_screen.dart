import 'dart:async';

import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/views/bottom_nav/bottom_nav_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/start/start_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        NavigationHelper.pushReplacement(context, BottomNavView());
      } else {
        NavigationHelper.pushReplacement(context, StartView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/splash.png'),
    );
  }
}
