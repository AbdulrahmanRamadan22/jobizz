import 'package:flutter/material.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/styles.dart';

class TextWelcomeLoginScreen extends StatelessWidget {
  const TextWelcomeLoginScreen({
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
                text: 'Welcome Back',
                style: TextStyles.font24DarkBlackSemiBold,
              ),
              TextSpan(
                text: '👋',
                style: TextStyle(
                  fontSize: 28.0, 
                ),
              ),
            ],
          ),
        ),
        verticalSpace(7),
        Text(
          'Let’s log in. Apply to jobs!',
          style: TextStyles.font14Gray,
        ),
      ],
    );
  }
}
