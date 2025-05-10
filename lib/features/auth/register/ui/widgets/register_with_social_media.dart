import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../logic/cubit/sign_up_cubit.dart';

class RegisterWithSocialMedia extends StatelessWidget {
  const RegisterWithSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<SignUpCubit>().signUpWithGoogle();
          },
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: ColorsApp.whiteColor,
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(width: 0.5, color: ColorsApp.gray),
            ),
            child: SvgPicture.asset(
              height: 36.h,
              width: 36.w,
              'assets/svgs/Logo_google.svg',
            ),
          ),
        ),
      ],
    );
  }
}
