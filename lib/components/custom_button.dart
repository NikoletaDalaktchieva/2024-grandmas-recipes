import 'package:flutter/material.dart';
import 'package:project1/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String btnLabel;
  final Function pressFunction;

  const CustomButton(this.btnLabel, this.pressFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => pressFunction(),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.textColor),
        foregroundColor: WidgetStateProperty.all(AppColors.elementColor),
      ),
      child: Text(btnLabel),
    );
  }
}
