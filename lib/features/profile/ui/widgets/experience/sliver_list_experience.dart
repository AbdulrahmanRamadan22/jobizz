import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/ui/widgets/experience/experience_item.dart';

import '../../../data/models/profile_response_model.dart';

class SliverListExperience extends StatelessWidget {
  const SliverListExperience({
    super.key,
    required this.experiences,
  });
    final List<Experience> experiences;


  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: experiences.length,
        (context, index) {
          return ExperienceItem(
            experience: experiences[index],
          );
        },
      ),
    );
  }
}


