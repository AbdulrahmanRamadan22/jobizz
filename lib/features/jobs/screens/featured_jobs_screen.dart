import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobizz/core/theming/colors.dart';

import '../../home/data/model/home_response_model.dart';
import '../widgets/grid_view_jobs.dart';
import '../widgets/job_fond_length.dart';

class FeaturedJobsScreen extends StatelessWidget {
  const FeaturedJobsScreen({super.key, this.featuredJobs});

  final List<Jop?>? featuredJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Featured Jobs',
        ),
      ),
      body: CustomScrollView(slivers: [
        JobFondLength(jobs: featuredJobs),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            bottom: 20.0,
            top: 10.0,
          ),
          sliver: GridViewJobs(
            Jobs: featuredJobs,
          ),
        ),
      ]),
    );
  }
}

