import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/theming/colors.dart';
import 'package:jobizz/features/saved_jobs/cubit/saved_cubit.dart';
import 'package:jobizz/features/saved_jobs/cubit/saved_state.dart';

import '../../jobs/data/models/job.dart';

class RowIcons extends StatelessWidget {
  const RowIcons({
    super.key,
    this.job,
  });

  final Job? job;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        final savedCubit = context.read<SavedCubit>();

        final isSaved = savedCubit.savedJobsMap[job!.id] ?? false;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Back button
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
              color: Colors.white,
            ),

            // Bookmark button
            IconButton(
              onPressed: () {
                print("تم الحفظ - Job ID: ${job?.id}");
                savedCubit.changeSavedJobs(job!.id);
              },
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: ColorsApp.lightBlue2,
                child: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: isSaved ? ColorsApp.mainBlue : ColorsApp.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
