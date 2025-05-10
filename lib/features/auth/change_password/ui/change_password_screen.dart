import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../logic/cubit/change_password_cubit.dart';
import 'widgets/change_password_bloc_listner.dart';
import 'widgets/form_change_password.dart';

class ChangePasswordScreen extends StatelessWidget {
  final String token;

  const ChangePasswordScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp.backGroundWhite,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: ColorsApp.darkBlack),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create a new password', style: TextStyles.font24DarkBlack),
              verticalSpace(15),
              Text(
                'Your new password must be different from previously used passwords',
                style: TextStyles.font14Gray,
              ),
              verticalSpace(20),
              const FormChangePassword(),
              verticalSpace(5),
              verticalSpace(20),
              AppTextButton(
                buttonHeight: 56.h,
                borderRadius: 5.r,
                buttonText: 'Change Password',
                textStyle: TextStyles.font16White,
                onPressed: () => validateAndChangePassword(context),
              ),
              const ChangePasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateAndChangePassword(BuildContext context) {
    if (context.read<ChangePasswordCubit>().formKey.currentState!.validate()) {
      context.read<ChangePasswordCubit>().emitChangePassword();
    }
  }
}
