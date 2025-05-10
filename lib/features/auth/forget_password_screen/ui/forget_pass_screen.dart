import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/auth/forget_password_screen/ui/widgets/form_email_forget_pass.dart';
import 'package:jobizz/features/auth/forget_password_screen/ui/widgets/text_named_and_forget_pass.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../logic/cubit/forget_pass_cubit.dart';
import 'widgets/forget_pass_bloc_listener.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextNamedAndForgetPassword(),
              verticalSpace(96),
              FormEmailForgetPass(),
              verticalSpace(48),

              // button send code ..
              AppTextButton(
                borderRadius: 5.r,
                buttonHeight: 56.h,
                buttonText: 'Send Code',
                textStyle: TextStyles.font16White,
                onPressed: () {
                  validateThenDoForgetPass(context);
                },
              ),
              // BlocListener ..
             const ForgetPassBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoForgetPass(BuildContext context) {
    if (context.read<ForgetPassCubit>().formKey.currentState!.validate()) {
      context.read<ForgetPassCubit>().emitForgetPassword();
    }
  }
}
