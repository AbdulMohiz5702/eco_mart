import 'package:eco_mart/infrastructure/services/auth_services.dart';
import 'package:eco_mart/infrastructure/services/login_user.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:eco_mart/presentation/elements/auth_text_field.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/elements/flush_bar.dart';
import 'package:eco_mart/presentation/views/auth/login/login_callBack/login_callback.dart';
import 'package:eco_mart/presentation/views/auth/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginUser data = LoginUser();
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
    var auth = Provider.of<AuthServices>(context);
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset('assets/images/splash.png'),
            CustomText(
              text: 'Welcome back!',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 4,
            ),
            const SizedBox(
              height: 50,
            ),
            AuthTextField(
                hint: 'Email Address',
                icon: Icons.email_outlined,
                validator: (val) => '',
                controller: emailController,
                onPwdTap: () {}),
            const SizedBox(
              height: 10,
            ),
            AuthTextField(
                hint: 'Password',
                icon: Icons.email_outlined,
                validator: (val) => '',
                controller: pwdController,
                onPwdTap: () {}),
            const SizedBox(
              height: 30,
            ),
            AppButton(
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    getFlushBar(context, title: 'Email can not be empty');
                    return;
                  } else if (pwdController.text.isEmpty) {
                    getFlushBar(context, title: 'Password can not be empty');
                    return;
                  } else {
                    LoginCallBacks.loginUser(
                        context: context,
                        data: data,
                        email: emailController.text,
                        auth: auth,
                        password: pwdController.text);
                  }
                },
                text: 'Sign In'),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                NavigationHelper.pushRoute(context, const SignUpView());
              },
              child: RichText(
                text: const TextSpan(
                    text: 'Don’t have an account?',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 2),
                    children: [
                      TextSpan(text: ' Sign Up'),
                    ]),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
