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
