import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/home/ui/widgets/featured_jobs/button_card_feature_job.dart';
import 'package:jobizz/features/job_details/widgets/container_back_ground.dart';
import 'package:jobizz/features/job_details/widgets/row_icons.dart';

import '../../jobs/data/models/job.dart';

class StackImageTitleButtons extends StatelessWidget {
  const StackImageTitleButtons({super.key, this.job});
  final Job? job;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container
        ContainerBackGround(),
        // Positioned image
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/Mask Group.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60.h,
          left: 15.w,
          right: 15.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RowIcons(
                job: job,
                
              ),
              CircleAvatar(
                backgroundColor: ColorsApp.whiteColor,
                radius: 42.r,
                child: Image.network(
                  job?.companyLogo ?? 'nooo',
                  fit: BoxFit.cover,
                  height: 45.h,
                ),
              ),
              verticalSpace(10),
              Text('${job?.categoryName}', style: TextStyles.font20WhiteBold),
              Text('${job?.companyName}', style: TextStyles.font14Gray),
              verticalSpace(15),
              Row(
                spacing: 8.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCardFeaturedJob(title: job?.title ?? ''),
                  ButtonCardFeaturedJob(title: job?.jobType ?? ''),
                  ButtonCardFeaturedJob(title: job?.position ?? ''),
                ],
              ),
              verticalSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('\$${job?.salary}/year', style: TextStyles.font16White),
                  Text('${job?.location}', style: TextStyles.font16White),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
