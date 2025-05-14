import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class PageTopBar extends StatelessWidget {
  const PageTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(20),
          GestureDetector(
            onTap: () {
              print("open drawer");
              Scaffold.of(context).openDrawer();

              // _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(Icons.filter_list_rounded,
                color: ColorsApp.darkBlue, size: 30.sp),
          ),
          ListTile(
            visualDensity: VisualDensity.compact,
            dense: false,
            title: Text('Welcome Back! ', style: TextStyles.font14Gray),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            subtitle: Text(
              '${SharedPrefHelper.getData(key: SharedPrefKeys.fullName) ?? ''} 👋',
              style: TextStyles.font22DarkBlackBold,
            ),
            trailing: CircleAvatar(
              backgroundColor: ColorsApp.lightGray,
              radius: 30.r,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.profileScreen);
                },
                child: Image.asset(
                  'assets/images/photo_person.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
