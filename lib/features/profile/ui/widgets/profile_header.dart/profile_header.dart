import 'package:flutter/widgets.dart';
import 'package:jobizz/features/profile/data/models/profile_response_model.dart';
import 'package:jobizz/features/profile/ui/widgets/profile_header.dart/row_detiles_profile.dart';

import '../../../../../core/helper/size_box.dart';
import 'image_and_named_and_job.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileData? profileData;

  const ProfileHeader({
    super.key,
    this.profileData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageAndNamedAndJob(
          profileData: profileData,
        ),
        verticalSpace(40),
        RowDetailsProfile(
          profileData: profileData,
        ),
      ],
    );
  }
}
