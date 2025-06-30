import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/profile/data/models/profile_response_model.dart';
import 'package:jobizz/features/profile/ui/widgets/education/build_enhanced_menu_education.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/cached_network_image_widget.dart';
// import '../../../data/models/education_response_model.dart';
// import '../../../data/models/profile_response_model.dart';

class EducationItemDetails extends StatelessWidget {
  final Education? education;
  const EducationItemDetails({
    super.key,
    this.education,
  });

  // final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorsApp.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: ColorsApp.lightGray.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with image, title and menu
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Institution Image
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImageWidget(
                      imageUrl: "${education?.image}",
                      imageKey: "${education?.image}",
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSpace(16),

                // Title and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${education?.college}",
                        style: TextStyles.font14Black.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      verticalSpace(4),
                      Text(
                        "${education?.degree} in ${education?.fieldOfStudy}",
                        style: TextStyles.font14Gray.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpace(4),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsApp.lightBlueGray.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${education?.startDate?.split("-").first} - ${education?.endDate?.split("-").first ?? 'Present'}",
                              style: TextStyles.font12Gray.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.mainBlue,
                              ),
                            ),
                            if (education?.isCurrent == 1) ...[
                              horizontalSpace(6),
                              Container(
                                width: 6.w,
                                height: 6.h,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Enhanced Menu Button
                BuildEnhancedMenuEducation(
                  education: education,
                ),
              ],
            ),

            verticalSpace(8),

            // Description section
            if (education?.description != null)
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 55.w),
                decoration: BoxDecoration(),
                child: Text(
                  "${education?.description}",
                  style: TextStyles.font12Gray.copyWith(
                    fontSize: 13.sp,
                    height: 1.4,
                  ),
                ),
              ),
            if (education?.description != null) verticalSpace(12),

            // Location section
            Padding(
              padding: EdgeInsets.only(left: 53.w),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16.sp,
                    color: ColorsApp.mainBlue,
                  ),
                  horizontalSpace(6),
                  Text(
                    "${education?.location}",
                    style: TextStyles.font12Gray.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
