// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';

import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';

import 'package:jobizz/core/helper/extensions.dart';

import 'package:jobizz/features/category/ui/widget/category_of_jobs/job_category_item.dart';

import '../../../../../core/routing/routers_string.dart';
import '../../../../jobs/data/models/job.dart';

class FeatureJobsCategory extends StatelessWidget {
  const FeatureJobsCategory({
    super.key,
    this.featureJobList,
  });
  final List<Job>? featureJobList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Featured Jobs',
          style: TextStyles.font16DarkBlackSemiBold,
        ),
        // RowTextAndSeeAll(
        //   text: 'Featured Jobs',
        //   onPressed: () {},
        // ),
        verticalSpace(10.h),
        if (featureJobList == null || featureJobList!.isEmpty)
          Center(
            heightFactor: 2.3,
            child: Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: ColorsApp.red,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: Text(
                'No Found Jobs',
                style: TextStyles.font16WhiteSemiBold,
                textAlign: TextAlign.center,
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: featureJobList?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final job = featureJobList?[index];
              return GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.jobDetailsScreen,
                    arguments: job,
                  );
                },
                child: JobCategoryItem(
                  job: job,
                ),
              );
            },
          ),
      ],
    );
  }
}
