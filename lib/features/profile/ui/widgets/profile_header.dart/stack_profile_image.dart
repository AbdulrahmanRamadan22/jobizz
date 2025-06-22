import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/cached_network_image_widget.dart';
import '../../../data/models/profile_response_model.dart';

class StackProfileImage extends StatelessWidget {
  const StackProfileImage({
    super.key,
    required this.profileData,
  });

  final ProfileData? profileData;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: [
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
    ]);
  }
}
