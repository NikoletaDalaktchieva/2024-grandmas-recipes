import "package:flutter/material.dart";
import "package:project1/constants/app_colors.dart";

class AddButton extends StatelessWidget {
  final String text;
  const AddButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Add your functionality here
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.elementColor),
        foregroundColor: WidgetStateProperty.all(AppColors.textColor),
      ),
      icon: const Icon(
        Icons.add,
        size: 24.0,
        color: AppColors.textColor,
      ),
      label: const Text("Add recipe"),
    );
  }
}
