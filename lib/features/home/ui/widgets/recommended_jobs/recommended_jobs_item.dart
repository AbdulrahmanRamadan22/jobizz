import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/routing/routers_string.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../jobs/data/models/job.dart';

class RecommendedJobsItem extends StatelessWidget {
  const RecommendedJobsItem({super.key, this.jop});

  final Job? jop;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.jobDetailsScreen,
          arguments: jop,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: ColorsApp.lightGray,
            width: 0.7,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: ColorsApp.whiteColor,
                radius: 28.r,
                child: Image.network(
                  jop?.companyLogo ?? '',
                  fit: BoxFit.cover,
                  height: 45.h,
                ),
              ),
              Text('${jop?.categoryName}',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyles.font14DarkBlackSemiBold),
              Text('${jop?.companyName}', style: TextStyles.font12GrayMedium),
              Text('\$${jop?.salary}/y', style: TextStyles.font12DarkBlack),
            ],
          ),
        ),
      ),
    );
  }
}
