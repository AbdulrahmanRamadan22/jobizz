import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class RowDetailsAccount extends StatelessWidget {
  const RowDetailsAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '25',
              style: TextStyles.font16Black,
            ),
            Text(
              'Applied',
              style: TextStyles.font12Gray,
            )
          ],
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '15',
              style: TextStyles.font16Black,
            ),
            Text(
              'Reviewed',
              style: TextStyles.font12Gray,
            )
          ],
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '14',
              style: TextStyles.font16Black,
            ),
            Text(
              'Interview',
              style: TextStyles.font12Gray,
            )
          ],
        ),
      ],
    );
  }
}
