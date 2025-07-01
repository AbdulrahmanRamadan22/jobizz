import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/ui/widgets/resume/resume_item.dart';

import '../../../data/models/profile_response_model.dart';

class SliverListResume extends StatelessWidget {
  final List<Cv>? cvs;

  const SliverListResume({super.key, this.cvs});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) {
          return ResumeItem(cv: cvs?[index]);
        },
      ),
    );
  }
}
