import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/home/logic/cubit/home_cubit.dart';
import 'package:jobizz/features/home/logic/cubit/home_state.dart';

import '../../../../core/cache/constants.dart';
import '../../../../core/cache/shared_pref.dart';
import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/cached_network_image_widget.dart';

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
              maxLines: 2,
              style: TextStyles.font22DarkBlackBold,
            ),
            trailing: GestureDetector(
              onTap: () => context.pushNamed(Routes.profileScreen),
              child: ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: CachedNetworkImageWidget(
              imageUrl: "${SharedPrefHelper.getData(key: SharedPrefKeys.profileImage)}",
              imageKey: '${SharedPrefHelper.getData(key: SharedPrefKeys.profileImage)}',
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
           
          ),
              
              
              
              
              
              //  CircleAvatar(
              //   radius: 25.r,
              //   backgroundColor: ColorsApp.lightGray,
              //   backgroundImage: NetworkImage(
              //       // ignore: unnecessary_string_interpolations
              //       '${SharedPrefHelper.getData(key: SharedPrefKeys.profileImage)}'),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
