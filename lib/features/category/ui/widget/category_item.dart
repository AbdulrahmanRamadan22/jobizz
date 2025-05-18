// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/core/routing/routers_string.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/model/category_response.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    this.categoryItem,
  });

  final Category? categoryItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.categoryOfJobsScreen, arguments: categoryItem);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.whiteColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: ColorsApp.lightGray,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "${categoryItem?.image}",
                height: 45.h,
                fit: BoxFit.cover,
              ),
              Text(
                // overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                categoryItem?.name ?? ' not found',
                style: TextStyles.font14Black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
