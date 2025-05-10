// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobizz/features/auth/otp_screen/ui/widgets/otp_bloc_listner.dart';
import 'package:jobizz/features/auth/otp_screen/ui/widgets/otp_text_field_widget.dart';
import 'package:jobizz/features/auth/otp_screen/ui/widgets/text_for_otp_screen.dart';



import '../../../../core/helper/size_box.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/button_app_text.dart';
import '../logic/cubit/otp_cubit.dart';
import 'widgets/reset_sent_otp_bloc_listner.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
    required this.email,
  });
  final String email;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backGroundWhite,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        // text for otp (named , title and subtitle)
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextForOtpScreen(email: email),
              verticalSpace(88),
           const   OtpTextFieldWidget(),
              verticalSpace(120),
              AppTextButton(
                borderRadius: 5.r,
                buttonWidth: 327.w,
                buttonHeight: 56.h,
                buttonText: 'Verify',
                textStyle: TextStyles.font16White,
                onPressed: () {
                  validateOtpPin(context);
                },
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Didn\'t receive the code?',
                    style: TextStyles.font14Gray,
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<OtpCubit>().emitResetSentOpt(
                              email: email,
                            );
                      },
                      child: Text('Resend Code',
                          style: TextStyles.font14MainBlue)),
                ],
              ),
             const OtpBlocListener(),
             const ResetSentOtpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateOtpPin(BuildContext context) {
    context.read<OtpCubit>().verifyOtp(
          email: email,
        );
  }
}
