// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/styles.dart';

import '../theming/colors.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final String? labelText;

  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final TextEditingController? controller;
  final Function(String?) validator;

  // maxLines
  int? maxLines;

  AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.keyboardType,
    this.controller,
    required this.validator,
    this.textDirection,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final bool isObscure = isObscureText ?? false;
    final int safeMaxLines = isObscure ? 1 : (maxLines ?? 1);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: safeMaxLines,

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
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
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

        // label: Text(
        //   hintText,
        //   style: hintStyle ??
        //       TextStyles.font14Gray.copyWith(color: ColorsApp.lightBlueGray),
        // ),

        /// ToDo >>  عدل هنا حسب لون الفورم

 prefixStyle: TextStyles.font14Red,
        hintStyle: hintStyle ??
            TextStyles.font14Gray.copyWith(color: ColorsApp.lightBlueGray),
            counterStyle: TextStyles.font14Red,
        // labelStyle: TextStyles.font14Gray,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor: ColorsApp.gray,
        suffixIconColor: ColorsApp.gray,
        labelText: labelText,

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
