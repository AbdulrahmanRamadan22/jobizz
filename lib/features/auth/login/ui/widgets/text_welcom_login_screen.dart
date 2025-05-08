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
        Text(
          'Welcome Back 👋',
          style: TextStyles.font24DarkBlack,
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
