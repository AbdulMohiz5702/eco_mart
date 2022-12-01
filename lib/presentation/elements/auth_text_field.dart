import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/front_end_config.dart';

class AuthTextField extends StatelessWidget {
  final String hint;
  final bool isPasswordField;
  final IconData icon;
  final bool visible;
  final Function(String) validator;
  final TextEditingController controller;
  final VoidCallback onPwdTap;
  final bool cVisible;
  bool isNumberField;
  final TextInputType keyBoardType;

  AuthTextField(
      {required this.hint,
      required this.icon,
      this.isNumberField = false,
      required this.validator,
      required this.controller,
      required this.onPwdTap,
      this.isPasswordField = false,
      this.visible = true,
      this.keyBoardType = TextInputType.text,
      this.cVisible = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (val) => validator(val!),
            controller: controller,
            keyboardType: keyBoardType,
            inputFormatters:
                isNumberField ? [FilteringTextInputFormatter.digitsOnly] : null,
            obscureText: !visible,
            style: const TextStyle(
                letterSpacing: 3,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: hint,
              fillColor: Colors.white,
              filled: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
              border:  InputBorder.none,
              enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
              ),
              focusedErrorBorder:  OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,),
              prefixIcon: Icon(icon, size: 18),
            ),
          )
        ],
      ),
    );
  }
}
