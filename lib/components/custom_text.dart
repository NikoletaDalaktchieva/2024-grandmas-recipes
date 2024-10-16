import 'package:flutter/material.dart';
import 'package:project1/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomText(this.text, {super.key, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
          fontSize: fontSize,
        ));
  }
}
