import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/profile/ui/widgets/row_detiles_acount.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/cached_network_image_widget.dart';
import '../../data/models/profile_response_model.dart';

class ImageAndNamedAndJob extends StatelessWidget {

    final ProfileData? profileData;

  const ImageAndNamedAndJob({
    super.key,
    this.profileData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: ColorsApp.gray,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(55.r),
            child: CachedNetworkImageWidget(
              imageUrl: profileData?.profileImage ?? '',
              imageKey: 'profileImage',
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
            // backgroundImage: NetworkImage(
            //   profileImage ?? '',
            // ),
          ),
          verticalSpace(12),
          Text(
            '${SharedPrefHelper.getData(key: SharedPrefKeys.fullName) ?? ''} ',
            style: TextStyles.font22BlackBold,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${profileData?.titleJob ?? ""} ', style: TextStyles.font12Gray),
              horizontalSpace(4),
              Icon(
                Icons.check_circle,
                color: ColorsApp.lightBlue,
                size: 15.r,
              ),
            ],
          ),
          verticalSpace(40),
          RowDetailsAccount(
            profileData: profileData,
          ),
        ],
      ),
    );
  }
}
