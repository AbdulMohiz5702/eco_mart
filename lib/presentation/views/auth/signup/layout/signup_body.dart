import 'package:eco_mart/infrastructure/models/user_model.dart';
import 'package:eco_mart/infrastructure/providers/app_state.dart';
import 'package:eco_mart/infrastructure/providers/create_provider.dart';
import 'package:eco_mart/infrastructure/providers/error_provider.dart';
import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:eco_mart/presentation/elements/auth_text_field.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/elements/error_dialog.dart';
import 'package:eco_mart/presentation/elements/flush_bar.dart';
import 'package:eco_mart/presentation/elements/navigation_dialog.dart';
import 'package:eco_mart/presentation/views/auth/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phonelController = TextEditingController();
TextEditingController pwdController = TextEditingController();

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User?>(context);
    SignUpProvider signUp = Provider.of<SignUpProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/splash.png'),
            CustomText(
              text: 'Create an account',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 4,
            ),
            const SizedBox(
              height: 50,
            ),
            AuthTextField(
                hint: 'Full Name',
                icon: Icons.email_outlined,
                validator: (val) => '',
                controller: nameController,
                onPwdTap: () {}),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            AuthTextField(
                hint: 'Mobile Number',
                icon: Icons.email_outlined,
                validator: (val) => '',
                controller: phonelController,
                onPwdTap: () {}),
            const SizedBox(
              height: 30,
            ),
            AppButton(
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    getFlushBar(context, title: 'Name Can not be empty');
                    return;
                  } else if (emailController.text.isEmpty) {
                    getFlushBar(context, title: 'Email Can not be empty');
                    return;
                  } else if (pwdController.text.isEmpty) {
                    getFlushBar(context, title: 'Password Can not be empty');
                    return;
                  } else if (phonelController.text.isEmpty) {
                    getFlushBar(context, title: 'Phone Can not be empty');
                    return;
                  } else {
                    _signUpUser(context: context, signUp: signUp, user: user);
                  }
                },
                text: 'Sign Up'),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: const TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        letterSpacing: 2),
                    children: [
                      TextSpan(text: ' Sign In'),
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

  _signUpUser(
      {required BuildContext context,
      required SignUpProvider signUp,
      required User? user}) async {
    Provider.of<AppState>(context, listen: false)
        .stateStatus(StateStatus.IsBusy);
    await signUp
        .registerNewUser(
            email: emailController.text,
            password: pwdController.text,
            userModel: UserModel(
              name: nameController.text,
              email: emailController.text,
              phoneNumber: phonelController.text,
              image: '',
              address: '',
            ),
            context: context,
            user: user)
        .then((user) async {
      Provider.of<AppState>(context, listen: false)
          .stateStatus(StateStatus.IsFree);
      if (signUp.status == SignUpStatus.Registered) {
        showNavigationDialog(context,
            message: "Thanks for registering!.",
            buttonText: "Go to Login", navigation: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
        }, secondButtonText: "", showSecondButton: false);
      } else if (signUp.status == SignUpStatus.Failed) {
        showErrorDialog(context,
            message: Provider.of<ErrorString>(context, listen: false)
                .getErrorString());
      }
    });
  }
}
