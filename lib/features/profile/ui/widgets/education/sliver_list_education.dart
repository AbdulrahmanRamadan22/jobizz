import 'package:flutter/material.dart';


import '../../../data/models/profile_response_model.dart';
import 'education_item.dart';

class SliverListEducation extends StatelessWidget {
  const SliverListEducation({
    super.key,
    required this.educations,
  });
  final List<Education> educations;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: educations.length,
        (context, index) {
          return  EducationItem(
             education: educations[index],
          );
        },
      ),
    );
  }
}
