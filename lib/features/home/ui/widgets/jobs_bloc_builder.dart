import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/home/logic/cubit/home_cubit.dart';
import 'package:jobizz/features/home/logic/cubit/home_state.dart';
import 'package:jobizz/features/home/ui/widgets/success_jobs.dart';

class JobsBlocBuilder extends StatelessWidget {
  const JobsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          // ignore: void_checks

          loading: () {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          },
          success: (homeResponse) {
            final listFeaturedJobs = homeResponse.data?.trending;
            final listPopularJobs = homeResponse.data?.popular;
            final listRecommendedJobs = homeResponse.data?.recommended;

            return SuccessJobs(
                listFeaturedJobs: listFeaturedJobs,
                listRecommendedJobs: listRecommendedJobs,
                listPopularJobs: listPopularJobs);
          },
          failure: (error) {
            return Center(child: Text(error.message ?? "Unknown error"));
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }
}
