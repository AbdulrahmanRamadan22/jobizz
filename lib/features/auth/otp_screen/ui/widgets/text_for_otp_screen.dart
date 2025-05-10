import 'package:flutter/material.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/styles.dart';


class TextForOtpScreen extends StatelessWidget {
  final String email;
  const TextForOtpScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Jôbizz',
          style: TextStyles.font22MainBlue,
        ),
        verticalSpace(14),
        Text(
          'Verify Code',
          style: TextStyles.font24DarkBlack,
        ),
        verticalSpace(17),
        Text(
          textAlign: TextAlign.center,
          'Please enter the verification code sent to ',
          style: TextStyles.font14Gray,
        ),
        Text(
          textAlign: TextAlign.center,
          '$email. , ',
          style: TextStyles.font14MainBlue,
        ),
      ],
    );
  }
}
