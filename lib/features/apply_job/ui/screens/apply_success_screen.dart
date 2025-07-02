import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';

class ApplySuccessScreen extends StatelessWidget {
  const ApplySuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 100.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/apply_success.png'),
            Text('successful', style: TextStyles.font24DarkBlack),
            verticalSpace(12),
            Text(
                textAlign: TextAlign.center,
                'You’ve successfully applied to Spotify UX Intern role.',
                style: TextStyles.font16Gray),
            verticalSpace(50),
            AppTextButton(
              buttonHeight: 56.h,
              borderRadius: 5.r,
              buttonText: 'Track',
              textStyle: TextStyles.font16White,
              onPressed: () {
                context.pushNamed(Routes.appliedJobDetailsScreen);
              },
            ),
            verticalSpace(20),
            AppTextButton(
              backgroundColor: Colors.transparent,
              buttonHeight: 56.h,
              borderRadius: 5.r,
              buttonText: 'Browse Jobs',
              textStyle: TextStyles.font16Black,
              onPressed: () {
                context.pushNamedAndRemoveUntil(Routes.layoutScreen,
                    predicate: (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
