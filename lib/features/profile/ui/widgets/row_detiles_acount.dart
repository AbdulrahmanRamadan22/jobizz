import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../data/models/profile_response_model.dart';

class RowDetailsAccount extends StatelessWidget {
  const RowDetailsAccount({super.key, this.profileData});
  final ProfileData? profileData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${profileData?.appliedApplications}',
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
              '${profileData?.reviewedApplications}',
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
              '${profileData?.interviewApplications}',
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
