import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/routing/routers_string.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/cached_network_image_widget.dart';
import '../../../data/models/profile_response_model.dart';
import '../../../logic/profile_cubit.dart';

class ImageAndNamedAndJob extends StatelessWidget {
  final ProfileData? profileData;

  const ImageAndNamedAndJob({
    super.key,
    this.profileData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(alignment: Alignment.bottomRight, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(55.r),
            child: CachedNetworkImageWidget(
              imageUrl: "${profileData?.profileImage}",
              imageKey: '${profileData?.profileImage}',
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: ColorsApp.lightBlue2,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const Center(
              child: Icon(
                Icons.camera_alt_rounded,
                color: ColorsApp.mainBlue,
                size: 22,
              ),
            ),
          )
        ]),
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
        Routes.jobTitleAndFullNameUpdateScreen,
        arguments: profileData);

    if (result == true) {
      log("User Profile updated successfully ");

      context.read<ProfileCubit>().resetProfileData();
      
    } else {
      log("User Profile updated failed ");
    }
  }
}
