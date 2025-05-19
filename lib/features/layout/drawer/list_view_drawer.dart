import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/cache/constants.dart';
import 'package:jobizz/core/helper/extensions.dart';

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
                backgroundImage:
                    const AssetImage('assets/images/photo_person.png'),
              ),
              verticalSpace(16),
              Text('${SharedPrefHelper.getData(key: SharedPrefKeys.fullName)}',
                  style: TextStyles.font16White),
              verticalSpace(4),
              Text('HR', style: TextStyles.font14LightGray),
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
                  _buildMenuItem(
                    icon: Icons.switch_account,
                    title: 'Switch Profile',
                    onTap: () => context.pushNamed(Routes.switchProfileScreen),
                  ),
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Personal Info',
                    onTap: () => context.pushNamed(Routes.profileScreen),
                  ),
                  _buildMenuItem(
                    icon: Icons.work_outline,
                    title: 'Applications',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.bookmark_outline,
                    title: 'Saved Jobs',
                    onTap: () => context.pushNamed(Routes.savedJobsScreen),
                  ),
                  _buildMenuItem(
                    icon: Icons.description_outlined,
                    title: 'Proposals',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.assignment_outlined,
                    title: 'Resumes',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.photo_library_outlined,
                    title: 'Portfolio',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.email_outlined,
                    title: 'Cover Letters',
                    onTap: () {},
                  ),
                  _buildMenuItem(
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
                  _buildMenuItem(
                      icon: Icons.exit_to_app,
                      title: 'Logout',
                      color: ColorsApp.red,
                      iconColor: ColorsApp.red,
                      onTap: () {
                        SharedPrefHelper.clearAllSecuredData().then((value) {
                          SharedPrefValues.token = '';
                          SharedPrefHelper.clearAllData();
                          context.pushNamedAndRemoveUntil(
                            Routes.loginScreen,
                            predicate: (Route<dynamic> route) => false,
                          );
                        });
                      }),
                  // verticalSpace(16),
                  // AppTextButton(
                  //   borderRadius: 8.r,
                  //   buttonHeight: 50.h,
                  //   buttonWidth: double.infinity,
                  //   buttonText: 'Go Premium',
                  //   textStyle: TextStyles.font16White,
                  //   backgroundColor: ColorsApp.mainBlue,
                  //   onPressed: () {},
                  // ),
                  // verticalSpace(24),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
    Color? iconColor,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 24.w,
      leading: Icon(icon, color: iconColor ?? ColorsApp.gray, size: 24.r),
      title: Text(title, style: TextStyles.font16Black),
      trailing: Icon(
        Icons.chevron_right,
        color: ColorsApp.gray,
        size: 24.r,
      ),
      onTap: onTap,
    );
  }
}
