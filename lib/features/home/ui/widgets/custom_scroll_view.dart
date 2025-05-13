import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/home/logic/cubit/home_cubit.dart';
import 'package:jobizz/features/home/logic/cubit/home_state.dart';
import 'package:jobizz/features/home/ui/widgets/featured_jobs/sliver_list_featured_jobs.dart';
import 'package:jobizz/features/home/ui/widgets/recommended_jobs/sliver_grid_recommended_jobs.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/widgets/showdialog_errors.dart';
import '../../../../core/widgets/showdialog_loadin.dart';
import 'featured_jobs/featured_jobs_see_all.dart';
import 'popular_jobs/popular_jobs_see_all.dart';
import 'popular_jobs/sliver_list_popular_jobs.dart';
import 'recommended_jobs/recommended_jobs_see_all.dart';

class CustomScrollViewHomeScreen extends StatelessWidget {
  const CustomScrollViewHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            // ignore: void_checks
            orElse: () {
          return const Text("orElse");
        }, loading: () {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }, success: (homeResponse) {
          final listFeaturedJobs = homeResponse.data?.trending;
          final listPopularJobs = homeResponse.data?.popular;
          final listRecommendedJobs = homeResponse.data?.recommended;

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
        }, failure: (error) {
          return Center(child: Text(error.message ?? "Unknown error"));
        });
      },
    );
  }
}
