import 'package:flutter/material.dart';
import 'package:jobizz/features/home/data/model/home_response_model.dart';

class TabBarViewDesign extends StatelessWidget {
  const TabBarViewDesign({
    super.key,
    this.job,
  });
  final Jop? job;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: TabBarView(
          children: [
            Text('${job?.description}'),
            Text('${job?.requirement}'),
            Text('${job?.benefits}'),
            //    Text('${job?.}'),
            //  Text('hhhh'),
            // Description Tab
            //   DescriptionContent(),
            // Requirements Tab
            // RequirementContent(),
            // About Company Tab
            //  AboutContent(),
            // Reviews Tab
            //  ReviewsContent(),
          ],
        ),
      ),
    );
  }
}
