import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/constants/app_colors.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: FloatingActionButton(
        onPressed: () => Get.toNamed("/add_recipe"),
        backgroundColor: AppColors.backgroundColor,
        tooltip: 'Add recipe',
        child: const Icon(
          Icons.add,
          size: 30.0,
          color: AppColors.textColor,
        ),
      ),
    );
  }
}
