import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CustomCardDataIsEmpty extends StatelessWidget {
  const CustomCardDataIsEmpty({super.key, this.onTap, this.title});

  final void Function()? onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: ColorsApp.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: ColorsApp.lightGray,
          width: 0.7,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title',
              style: TextStyles.font12Gray,
            ),
            GestureDetector(
              onTap: onTap,
              child: const CircleAvatar(
                backgroundColor: ColorsApp.mistyGrey,
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: ColorsApp.mainBlue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
