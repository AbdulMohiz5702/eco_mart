import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  String text;
  Color? fillColor;
  Color? color;

  TextEditingController? controller;

  CustomTextField({
    required this.text,
    this.fillColor = Colors.white,
    this.color,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(

        controller: controller,
        decoration: InputDecoration(
           contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 18),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          hintText: text,
          filled: true,
          fillColor: fillColor,
          hintStyle:  TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: color),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
