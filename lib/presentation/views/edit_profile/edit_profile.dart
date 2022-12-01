import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/presentation/elements/app_button.dart';
import 'package:eco_mart/presentation/elements/auth_text_field.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: AppButton(onPressed: () {  }, text: 'Update Profile',),
      ),
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: FrontEndConfigs.kPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  CustomText(
                    text: 'Edit Profile',
                    color: Colors.white,
                  ),
                  CustomText(text: '')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: CircleAvatar(
              radius: 60,
            ),
          ),
          SizedBox(height: 30,),
          AuthTextField(
              hint: 'Full Name',
              icon: Icons.email_outlined,
              validator: (val) => '',
              controller: nameController,
              onPwdTap: () {}),
          SizedBox(
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
              hint: 'Mobile Number',
              icon: Icons.email_outlined,
              validator: (val) => '',
              controller: phoneController,
              onPwdTap: () {}),
        ],
      ),
    );
  }
}
