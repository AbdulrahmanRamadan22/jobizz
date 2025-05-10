// otp_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/features/auth/otp_screen/logic/cubit/otp_state.dart';

import '../../../../../core/cache/constants.dart';
import '../../../../../core/cache/shared_pref.dart';
import '../../../forget_password_screen/data/models/forget_pass_request.dart';
import '../../data/model/otp_request.dart';
import '../../data/repo/otp_repo.dart';


class OtpCubit extends Cubit<OtpState> {
  final OtpRepo _otpRepo;

  final formKey = GlobalKey<FormState>();
 final TextEditingController otpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  OtpCubit(this._otpRepo) : super(const OtpState.initial());

  void verifyOtp({required String email}) async {
    // تم تغيير الاسم من emitOtp إلى verifyOtp لتتناسب مع الاستدعاء
    emit(const OtpState.loading());

    final response = await _otpRepo.otpValid(
      OtpRequestCode(pinCode: otpController.text, email: email),
    );

    response.when(
      success: (otpResponse) async {
        await SharedPrefHelper.saveSecuredString(
          key: SharedPrefKeys.token,
          value: otpResponse.data.token ?? "Not Found access token",
        );
        SharedPrefValues.tokenResetPassword =
            await SharedPrefHelper.getSecuredString(
          key: SharedPrefKeys.tokenResetPassword,
        );

        emit(OtpState.success(
          otpResponse,
        )); // تمرير otpResponse كاملًا
      },
      failure: (error) {
        emit(OtpState.error(error));
      },
    );
  }

  /// resend otp to email

  void emitResetSentOpt({required String email}) async {

    otpController.clear();

    emit(const OtpState.resendOtpLoading());
    final response = await _otpRepo.resetSentOpt(ForgetPassRequest(
      email: email,
    ));
    response.when(
      success: (sentOptResponse) {
        otpController.clear();

        emit(OtpState.resendOtpSuccess(sentOptResponse));
      },
      failure: (error) {
        emit(OtpState.resendOtpError(error));
      },
    );
  }

}
