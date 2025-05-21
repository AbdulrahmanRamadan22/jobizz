import 'package:flutter/material.dart';
import 'package:jobizz/core/theming/styles.dart';

class RequirementContent extends StatelessWidget {
  const RequirementContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• Master\'s degree in Design, Computer Science, Computer Interaction, or a related field.',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
          Text(
            '• 3 years of relevant industry experience.',
            style: TextStyles.font12Gray,
          ),
          Text(
            '• Ability to lead and ideate products from scratch and improve features, all with a user-centered design process.',
            style: TextStyles.font12Gray,
          ),
          Text(
            '• Skills in communicating and influencing product design strategy.',
            style: TextStyles.font12Gray,
          ),
          Text(
            '• Excellent problem-solving skills and familiarity with technical constraints and limitations.',
            style: TextStyles.font12Gray,
          ),
          Text(
            '• Experience designing across multiple platform.',
            style: TextStyles.font12Gray,
          ),
          Text(
            '• Portfolio highlighting multiple projects.',
            style: TextStyles.font12Gray,
          ),
        ],
      ),
    );
  }
}