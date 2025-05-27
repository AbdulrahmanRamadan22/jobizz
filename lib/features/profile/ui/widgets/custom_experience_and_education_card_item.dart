import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CustomExperienceAndEducationCardItem extends StatelessWidget {
  const CustomExperienceAndEducationCardItem({
    super.key,
    required this.leadingImage,
    required this.titleText,
    required this.subtitleText,
    required this.locationText,
    required this.dateText,
  });

  final String leadingImage;
  final String titleText;
  final String subtitleText;
  final String locationText;
  final String dateText;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(
            color: ColorsApp.lightGray,
            width: 0.7,
          )),
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.h,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image.network(
            leadingImage,
            height: 40.h,
            width: 40.w,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          titleText,
          maxLines: 1,
          style: TextStyles.font14Black,
        ),
        subtitle: Text(
          subtitleText,
          style: TextStyles.font12Gray,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locationText,
              style: TextStyles.font12DarkBlack,
            ),
            verticalSpace(4),
            Text(
              dateText,
              style: TextStyles.font12Gray,
            ),
          ],
        ),
      ),
    );
  }
}
