import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';

import '../../../data/model/home_response_model.dart';
import 'Featured_jobs_item.dart';

class SliverListFeaturedJobs extends StatelessWidget {
  SliverListFeaturedJobs({super.key, this.jobs});

  final PageController _pageController = PageController();

  final List<Jop?>? jobs;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 185.h, // حجم PageView
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: jobs?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FeaturedJobsItem(
                      job: jobs?[index],
                    );
                  },
                ),
              ),
              verticalSpace(16),
              // SmoothPageIndicator
              SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: ColorsApp.lightGray,
                  activeDotColor: ColorsApp.mainBlue,
                ),
              ),
            ],
          );
        },
        childCount: 1,
      ),
    );
  }
}
