// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/home/ui/widgets/featured_jobs/salary_and_location.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/model/home_response_model.dart';
import 'button_card_feature_job.dart';

class FeaturedJobsItem extends StatelessWidget {
  const FeaturedJobsItem({super.key, required this.job});

  final Jop? job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: GestureDetector(
        onTap: () {
          // context.pushNamed(Routes.jobDetailsScreen);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorsApp.darkBlue,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    '${job?.title}',
                    style: TextStyles.font16WhiteSemiBold,
                    maxLines: 1,
                  ),
                  subtitle: Text('${job?.companyName}',
                      style: TextStyles.font13White),
                  leading: Container(
                    height: 50.h,
                    width: 50.w,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorsApp.backGroundWhite,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Image.network(
                      '${job?.companyLogo}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_add,
                      color: ColorsApp.lightGray,
                    ),
                  ),
                ),
              ),
              // Buttons
              // ThreeButtonsInPageView(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8.w,
                  children: [
                    ButtonCardFeaturedJob(title: '${job?.categoryName}'),
                    ButtonCardFeaturedJob(title: '${job?.jobType}'),
                    ButtonCardFeaturedJob(title: '${job?.position}'),
                  ],
                ),
              ),
              SalaryAndLocation(
                location: job?.location,
                salary: job?.salary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

