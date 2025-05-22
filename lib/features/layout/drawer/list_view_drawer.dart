import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/cache/constants.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/layout/drawer/widget/build_mean_item.dart';

import '../../../../../core/helper/size_box.dart';
import '../../../core/cache/shared_pref.dart';
import '../../../core/routing/routers_string.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class ListViewDrawer extends StatelessWidget {
  const ListViewDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Section
        Container(
          height: 280.h,
          width: double.infinity,
          color: ColorsApp.darkBlue,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(30),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: ColorsApp.whiteColor),
                  onPressed: () => context.pop(),
                ),
              ),
              CircleAvatar(
                radius: 35.r,
                backgroundImage: NetworkImage(
                    '${SharedPrefHelper.getData(key: SharedPrefKeys.profileImage)}'),
              ),
              verticalSpace(16),
              Text('${SharedPrefHelper.getData(key: SharedPrefKeys.fullName)}',
                  style: TextStyles.font16White),
              verticalSpace(4),
              Text(
                  '${SharedPrefHelper.getData(key: SharedPrefKeys.titleJob) ?? ""}',
                  style: TextStyles.font14LightGray),
              verticalSpace(16),
              OutlinedButton(
                onPressed: () => context.pushNamed(Routes.profileScreen),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorsApp.whiteColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 8.h,
                  ),
                ),
                child: Text(
                  'View Profile',
                  style: TextStyles.font16White,
                ),
              ),
            ],
          ),
        ),

        // Menu Items Section
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              color: ColorsApp.backGroundWhite,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                children: [
                  BuildMeanItem(
                    icon: Icons.switch_account,
                    title: 'Switch Profile',
                    onTap: () => context.pushNamed(Routes.switchProfileScreen),
                  ),
                  BuildMeanItem(
                    icon: Icons.person_outline,
                    title: 'Personal Info',
                    onTap: () => context.pushNamed(Routes.profileScreen),
                  ),
                  BuildMeanItem(
                    icon: Icons.work_outline,
                    title: 'Applications',
                    onTap: () {},
                  ),
                  BuildMeanItem(
                    icon: Icons.bookmark_outline,
                    title: 'Saved Jobs',
                    onTap: () => context.pushNamed(Routes.savedJobsScreen),
                  ),
                  BuildMeanItem(
                    icon: Icons.description_outlined,
                    title: 'Proposals',
                    onTap: () {},
                  ),
                  BuildMeanItem(
                    icon: Icons.assignment_outlined,
                    title: 'Resumes',
                    onTap: () {},
                  ),
                  BuildMeanItem(
                    icon: Icons.photo_library_outlined,
                    title: 'Portfolio',
                    onTap: () {},
                  ),
                  BuildMeanItem(
                    icon: Icons.email_outlined,
                    title: 'Cover Letters',
                    onTap: () {},
                  ),
                  BuildMeanItem(
                    icon: Icons.chat_bubble,
                    title: 'Chat Bot',
                    onTap: () {
                      context.pushNamed(Routes.geminiChatScreen);
                    },
                  ),
                  BuildMeanItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    onTap: () => context.pushNamed(Routes.settingsScreen),
                  ),

                  // Divider before actions
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Divider(height: 1.h, color: ColorsApp.lightGray),
                  ),

                  // Action Buttons
                  BuildMeanItem(
                    icon: Icons.exit_to_app,
                    title: 'Logout',
                    iconColor: ColorsApp.red,
                    onTap: () {
                      SharedPrefHelper.clearAllSecuredData().then(
                        (value) {
                          SharedPrefValues.token = '';
                          context.pushNamedAndRemoveUntil(
                            Routes.loginScreen,
                            predicate: (Route<dynamic> route) => false,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
