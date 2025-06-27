import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/routing/routers_string.dart';
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
        context.pushNamed(Routes.editEducationScreen,arguments: education);
      },
      child: CustomExperienceAndEducationCardItem(
        titleText: "${education?.college}",
        subtitleText: "${education?.degree}",
        locationText: "${education?.location}",
        dateText:
            "${education?.startDate.split("-").first} - ${education?.endDate?.split("-").first ?? "present"}",
        leadingImage: "${education?.image}",
      ),
    );
  }
}
