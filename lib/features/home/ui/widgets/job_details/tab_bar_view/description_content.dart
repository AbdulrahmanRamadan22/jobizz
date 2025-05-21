import 'package:flutter/material.dart';
import 'package:jobizz/core/theming/styles.dart';

class DescriptionContent extends StatelessWidget {
  const DescriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'We are the teams who create all of Facebook\'s products used by billions of people around the world. '
          'Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, '
          'Search and more?',
          style: TextStyles.font12Gray,
          strutStyle: const StrutStyle(height: 1.5),
        ),
        const SizedBox(height: 10),
        Text('Responsibilities:', style: TextStyles.font14Gray),
        const SizedBox(height: 5),
        Text(
          '• Full stack web/mobile application development Work with a variety of coding languages',
          style: TextStyles.font12Gray,
        ),
        Text(
          '• Create consumer products and features using internal programming language Hack',
          style: TextStyles.font12Gray,
        ),
        Text(
          '• Implement web or mobile interfaces using XHTML, CSS, and JavaScript',
          style: TextStyles.font12Gray,
        ),
      ],
    );
  }
}
