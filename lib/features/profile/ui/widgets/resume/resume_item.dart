import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/cache/constants.dart';
import '../../../../../core/cache/shared_pref.dart';
import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/profile_response_model.dart';


class ResumeItem extends StatelessWidget {
  const ResumeItem({
    super.key,
    this.cv,
  });

  final Cv? cv;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.pdfViewScreen, arguments: cv?.path);
      },
      child: Card(
        color: ColorsApp.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: ColorsApp.mainBlue,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        cv?.type ?? '',
                        style: TextStyles.font10White,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(cv?.name ?? '', style: TextStyles.font14Black),
                      Text(
                          '${SharedPrefHelper.getData(key: SharedPrefKeys.titleJob) ?? ""}',
                          style: TextStyles.font10Gray),
                    ],
                  ),
                  Container(
                    width: 60.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: ColorsApp.mainBlue,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        'PDF',
                        style: TextStyles.font10White,
                      ),
                    ),
                  ),
                ],
              ),
              // verticalSpace(10),
              // Text(
              //   'Creative UX Designer with 6+ years of experience in optimizing user experience through innovative solutions and dynamic interface designs. Successful in enhancing user engagement for well-known brands, providing a compelling user experience to improve brand loyalty and customer retention.  ',
              //   style: TextStyles.font9Gray,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
