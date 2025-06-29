
import 'package:flutter/material.dart';
import 'package:jobizz/features/profile/ui/widgets/education/navigate_and_update_education.dart';

import '../../../data/models/profile_response_model.dart';
import '../custom_experience_and_education_card_item.dart';

class EducationItem extends StatelessWidget {
  final Education? education;
  const EducationItem({
    super.key,
    this.education,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    navigateAndUpdateEducation(context, education);
      },
      child: CustomExperienceAndEducationCardItem(
        titleText: "${education?.college}",
        subtitleText: "${education?.degree}",
        locationText: "${education?.location}",
        dateText:
            "${education?.startDate?.split("-").first} - ${education?.endDate?.split("-").first ?? "present"}",
        leadingImage: "${education?.image}",
      ),
    );
  }


}
