import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../jobs/data/models/job.dart';

class PopularJobsItem extends StatelessWidget {
  const PopularJobsItem({super.key, this.jop});

  final Job? jop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          Routes.jobDetailsScreen,
          arguments: jop,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsApp.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: ColorsApp.lightGray, width: 0.7),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Row(
              children: [
                // Company Logo
                CircleAvatar(
                  backgroundColor: ColorsApp.backGroundWhite,
                  radius: 28.r,
                  child: Image.network(
                    jop?.companyLogo ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.w),
                // Job Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${jop?.categoryName}',
                        style: TextStyles.font14DarkBlackSemiBold,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        '${jop?.companyName}',
                        style: TextStyles.font12GrayMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                // Salary and Location
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${jop?.salary}/y',
                      style: TextStyles.font12DarkBlack,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '${jop?.location}',
                      style: TextStyles.font12GrayMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
