import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobizz/core/widgets/show_generic_search_dialog.dart';
import 'package:jobizz/features/jobs/ui/widgets/job_item.dart';

import '../../data/models/job.dart';
import '../widgets/grid_view_jobs.dart';
import '../widgets/job_fond_length.dart';

class PopularJobsScreen extends StatelessWidget {
  const PopularJobsScreen({super.key, this.popularJobs});

  final List<Job?>? popularJobs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('Popular Jobs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final List<Job> jobs =
                  popularJobs?.whereType<Job>().toList() ?? [];

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
      body: CustomScrollView(
        slivers: [
          JobFondLength(jobs: popularJobs),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
              bottom: 20.0,
              top: 10.0,
            ),
            sliver: GridViewJobs(
              Jobs: popularJobs,
            ),
          ),
        ],
      ),
    );
  }
}
