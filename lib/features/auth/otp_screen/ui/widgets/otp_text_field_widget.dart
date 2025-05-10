// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/cubit/otp_cubit.dart';

class OtpTextFieldWidget extends StatelessWidget {
  const OtpTextFieldWidget({
    super.key,
  });

  @override

  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      controller: context.read<OtpCubit>().otpController,
      cursorColor: ColorsApp.mainBlue,
      animationType: AnimationType.fade,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the OTP code';
        } else if (value.length < 6) {
          return 'Please enter a valid OTP code';
        }
        return null;
      },
      autoFocus: true,
      enablePinAutofill: true,
      autoDisposeControllers: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: false,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      textStyle: TextStyles.font22BlackBold,
      pinTheme: PinTheme(
        fieldWidth: 50.w,
        fieldHeight: 50.h,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8.r),
        selectedColor: ColorsApp.lightBlueGray,
        selectedFillColor: ColorsApp.whiteColor,
        activeColor: ColorsApp.mainBlue,
        activeFillColor: ColorsApp.whiteColor,
        inactiveColor: ColorsApp.lightBlueGray,
        inactiveFillColor: ColorsApp.lightGray
            .withAlpha(10), //ColorsApp.lightGray.withAlpha( 100),
        borderWidth: 1,
      ),
      onChanged: (value) {
        log("pin value:$value");
      },
      onCompleted: (value) {
        log("pin value:$value");
        context.read<OtpCubit>().emailController.text = value;
        // context.read<OtpCubit>().verifyOtp(email: email, otp: value);
      },
    );
  }
}
