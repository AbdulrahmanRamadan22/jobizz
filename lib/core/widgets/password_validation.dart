import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/size_box.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';


class PasswordValidations extends StatelessWidget {
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialChar,
    required this.hasMinLength,
  });
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialChar;
  final bool hasMinLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow(' At Least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 UpperCase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At Least 1 Number letter', hasNumber),
        verticalSpace(2),
        buildValidationRow('At Least 8 MinLength letter', hasMinLength),
        verticalSpace(2),
        buildValidationRow('At Least 1 SpecialChar letter', hasSpecialChar),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasvalidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5.r,
          backgroundColor: hasvalidated ? ColorsApp.green : ColorsApp.mainBlue,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font12Gray.copyWith(
            decoration: hasvalidated ? TextDecoration.lineThrough : null,
            color: hasvalidated ? ColorsApp.gray : ColorsApp.black,
            decorationColor: Colors.green,
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 5,
          ),
        ),
      ],
    );
  }
}