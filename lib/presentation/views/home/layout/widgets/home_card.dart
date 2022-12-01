import 'package:eco_mart/config/front_end_config.dart';
import 'package:flutter/material.dart';

import '../../../../elements/custom_text.dart';

class HomeCard extends StatelessWidget {
  String image;
  String text;


  HomeCard({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: FrontEndConfigs.kPrimaryColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(image),
            SizedBox(
              height: 5,
            ),
            CustomText(text: text,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
