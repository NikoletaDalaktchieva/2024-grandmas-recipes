import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:project1/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final String name;
  final String hintText;
  final double fontSize;
  final int maxLines;
  final bool requiredField;
  final double? width;

  const CustomTextField({
    super.key,
    required this.initialValue,
    required this.name,
    required this.hintText,
    this.fontSize = 16,
    this.maxLines = 1,
    this.requiredField = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: FormBuilderTextField(
          name: name,
          initialValue: initialValue,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
          ),
          style: TextStyle(
            fontSize: fontSize,
            color: AppColors.textColor,
          ),
          autovalidateMode: AutovalidateMode.always,
          validator: requiredField ? FormBuilderValidators.required() : null,
        ));
  }
}
