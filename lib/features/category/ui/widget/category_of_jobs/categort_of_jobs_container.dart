// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jobizz/core/helper/size_box.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/core/theming/styles.dart';
import 'package:jobizz/features/category/data/model/category_response.dart';

class CategoryOfJobsContainer extends StatelessWidget {
  const CategoryOfJobsContainer({
    super.key,
    this.categoryItem,
  });
  final Category? categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsApp.whiteColor,
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: -10,
          ),
        ],
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: ColorsApp.backGroundWhite,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.network(
                    '${categoryItem?.image}',
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${categoryItem?.jobsCount.toString()} Jobs',
                            style: TextStyles.font13LightBlueMedium,
                          ),
                          Text(
                            '${categoryItem?.companiesCount.toString()} Companies',
                            style: TextStyles.font12Gray,
                          ),
                        ],
                      ),
                      verticalSpace(8.h),
                      Text(
                        '${categoryItem?.description} Companies',
                        style: TextStyles.font14Black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
