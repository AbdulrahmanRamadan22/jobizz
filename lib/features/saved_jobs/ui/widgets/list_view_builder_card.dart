import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class ListViewBuilderCard extends StatelessWidget {
  const ListViewBuilderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsApp.whiteColor,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: ColorsApp.lightGray,
                  width: 0.7,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: ColorsApp.backGroundWhite,
                        radius: 30.r,
                        child: SvgPicture.asset('assets/svgs/Logo_google.svg'),
                      ),
                      title: Text(
                        'UX Designer',
                        style: TextStyles.font14Black,
                      ),
                      subtitle: Text(
                        'Google',
                        style: TextStyles.font14Gray,
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            r'$88,000/y',
                            style: TextStyles.font12DarkBlack,
                          ),
                          verticalSpace(4),
                          Text(
                            'Los Angeles, US',
                            style: TextStyles.font14Gray,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          decoration: BoxDecoration(
                            color: ColorsApp.lightBlue2,
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                          child: Center(
                            child: Text(
                              'Applied',
                              style: TextStyles.font13LightBlueMedium,
                            ),
                          ),
                        ),
                        Text(
                          'Part-time',
                          style: TextStyles.font14Gray,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
