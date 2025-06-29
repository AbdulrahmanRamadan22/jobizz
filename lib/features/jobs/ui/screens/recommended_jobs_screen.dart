import 'package:flutter/material.dart';

import '../../data/models/job.dart';
import '../widgets/grid_view_jobs.dart';
import '../widgets/job_fond_length.dart';

class RecommendedJobsScreen extends StatelessWidget {
  const RecommendedJobsScreen({super.key, this.recommendedJobs});

  final List<Job?>? recommendedJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Jobs'),
      ),
      body: CustomScrollView(slivers: [
        JobFondLength(jobs: recommendedJobs),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 18.0,
            right: 18.0,
            bottom: 20.0,
            top: 10.0,
          ),
          sliver: GridViewJobs(
            Jobs: recommendedJobs,
          ),
        ),
      ]),
    );
  }
}
