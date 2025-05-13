// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class RowTextAndSeeAll extends StatelessWidget {
  const RowTextAndSeeAll({
    super.key,
    required this.text,
    this.textStyle,
    this.seeAllTextStyle,
    required this.onPressed,
  });
  final String text;
  final TextStyle? textStyle;
  final TextStyle? seeAllTextStyle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyles.font16DarkBlackSemiBold,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "See all",
              style: TextStyles.font14Gray,
            ),
          ),
        ],
      ),
    );
  }
}
