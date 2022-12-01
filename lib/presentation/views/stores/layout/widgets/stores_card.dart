import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:flutter/material.dart';

class StoreCards extends StatelessWidget {
  String image;
  String name;

  StoreCards({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image:  DecorationImage(
            image: AssetImage(image), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xff649B00),
                  Color(0xff649B00).withOpacity(0.3),
                ],
              ),
            ),
            child: Center(
                child: CustomText(
              text: name,
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
    );
  }
}
