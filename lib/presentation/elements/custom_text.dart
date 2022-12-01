import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double fontSize;
  double letterSpacing;
  FontWeight fontWeight;
  TextAlign textAlign;

  CustomText({required this.text,
    this.color,
    this.textAlign = TextAlign.start,
    this.fontSize = 14,
    this.letterSpacing = 1.2,
    this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      ),
    );
  }
}
