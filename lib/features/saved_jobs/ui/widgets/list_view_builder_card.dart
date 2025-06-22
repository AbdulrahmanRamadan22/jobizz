// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jobizz/features/saved_jobs/data/model/saved_response.dart';
import 'package:jobizz/features/saved_jobs/ui/widgets/item_saved_jobs.dart';

class ListViewBuilderCard extends StatelessWidget {
  final List<SavedJob?>? savedJobs;

  const ListViewBuilderCard({
    super.key,
    this.savedJobs,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: savedJobs?.length ?? 0,
        itemBuilder: (context, index) {
          final job = savedJobs?[index];
          // if (job == null) return const SizedBox.shrink();

          return ItemSavedJobs(job: job);
        },
      ),
    );
  }
}
