import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/auth/register/ui/widgets/form_register.dart';
import 'package:jobizz/features/auth/register/ui/widgets/google_register_bloc_listener.dart';
import 'package:jobizz/features/auth/register/ui/widgets/register_with_social_media.dart';
import 'package:jobizz/features/auth/register/ui/widgets/sign_up_bloc_lisiner.dart';
import 'package:jobizz/features/auth/register/ui/widgets/text_welcom_register_scren.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../../../../core/widgets/row_divider_and_text.dart';
import '../logic/cubit/sign_up_cubit.dart';
import 'widgets/row_have_account_and_login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0.w,
          ),
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWelcomeRegisterScreen(),
              // form register (name , email , password , confirm password)..
              const FormRegister(),
              // button register..
              AppTextButton(
                borderRadius: 5.r,
                buttonHeight: 55.h,
                buttonText: 'Register',
                textStyle: TextStyles.font16White,
                onPressed: () {
                  validateThenDoSignup(context);
                },
              ),
              // BlocListener

              // row divider and text
              const RowDividerAndText(),
              // row register social another..
              const RegisterWithSocialMedia(),
              // row have account and button login
              const RowHaveAccountAndButtonLogin(),
              
              const SignUpBlocListener(),

              const GoogleRegisterBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUp();
    }
  }
}
