import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/form_field_app_text.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              controller: TextEditingController(),
              prefixIcon: Icon(
                Icons.search,
                color: ColorsApp.gray,
                size: 25.sp,
              ),
              hintText: 'Search a job or position',
              hintStyle: TextStyles.font14Gray,
              validator: (value) {},
            ),
          ),
          horizontalSpace(10),
          GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, FilterScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              height: 55.h,
              width: 55.w,
              decoration: BoxDecoration(
                border: Border.all(color: ColorsApp.lightGray),
                color: ColorsApp.mistyGrey,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SvgPicture.asset(
                "assets/svgs/filter_list_search.svg",
              ),
            ),
          )
        ],
      ),
    );
  }
}
