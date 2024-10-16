import 'package:flutter/material.dart';
import 'package:project1/constants/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final bool bold;
  final bool italic;

  const CustomText(this.text,
      {super.key, this.fontSize = 16, this.bold = false, this.italic = false});

  @override
  Widget build(BuildContext context) {
    return Text(text ?? "",
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : null,
          fontStyle: italic ? FontStyle.italic : null,
          color: AppColors.textColor,
          fontSize: fontSize,
        ));
  }
}
