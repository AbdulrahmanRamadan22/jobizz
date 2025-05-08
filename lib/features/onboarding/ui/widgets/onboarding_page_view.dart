import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/onboarding/data/model/onboarding_model.dart';
import 'package:jobizz/features/onboarding/ui/widgets/title_and_sub_title.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 65.h),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              model.image,
              width: double.infinity,
              cacheWidth: (MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio)
                  .round(),
            ),
          ),
          TitleAndSubTitle(model: model),
        ],
      ),
    );
  }
}
