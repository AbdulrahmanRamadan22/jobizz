import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';

import '../../../../jobs/data/models/job.dart';

class JobCategoryItem extends StatelessWidget {
  const JobCategoryItem({
    super.key,
    this.job,
  });

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: ColorsApp.lightGray,
          width: 0.7,
        ),
      ),
      child: Column(
        spacing: 7,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorsApp.whiteColor,
            radius: 28.r,
            child: Image.network(
              job?.companyLogo ?? '',
              fit: BoxFit.cover,
              height: 45.h,
            ),
          ),
          Text(
            job?.categoryName ?? 'no Found',
            style: TextStyles.font12DarkBlack,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            job?.companyName ?? 'no Found',
            style: TextStyles.font14Gray,
            textAlign: TextAlign.center,
          ),
          Text(
            '\$${job?.salary}/y',
            style: TextStyles.font12DarkBlack,
          ),
        ],
      ),
    );
  }
}
