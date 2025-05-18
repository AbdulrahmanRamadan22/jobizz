// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/category/ui/widget/category_of_jobs/categort_of_jobs_container.dart';
import 'package:jobizz/features/category/ui/widget/category_of_jobs/featuer_jobs_category.dart';

import '../../data/model/category_response.dart';

class CategoryOfJobsScreen extends StatelessWidget {
  const CategoryOfJobsScreen({
    super.key,
    this.categoryItem,
  });
  final Category? categoryItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: ColorsApp.whiteColor,
        title: Text(
          '${categoryItem?.name} Jobs',
          style: TextStyles.font16DarkBlackSemiBold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryOfJobsContainer(
                categoryItem: categoryItem,
              ),
              verticalSpace(20.h),
              FeatureJobsCategory(
                featureJobList: categoryItem?.jobs ?? [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
