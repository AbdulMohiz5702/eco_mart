import 'package:eco_mart/config/front_end_config.dart';
import 'package:eco_mart/navigationHelper/navigation_helper.dart';
import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:eco_mart/presentation/elements/custom_text_field.dart';
import 'package:eco_mart/presentation/views/bottom_nav/bottom_nav_body.dart';
import 'package:flutter/material.dart';

class AddLocationBody extends StatelessWidget {
  const AddLocationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 140,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Enter Location',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 3,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        text: 'City/Brgy',
                        color: Colors.white,
                        fillColor: FrontEndConfigs.kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        text: 'Street',
                        color: Colors.white,
                        fillColor: FrontEndConfigs.kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: const Text(
                          'Add Address',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 3,
                              fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
