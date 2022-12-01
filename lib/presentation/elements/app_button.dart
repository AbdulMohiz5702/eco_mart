import 'package:eco_mart/config/front_end_config.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  VoidCallback onPressed;
  String text;
  double width;
  double height;
  Color color;
  bool showIcon;
  Color textColor;

  AppButton(
      {required this.onPressed,
      required this.text,
        this.showIcon = false,
        this.color = FrontEndConfigs.kPrimaryColor,
        this.textColor =Colors.white,
      this.width = double.infinity,
      this.height = 45});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(
            side:  BorderSide(color: color),
            borderRadius: BorderRadius.circular(8),
          )),
      onPressed: onPressed,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showIcon?const Icon(Icons.search,size: 22,color: Colors.white,):const SizedBox(),
          const SizedBox(width: 5,),
          Text(text,style: TextStyle(color: textColor,letterSpacing: 3,fontSize: 14),),

        ],
      ),
    );
  }
}
