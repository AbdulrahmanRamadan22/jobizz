import 'package:flutter/material.dart';
import 'package:jobizz/features/home/ui/widgets/featured_jobs/featured_jobs_see_all.dart';
import 'package:jobizz/features/home/ui/widgets/popular_jobs/popular_jobs_see_all.dart';
import 'package:jobizz/features/home/ui/widgets/popular_jobs/sliver_list_popular_jobs.dart';
import 'package:jobizz/features/home/ui/widgets/recommended_jobs/recommended_jobs_see_all.dart';

import '../../../../core/helper/size_box.dart';
import '../../data/model/home_response_model.dart';
import 'featured_jobs/sliver_list_featured_jobs.dart';
import 'recommended_jobs/sliver_grid_recommended_jobs.dart';

class SuccessJobs extends StatelessWidget {
  const SuccessJobs({
    super.key,
    required this.listFeaturedJobs,
    required this.listRecommendedJobs,
    required this.listPopularJobs,
  });

  final List<Jop?>? listFeaturedJobs;
  final List<Jop?>? listRecommendedJobs;
  final List<Jop?>? listPopularJobs;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ), // Better scroll feel
      // sliverPadding: EdgeInsets.zero,
      slivers: [
        SliverToBoxAdapter(
            child: FeaturedJobsSeeAll(
          onPressed: () {},
        )),
        SliverListFeaturedJobs(
          jobs: listFeaturedJobs,
        ),
        SliverToBoxAdapter(child: verticalSpace(10)),
        const SliverToBoxAdapter(child: RecommendedJobsSeeAll()),
        SliverGridRecommendedJobs(
          recommendedJobs: listRecommendedJobs,
        ),
        const SliverToBoxAdapter(child: PopularJobsSeeAll()),
        SliverListPopularJobs(
          popularJobs: listPopularJobs,
        ),
        SliverToBoxAdapter(
          child: verticalSpace(15),
        ),
      ],
    );
  }
}