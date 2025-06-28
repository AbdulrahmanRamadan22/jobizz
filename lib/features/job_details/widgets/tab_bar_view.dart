import 'package:flutter/material.dart';

import '../../jobs/data/models/job.dart';

class TabBarViewDesign extends StatelessWidget {
  const TabBarViewDesign({
    super.key,
    this.job,
  });
  final Job? job;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text('${job?.description}'),
            Text('${job?.requirement}'),
            Text('${job?.benefits}'),
          ],
        ),
      ),
    );
  }
}
