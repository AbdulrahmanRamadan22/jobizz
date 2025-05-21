import 'package:flutter/material.dart';
import 'package:jobizz/core/theming/styles.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Google Job:', style: TextStyles.font14Gray),
          const SizedBox(height: 5),
          Text(
            'Google is one of the world\'s leading technology companies, known for its innovation, '
            'cutting-edge products, and dynamic work culture. With a mission to organize the world\'s '
            'information and make it universally accessible and useful, Google continuously pushes the '
            'boundaries of technology in various fields, including artificial intelligence, cloud computing, '
            'and digital advertising.',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text('Work Environment:', style: TextStyles.font14Gray),
          const SizedBox(height: 5),
          Text(
            'At Google, employees experience a collaborative and inclusive environment where creativity '
            'and problem-solving are highly valued. The company fosters a culture of learning and '
            'experimentation, providing employees with opportunities to work on impactful projects that '
            'reach billions of users worldwide.',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text('Career Growth & Benefits:', style: TextStyles.font14Gray),
          const SizedBox(height: 5),
          Text(
            'Google offers a wide range of career paths, from software engineering to marketing and '
            'business development. Employees enjoy industry-leading benefits, including flexible work '
            'arrangements, wellness programs, stock options, and access to cutting-edge resources for '
            'personal and professional development.',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
          const SizedBox(height: 10),
          Text('Impact & Innovation:', style: TextStyles.font14Gray),
          const SizedBox(height: 5),
          Text(
            'Google employees contribute to groundbreaking projects such as Google Search, Android, '
            'YouTube, and Google Cloud. The company encourages innovation through initiatives like '
            '"20% time," allowing employees to explore new ideas that can shape the future of technology.',
            style: TextStyles.font12Gray,
            strutStyle: const StrutStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}