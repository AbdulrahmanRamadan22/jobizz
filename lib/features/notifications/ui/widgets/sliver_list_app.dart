import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';


class SliverListApp extends StatelessWidget {
  const SliverListApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 3,
        (context, index) {
          return Card(
            elevation: 0,
            color: ColorsApp.backGroundWhite,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
              ),
              title: Text.rich(
                TextSpan(
                  text: 'Your application is submitted soccessfully to ',
                  style: TextStyles.font12Gray,
                  children: [
                    TextSpan(
                      text: 'BMW',
                      style: TextStyles.font12DarkBlack,
                    ),
                    TextSpan(
                      text: ' You can check the status here.',
                    )
                  ],
                ),
              ),
              leading: CircleAvatar(
                radius: 25.r,
                backgroundColor: ColorsApp.backGroundWhite,
                child: SvgPicture.asset(
                  'assets/svgs/Logo_google.svg',
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${index + 1} min ago',
                  style: TextStyles.font12Gray,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
