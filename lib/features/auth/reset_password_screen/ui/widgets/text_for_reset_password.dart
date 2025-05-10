import 'package:flutter/material.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/styles.dart';

class TextForResetPassword extends StatelessWidget {
  const TextForResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      // center
      children: [
        Text(
          'Jôbizz',
          style: TextStyles.font22MainBlue,
        ),
        verticalSpace(20),
        Text(
          'Reset Password',
          style: TextStyles.font24DarkBlack,
        ),
        verticalSpace(17),
        Text(
          textAlign: TextAlign.center,
          'Enter your new password and confirm the new password to reset password',
          style: TextStyles.font14Gray,
        ),
      ],
    );
  }
}
