import 'package:flutter/material.dart';
import 'package:jobizz/core/widgets/show_generic_search_dialog.dart';
import 'package:jobizz/features/jobs/ui/widgets/job_item.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final List<Job> jobs =
                  recommendedJobs?.whereType<Job>().toList() ?? [];

              showGenericSearchDialog<Job>(
                context: context,
                items: jobs,
                searchFields: [
                  (job) => job.title ?? '',
                  (job) => job.companyName ?? '',
                ],
                isGrid: true,
                itemBuilder: (context, job) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: JobItem(jop: job),
                  );
                },
              );
            },
          ),
        ],
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
