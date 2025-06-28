import 'package:edge_market/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'custom_text_field_model.dart';

class CustomTextField extends StackedView<CustomTextFieldModel> {
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool obscureText;
  final String? title;
  final String? borderTitle;
  final InputBorder? border;
  final int maxLines;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextInputType keyboardType;
  final Color? bgClr;
  final Color? textClr;
  final Color? hintTextClr;
  final BorderSide? borderSide;
  final bool isReadOnly; // Flag for read-only mode
  final bool autoFocus; // Flag for auto-focus
  final String? Function(String?)? validator; // Validation function

  const CustomTextField({
    super.key,
    this.title,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.bgClr,
    this.textClr,
    this.hintTextClr,
    this.borderSide,
    this.textStyle,
    this.prefix,
    this.border,
    this.borderTitle,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.isReadOnly = false, // Default to editable
    this.autoFocus = false, // Default to no autofocus
    this.validator,
  });

  @override
  Widget builder(
    BuildContext context,
    CustomTextFieldModel viewModel,
    Widget? child,
  ) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      readOnly: isReadOnly, // Use the read-only flag
      autofocus: autoFocus, // Use the auto-focus flag
      onChanged: validator,
      cursorColor: kcPrimaryColor, // Use the validator if provided
      style: textStyle ??
          TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textClr ?? kcWhiteColor),
      decoration: InputDecoration(
        prefixIcon: prefix,
        hintText: title ?? '',
        labelText: borderTitle,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: hintTextClr ?? Colors.white38,
        ),
        fillColor: bgClr ?? const Color(0xFF1E1E1E),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        border: border ??
            OutlineInputBorder(
                borderSide: borderSide ?? const BorderSide(color: kcLightGrey),
                borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kcPrimaryColor),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kcPrimaryColor),
            borderRadius: BorderRadius.circular(15)),
        alignLabelWithHint: true,
        suffixIcon: suffixIcon,
      ),
    );
  }

  @override
  CustomTextFieldModel viewModelBuilder(BuildContext context) =>
      CustomTextFieldModel();
}
