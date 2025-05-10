import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/auth/reset_password_screen/ui/widgets/image_reset_pass.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';

class ResetPasswordConformation extends StatelessWidget {
  const ResetPasswordConformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        scrolledUnderElevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 21.0,
          ),
          child: Column(
            children: [
              Text(
                'Jôbizz',
                style: TextStyles.font22MainBlue,
              ),
              verticalSpace(65),
              const ImageResetPassword(),
              verticalSpace(25),
              Text(
                'Confirmation',
                textAlign: TextAlign.center,
                style: TextStyles.font22BlackBold,
              ),
              verticalSpace(17),
              Text(
                  'Your password has been changed. Please log in with your new password.',
                  textAlign: TextAlign.center,
                  style: TextStyles.font14Gray),
              verticalSpace(250),
              AppTextButton(
                borderRadius: 5.r,
                buttonHeight: 62.h,
                buttonText: 'Go To Login',
                textStyle: TextStyles.font16White,
                onPressed: () {
                  context.pushNamedAndRemoveUntil(Routes.loginScreen,
                      predicate: (Route<dynamic> route) {
                    return false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
