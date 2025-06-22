// lib/features/home/ui/widgets/search_and_filter.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/form_field_app_text.dart';

class SearchAndFilter extends StatelessWidget {
  final VoidCallback onSearchTap;

  const SearchAndFilter({
    super.key,
    required this.onSearchTap,
    //  this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onSearchTap,
              child: AbsorbPointer(
                child: AppTextFormField(
                  controller: TextEditingController(),

                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorsApp.gray,
                    size: 25.sp,
                  ),
                  hintText: 'Search a job or position',
                  hintStyle: TextStyles.font14Gray,
                  validator: (value) {
                    return null;
                  }, // الـ validator يجب أن يعيد String? أو null
                ),
              ),
            ),
          ),
          horizontalSpace(10),
          // GestureDetector(
          //   onTap: onFilterTap, // استدعاء دالة الفلتر الممررة (إذا وجدت)
          //   child: Container(
          //     padding: EdgeInsets.all(8),
          //     height: 55.h,
          //     width: 55.w,
          //     decoration: BoxDecoration(
          //       border: Border.all(color: ColorsApp.lightGray),
          //       color: ColorsApp.mistyGrey,
          //       borderRadius: BorderRadius.circular(16.r),
          //     ),
          //     child: SvgPicture.asset(
          //       "assets/svgs/filter_list_search.svg",
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
