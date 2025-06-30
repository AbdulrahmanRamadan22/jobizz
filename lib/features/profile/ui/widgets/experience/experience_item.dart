import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/extensions.dart';
import '../../../../../core/routing/routers_string.dart';
import '../../../data/models/profile_response_model.dart';
import '../custom_experience_and_education_card_item.dart';

class ExperienceItem extends StatelessWidget {
  final Experience? experience;
  const ExperienceItem({
    super.key,
    this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
           context.pushNamed(Routes.editExperienceScreen,
                  arguments: experience);
      },
      child: CustomExperienceAndEducationCardItem(
        titleText: experience?.position??'',
        subtitleText: experience?.company??'',
        locationText: experience?.location??'',
        dateText: experience?.startDate??'',
        leadingImage: experience?.image??'',
      ),
    );
  }
}

