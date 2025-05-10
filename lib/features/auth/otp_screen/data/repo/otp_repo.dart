// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';
import '../../../forget_password_screen/data/models/forget_pass_request.dart';
import '../../../forget_password_screen/data/models/forget_pass_response.dart';
import '../model/otp_request.dart';
import '../model/otp_response.dart';

class OtpRepo {
  final ApisServices _apiServices;
  OtpRepo(
    this._apiServices,
  );

  Future<ApiResult<OtpResponse>> otpValid(
    OtpRequestCode otpRequestCode,
  ) async {
    try {
      final response = await _apiServices.otpValid(otpRequestCode);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
  

  /// send new otp to email
   Future<ApiResult<ForgetPasswordResponse>> resetSentOpt(
    ForgetPassRequest forgetPasswordRequest,
  ) async {
    try {
      final response =
          await _apiServices.forgetpassword(forgetPasswordRequest);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }


}
