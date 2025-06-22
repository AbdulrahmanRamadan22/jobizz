import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/app_regex.dart';
import '../../../../../core/helper/size_box.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/password_validation.dart';
import '../../logic/cubit/change_password_cubit.dart';

class FormChangePassword extends StatefulWidget {
  const FormChangePassword({super.key});

  @override
  State<FormChangePassword> createState() => _FormChangePasswordState();
}

class _FormChangePasswordState extends State<FormChangePassword> {
  bool isObscureText = true;
  bool isObscureTextConfirmPassword = true;
  bool isObscureTextNewPassword = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController newPasswordConfirmation;
  @override
  void initState() {
    super.initState();
    newPasswordConfirmation =
        context.read<ChangePasswordCubit>().newPasswordConfirmation;

    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    newPasswordConfirmation.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(newPasswordConfirmation.text);
        hasUpperCase = AppRegex.hasUpperCase(newPasswordConfirmation.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(newPasswordConfirmation.text);
        hasNumber = AppRegex.hasNumber(newPasswordConfirmation.text);
        hasMinLength = AppRegex.hasMinLength(newPasswordConfirmation.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ChangePasswordCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // old password
          Text('Old password', style: TextStyles.font14Gray),
          verticalSpace(10),
          AppTextFormField(
            isObscureText: isObscureText,
            controller:
                context.read<ChangePasswordCubit>().oldPasswordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'old Password',
            hintStyle: TextStyles.font14Gray,
            suffixIcon: GestureDetector(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility,
                    color: ColorsApp.gray,
                    size: 20.sp,
                  )),
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  //  value.length < 8 ||
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
           verticalSpace(10),
          //  new password
          Text('New password', style: TextStyles.font14Gray),
          verticalSpace(10),
          AppTextFormField(
            isObscureText: isObscureTextNewPassword,
            controller:
                context.read<ChangePasswordCubit>().newPasswordConfirmation,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'New Password',
            hintStyle: TextStyles.font14Gray,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureTextNewPassword = !isObscureTextNewPassword;
                });
              },
              child: Icon(
                isObscureTextNewPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility,
                color: ColorsApp.gray,
                size: 20.sp,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  //  value.length < 8 ||
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
          verticalSpace(10),
          //  confirm password
          Text('Confirm password', style: TextStyles.font14Gray),
          verticalSpace(10),
          AppTextFormField(
            isObscureText: isObscureTextConfirmPassword,
            controller:
                context.read<ChangePasswordCubit>().confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'Confirm Password',
            hintStyle: TextStyles.font14Gray,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureTextConfirmPassword = !isObscureTextConfirmPassword;
                });
              },
              child: Icon(
                isObscureTextConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility,
                color: ColorsApp.gray,
                size: 20.sp,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  //  value.length < 8 ||
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
          verticalSpace(10),
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
    newPasswordConfirmation.removeListener(() {});
    newPasswordConfirmation.dispose();

    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   newPasswordConfirmation =
  //       context.read<ChangePasswordCubit>().newPasswordConfirmation;
  // }
}
