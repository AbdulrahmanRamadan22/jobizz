import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/auth/register/logic/cubit/sign_up_cubit.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/form_field_app_text.dart';
import '../../../../../core/widgets/password_validation.dart';


class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
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
    passwordController = context.read<SignUpCubit>().passwordController;
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
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // full name
          AppTextFormField(
            controller: context.read<SignUpCubit>().fullNameController,
            keyboardType: TextInputType.name,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(
              Icons.person_2_outlined,
              color: ColorsApp.gray,
              size: 25.sp,
            ),
            hintText: 'Full Name',
            hintStyle: TextStyles.font14Gray,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Full';
              }
              return null;
            },
          ),
          verticalSpace(16),
          // email
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: ColorsApp.gray,
              size: 23.sp,
            ),
            hintText: 'Email',
            hintStyle: TextStyles.font14Gray,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email ';
              }
              return null;
            },
          ),
          verticalSpace(16),
          // password
          AppTextFormField(
            isObscureText: isObscureText,
            controller: context.read<SignUpCubit>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h),
            prefixIcon: Icon(
              Icons.key_outlined,
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
            hintText: 'Password',
            hintStyle: TextStyles.font14Gray,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.hasMinLength(value) ||
                  !AppRegex.hasUpperCase(value) ||
                  !AppRegex.hasLowerCase(value) ||
                  !AppRegex.hasNumber(value)) {
                return "Please enter a valid password";
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
