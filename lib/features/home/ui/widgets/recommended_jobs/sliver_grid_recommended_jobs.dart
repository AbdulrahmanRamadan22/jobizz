import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/home/data/model/home_response_model.dart';

import 'recommended_jobs_item.dart';

class SliverGridRecommendedJobs extends StatelessWidget {
  const SliverGridRecommendedJobs({super.key, this.recommendedJobs});

  final List<Jop?>? recommendedJobs;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.w, // Horizontal spacing between items
          mainAxisSpacing: 10.h, // Vertical spacing between items
          // childAspectRatio: 0.9, // Width/height ratio of each item
        ),
        delegate: SliverChildBuilderDelegate(
          addAutomaticKeepAlives: true, // Preserves state
          addRepaintBoundaries: true, // Improves scrolling performance
          childCount: (recommendedJobs?.length ?? 0) > 4
              ? 4
              : recommendedJobs?.length ?? 0,
          (context, index) {
            return RecommendedJobsItem(
              jop: recommendedJobs?[index],
            );
          },
        ),

    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.w, // Horizontal spacing between items
        mainAxisSpacing: 10.h, // Vertical spacing between items
        // childAspectRatio: 0.9, // Width/height ratio of each item
      ),
      delegate: SliverChildBuilderDelegate(
        addAutomaticKeepAlives: true, // Preserves state
        addRepaintBoundaries: true, // Improves scrolling performance
        childCount:recommendedJobs!.length >= 4? 4 : recommendedJobs!.length,
        (context, index) {
          return RecommendedJobsItem(
            jop: recommendedJobs?[index],
          );
        },

      ),
    );
  }
}
