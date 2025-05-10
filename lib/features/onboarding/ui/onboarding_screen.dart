import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/onboarding/ui/widgets/button_next_and_skip.dart';
import 'package:jobizz/features/onboarding/ui/widgets/onboarding_page_view.dart';
import 'package:jobizz/features/onboarding/ui/widgets/smooth_indicator_page.dart';

import '../../../core/helper/size_box.dart';
import '../data/model/demo_data.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;

  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/circle.png',
              width: double.infinity,
              height: 150.h,
              fit: BoxFit.cover,
              cacheHeight:
                  (150 * MediaQuery.of(context).devicePixelRatio).round(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    physics: const BouncingScrollPhysics(),
                    controller: _pageController,
                    itemCount: onBoardingModelList.length,
                    itemBuilder: (context, index) {
                      return  OnBoardingPageView(
                        model: onBoardingModelList[index],
                      );
                    },
                  ),
                ),
                // Indicator page
                SmoothIndicatorPages(pageController: _pageController),
                verticalSpace(30), // Add spacing between elements
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
                  child: ButtonNextAndSkip(
                    pageController: _pageController,
                    currentIndex: currentIndex,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
