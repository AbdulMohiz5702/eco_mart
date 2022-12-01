import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/views/auth/login/login_view.dart';
import 'package:eco_mart/presentation/views/auth/signup/signup_view.dart';
import 'package:flutter/material.dart';

class StartViewBody extends StatelessWidget {
  const StartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(child: Image.asset('assets/images/login.png')),
            CustomText(
              text: 'ECOMART',
              fontWeight: FontWeight.w600,
              fontSize: 30,
              letterSpacing: 6,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Sustainable Market Place',
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 3,
            ),
            const SizedBox(
              height: 40,
            ),
            AppButton(
              onPressed: () {
                NavigationHelper.pushRoute(context, SignUpView());
              },
              text: 'Sign Up',
              color: Colors.white,
              textColor: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(text: 'Or'),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              onPressed: () {
                NavigationHelper.pushRoute(context, const LoginView());
              },
              text: 'Sign In',
              color: Colors.white,
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
