import 'package:flutter/material.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/styles.dart';

class TextWelcomeRegisterScreen extends StatelessWidget {
  const TextWelcomeRegisterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jôbizz',
          style: TextStyles.font22MainBlue,
        ),
        verticalSpace(8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Registration',
                style: TextStyles.font24DarkBlackSemiBold,
              ),
              TextSpan(
                text: '👍',
                style: TextStyles.font24DarkBlackSemiBold.copyWith(
                  fontSize: 28.0, // Slightly larger for emoji emphasis
                  // color: Colors
                  //     .blueAccent, // Different color for visual distinction
                ),
              ),
            ],
          ),
        ),
        verticalSpace(7),
        Text(
          'Let’s Register. Apply to jobs!',
          style: TextStyles.font14Gray,
        ),
      ],
    );
  }
}
