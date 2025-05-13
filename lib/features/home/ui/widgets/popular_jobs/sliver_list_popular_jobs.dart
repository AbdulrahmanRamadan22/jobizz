import 'package:flutter/material.dart';
import 'package:jobizz/features/home/ui/widgets/popular_jobs/popular_jobs_item.dart';

import '../../../data/model/home_response_model.dart';

class SliverListPopularJobs extends StatelessWidget {
  const SliverListPopularJobs({super.key,this.popularJobs});

final  List<Jop?>? popularJobs;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        (BuildContext context, int index) {
          return PopularJobsItem(
            jop: popularJobs?[index],
          );
        },
        childCount: 4, // Directly use the item count here
      ),
    );
  }
}
