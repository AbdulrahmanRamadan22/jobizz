import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class SliverListInterView extends StatelessWidget {
  const SliverListInterView({
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
              leading: CircleAvatar(
                radius: 25.r,
                backgroundColor: ColorsApp.backGroundWhite,
                child: SvgPicture.asset(
                  'assets/svgs/Logo_google.svg',
                ),
              ),
              title: Text.rich(
                TextSpan(
                  text: 'Congratulations! ',
                  style: TextStyles.font12Gray,
                  children: [
                    TextSpan(
                      text: 'Beats',
                      style: TextStyles.font12DarkBlack,
                    ),
                    TextSpan(
                      text:
                          'liked your resume and want to take an interview of you.',
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1} hrs ago',
                      style: TextStyles.font12Gray,
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
