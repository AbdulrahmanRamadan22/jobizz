// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/styles.dart';

import '../theming/colors.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.keyboardType,
    this.controller,
    required this.validator,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,

      autofillHints: [
        AutofillHints.email,
      ],
      keyboardType: keyboardType,
      controller: controller,
      textDirection: textDirection,

      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.mainBlue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsApp.lightBlueGray,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),

        /// ToDo >>  عدل هنا حسب لون الفورم

        hintStyle: hintStyle ?? TextStyles.font16Black,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        /// ToDo >> background عدل هنا حسب لون  الفورم
        fillColor: backgroundColor ?? ColorsApp.backGroundWhite,
        filled: true,
      ),
      obscureText: isObscureText ?? false,

      /// ToDo >> text عدل هنا حسب لون  الفورم
      style: TextStyles.font14Black,

      validator: (value) => validator(value),
    );
  }
}
