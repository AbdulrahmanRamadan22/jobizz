import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';


class SliverListResume extends StatelessWidget {
  const SliverListResume({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) {
          return Card(
            color: ColorsApp.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 12.w, vertical: 15.h),
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
                            'Cv',
                            style: TextStyles.font10White,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('Abo Tarek',
                              style: TextStyles.font14Black),
                          Text('Flutter Developer',
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
                  verticalSpace(10),
                  Text(
                    'Creative UX Designer with 6+ years of experience in optimizing user experience through innovative solutions and dynamic interface designs. Successful in enhancing user engagement for well-known brands, providing a compelling user experience to improve brand loyalty and customer retention.  ',
                    style: TextStyles.font9Gray,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
