import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/infrastructure/models/user_model.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/elements/get_user_id.dart';
import 'package:eco_mart/presentation/views/auth/login/login_view.dart';
import 'package:eco_mart/presentation/views/edit_profile/edit_profile.dart';
import 'package:eco_mart/presentation/views/my_addresses/my_addresses.dart';
import 'package:eco_mart/presentation/views/payment/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../infrastructure/services/user_services.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return StreamProvider.value(
      initialData: UserModel(),
      value: UserServices().fetchUserData(getUserID()),
      builder: (context, child) {
        UserModel userModel = context.watch<UserModel>();
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: CustomText(
                text: userModel.name.toString(),
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
              )),
              const SizedBox(
                height: 2,
              ),
              Center(
                  child: CustomText(
                text: '03368835261',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: 3,
              )),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    NavigationHelper.pushRoute(context, EditProfile());
                  },
                  child: _getCard(context, 'Edit Profile')),
              GestureDetector(
                  onTap: () {
                    NavigationHelper.pushRoute(context, const MyAddresses());
                  },
                  child: _getCard(context, 'My Addresses')),
              GestureDetector(
                  onTap: () {
                    NavigationHelper.pushRoute(context, PaymentView());
                  },
                  child: _getCard(context, 'Payment')),
              GestureDetector(
                  onTap: () {
                    UserServices().signOut().then((value) {
                      NavigationHelper.removeAllRoutes(context, LoginView());
                    });
                  },
                  child: _getCard(context, 'Log out')),
              _getCard(context, 'About Us'),
            ],
          ),
        );
      },
    );
  }

  Widget _getCard(BuildContext context, String text) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: CustomText(
            text: text,
          ),
        ),
      ),
    );
  }
}
