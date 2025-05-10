import 'package:flutter/material.dart';
import 'package:jobizz/core/helper/size_box.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class RowDividerAndText extends StatelessWidget {
  const RowDividerAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: ColorsApp.gray,
          ),
        ),
        horizontalSpace(14),
        Text(
          'Or continue with',
          style: TextStyles.font14Gray,
        ),
        horizontalSpace(14),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: ColorsApp.gray,
          ),
        ),
      ],
    );
  }
}
