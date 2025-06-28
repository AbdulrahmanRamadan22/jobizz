import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/job.dart';
import 'job_item.dart';

class GridViewJobs extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const GridViewJobs({super.key, this.Jobs});

  // ignore: non_constant_identifier_names
  final List<Job?>? Jobs;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: Jobs?.length ?? 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.w, // Horizontal spacing between items
          mainAxisSpacing: 10.h, // Vertical spacing between items
          // childAspectRatio: 0.9, // Width/height ratio of each item
        ),
        itemBuilder: (context, index) => JobItem(
              jop: Jobs?[index],
            ));
  }
}
