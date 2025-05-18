// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/core/widgets/row_text_and_see_all.dart';
import 'package:jobizz/features/category/data/model/category_response.dart';
import 'package:jobizz/features/category/ui/widget/category_of_jobs/job_category_item.dart';

class FeatureJobsCategory extends StatelessWidget {
  const FeatureJobsCategory({
    super.key,
    this.featureJobList,
  });
  final List<Job>? featureJobList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTextAndSeeAll(
          text: 'Featured Jobs',
          onPressed: () {},
        ),
        if (featureJobList == null || featureJobList?.isEmpty == true)
          Container(
            alignment: Alignment.center,
            height: 150.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: ColorsApp.red,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              'No Found Jobs',
              style: TextStyles.font16WhiteSemiBold,
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
              return JobCategoryItem(
                job: job,
              );
            },
          ),
      ],
    );
  }
}
