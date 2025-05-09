import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';
import '../../data/model/onboarding_model.dart';


class TitleAndSubTitle extends StatelessWidget {
  const TitleAndSubTitle({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: TextStyles.font28DarkBlackSemiBold,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(model.description,
              textAlign: TextAlign.center, style: TextStyles.font14Gray),
        ),
      ],
    );
  }
}
