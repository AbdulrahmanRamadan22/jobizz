import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/profile/ui/widgets/profile_header.dart/stack_profile_image.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/profile_response_model.dart';
import '../../../logic/profile_cubit.dart';

class PersonalInfoData extends StatelessWidget {
  final ProfileData? profileData;

  const PersonalInfoData({
    super.key,
    this.profileData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StackProfileImage(profileData: profileData),
        verticalSpace(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${profileData?.fullName}',
                    style: TextStyles.font22BlackBold,
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${profileData?.titleJob ?? ""} ',
                          style: TextStyles.font12Gray),
                      horizontalSpace(2),
                      Text('${profileData?.jobPosition}',
                          style: TextStyles.font12Gray),
                      horizontalSpace(4),
                      Icon(
                        Icons.check_circle,
                        color: ColorsApp.lightBlue,
                        size: 15.r,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  navigateAndUpdateProfile(context);
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.black54,

                  // size: 22,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void navigateAndUpdateProfile(BuildContext context) async {
    final result = await context.pushNamed(
        Routes.personalInfoScreen,
        arguments: profileData);

    if (result == true) {
      log("User Profile updated successfully ");

      context.read<ProfileCubit>().resetProfileData();
    } else {
      log("User Profile updated failed ");
    }
  }
}
