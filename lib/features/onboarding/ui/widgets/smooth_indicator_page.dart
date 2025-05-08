import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors.dart';
import '../../data/model/demo_data.dart';

class SmoothIndicatorPages extends StatelessWidget {
  const SmoothIndicatorPages({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: onBoardingModelList.length,
      effect: const WormEffect(
        dotColor: ColorsApp.lightBlueGray,
        activeDotColor: ColorsApp.darkBlue,
        dotHeight: 8,
        dotWidth: 25,
      ),
    );
  }
}
