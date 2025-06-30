import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/widgets/show_generic_search_dialog.dart'; // هذا هو ملف الدالة العامة (showGenericSearchDialog)
import 'package:jobizz/features/jobs/data/models/job.dart';

import 'package:jobizz/features/saved_jobs/cubit/saved_cubit.dart'; // استيراد SavedCubit
import 'package:jobizz/features/saved_jobs/ui/widgets/bloc_builder.dart'; // SavedJobsBlocBuilder
import 'package:jobizz/features/saved_jobs/ui/widgets/item_saved_jobs.dart'; // ItemSavedJobs (أو ItelSavedJobs)

class SavedJobsScreen extends StatelessWidget {
  const SavedJobsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Saved Jobs', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        // icon Button Search
        actions: [
          IconButton(
            icon: const Icon(Icons.search,
                color: Colors.black), // استخدام const هنا
            onPressed: () {
              final savedCubit = context.read<SavedCubit>();

              final List<Job> savedJobs = savedCubit.state.maybeWhen(
                savedSuccess: (response) => response.data?.favoriteJobs ?? [],
                orElse: () => <Job>[],
              );

              showGenericSearchDialog<Job>(
                context: context,
                items: savedJobs.whereType<Job>().toList(),
                searchFields: [
                  (job) => job.categoryName ?? '',
                  (job) => job.companyName ?? '',
                  //  (job) => job.jobType ?? '',
                  //  (job) => job.jobStatus ?? '',
                ],
                isGrid: false,
                itemBuilder: (context, job) {
                  return ItemSavedJobs(
                    savedJob: job,
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: Column(
          children: [
            SavedJobsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
