import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';


class SliverListEducation extends StatelessWidget {
  const SliverListEducation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 2,
        (context, index) {
          return Card(
            color: ColorsApp.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0.w,
                  vertical: 8.h,
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: SvgPicture.asset(
                    'assets/svgs/Logo_google.svg',
                    height: 50.h,
                    width: 50.w,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  'Computer Science',
                  style: TextStyles.font14Black,
                ),
                subtitle: Text(
                  'Bachelor | Caltech',
                  style: TextStyles.font12Gray,
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'San Jose, US',
                      style: TextStyles.font14Black,
                    ),
                    verticalSpace(4),
                    Text(
                      'Dec 20 - Feb 21',
                      style: TextStyles.font12Gray,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
