import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/form_field_app_text.dart';
import '../../logic/cubit/forget_pass_cubit.dart';


class FormEmailForgetPass extends StatelessWidget {
  const FormEmailForgetPass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPassCubit>().formKey,
      child: AppTextFormField(
        controller: context.read<ForgetPassCubit>().emailController,
        hintText: 'E-mail',
        hintStyle: TextStyles.font14Gray,
        keyboardType: TextInputType.emailAddress,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 20.0,
        ),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: ColorsApp.gray,
          size: 25.sp,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
        },
      ),
    );
  }
}
