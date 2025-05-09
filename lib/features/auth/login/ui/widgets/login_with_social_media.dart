import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../logic/cubit/login_cubit.dart';

class LoginWithSocialMedia extends StatelessWidget {
  const LoginWithSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<LoginCubit>().signInWithGoogle();
          },
          child: Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: ColorsApp.whiteColor,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Image.asset(
              height: 50.h,
              width: 50.w,
              'assets/images/flat-color-icons_google.png',
            ),
          ),
        ),
      ],
    );
  }
}
