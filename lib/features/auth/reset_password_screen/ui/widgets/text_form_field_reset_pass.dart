import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/form_field_app_text.dart';
import '../../../../../core/widgets/password_validation.dart';
import '../../logic/cubit/resetpassword_cubit.dart';


class TextFormFieldResetPass extends StatefulWidget {
  const TextFormFieldResetPass({super.key});

  @override
  State<TextFormFieldResetPass> createState() => _TextFormFieldResetPassState();
}

class _TextFormFieldResetPassState extends State<TextFormFieldResetPass> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController =
        context.read<ResetPasswordCubit>().newPasswordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetPasswordCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            isObscureText: isObscureText,
            controller:
                context.read<ResetPasswordCubit>().newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'New Password',
            hintStyle: TextStyles.font14Gray,
            prefixIcon: Icon(
              Icons.key_rounded,
              color: ColorsApp.gray,
              size: 25.sp,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: ColorsApp.gray,
                size: 25.sp,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.hasLowerCase(value) ||
                  !AppRegex.hasUpperCase(value) ||
                  !AppRegex.hasNumber(value) ||
                  !AppRegex.hasMinLength(value) ||
                  !AppRegex.hasSpecialCharacter(value)) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(16),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
            hasSpecialChar: hasSpecialCharacters,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.removeListener(() {});
    passwordController.dispose();
    super.dispose();
  }
}
