import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';

class ButtonNextAndSkip extends StatelessWidget {
  const ButtonNextAndSkip({
    super.key,
    required this.pageController,
    this.currentIndex = 0,
  });

  final PageController pageController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.loginScreen);
          },
          child: Text('Skip', style: TextStyles.font16Gray),
        ),
        AppTextButton(
          borderRadius: 5.r,
          buttonWidth: 158.w,
          buttonHeight: 55.h,
          buttonText: currentIndex < 3 ? 'Next' : 'Get Started',
          textStyle: TextStyles.font16White,
          onPressed: () {
            if (pageController.page! < 3) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              );
            } else {
              context.pushReplacementNamed(Routes.loginScreen);
            }
          },
        ),
      ],
    );
  }
}
