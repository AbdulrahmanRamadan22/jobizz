import 'package:flutter/material.dart';
import 'package:jobizz/core/theming/styles.dart';

class ReviewsContent extends StatelessWidget {
  const ReviewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('⭐ Innovative Work Culture', style: TextStyles.font14Gray),
          const SizedBox(height: 5),
          Text(
            '"Working at Google is an amazing experience! The company fosters a culture of innovation '
            'where employees are encouraged to think outside the box. The 20% time policy allows us to '
            'explore new ideas and work on personal projects that can turn into real products." '
            '– Software Engineer',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text('⭐ Great Work-Life Balance', style: TextStyles.font14Gray),
          const SizedBox(height: 5),
          Text(
            '"Google truly cares about employee well-being. The flexible work schedule, remote work '
            'options, and on-site amenities like gyms and wellness programs make it easy to maintain '
            'a great work-life balance." – Product Manager',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text('⭐ Endless Learning Opportunities',
              style: TextStyles.font14Gray),
          const SizedBox(height: 5),
          Text(
            '"At Google, you never stop learning. From internal training sessions to mentorship programs, '
            'there are countless opportunities for personal and professional growth. The company provides '
            'access to some of the best minds in the industry." – UX Designer',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}