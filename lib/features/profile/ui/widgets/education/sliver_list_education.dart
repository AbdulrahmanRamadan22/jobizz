import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/ui/widgets/education/education_item.dart';


import '../../../data/models/profile_response_model.dart';

class SliverListEducation extends StatelessWidget {
  const SliverListEducation({
    super.key,
      required this.educations,
  });
  final List<Education>? educations;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount:  educations!.isNotEmpty ? 1 : 0,
        (context, index) {
          return  EducationItem(
             education: educations?[index],
          );
        },
      ),
    );
  }
}
