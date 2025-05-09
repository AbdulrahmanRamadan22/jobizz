import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/core/helper/extensions.dart';
import 'package:jobizz/features/auth/login/ui/widgets/login_bloc_listner.dart';
import 'package:jobizz/features/auth/login/ui/widgets/row_have_account_and_register.dart';

import '../../../../core/routing/routers_string.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../../../../core/widgets/row_divider_and_text.dart';
import '../logic/cubit/login_cubit.dart';
import 'widgets/form_login.dart';
import 'widgets/google_login_bloc_listner.dart';
import 'widgets/login_with_social_media.dart';
import 'widgets/text_welcom_login_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWelcomeLoginScreen(),
              FormLogin(),
              AppTextButton(
                borderRadius: 5.r,
                buttonHeight: 55.h,
                buttonText: 'Login',
                textStyle: TextStyles.font18White,
                onPressed: () {
                  validatedGoLoading(context);
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.forgotPasswordScreen);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.font14MainBlue,
                  ),
                ),
              ),
              RowDividerAndText(),
              LoginWithSocialMedia(),
              RowHaveAccountAndButtonRegister(),
              const LoginBlocListener(),
              const GoogleLoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validatedGoLoading(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLogin();
    }
  }
}
