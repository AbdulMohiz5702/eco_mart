import 'package:eco_mart/presentation/elements/custom_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String image;
  String title;
  String prize;

  ProductCard({required this.image, required this.title, required this.prize});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
                child: Center(child: Image.asset(image))),
            CustomText(text: title),
            CustomText(text: 'By Weight ,P220/kg'),
            const SizedBox(
              height: 10,
            ),
            CustomText(text: prize),
          ],
        ),
      ),
    );
  }
}
