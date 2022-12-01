import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/views/add_location/add_location_view.dart';
import 'package:flutter/material.dart';

class MyAddresses extends StatelessWidget {
  const MyAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FrontEndConfigs.kSecondaryColor,
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
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
                    text: 'My Addresses',
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
          CustomText(
            text: 'Saved Address',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              NavigationHelper.pushRoute(context, AddLocationView());
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Add Address'),
                    Icon(
                      Icons.add,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
