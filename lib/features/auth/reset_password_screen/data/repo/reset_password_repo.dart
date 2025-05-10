// ignore_for_file: public_member_api_docs, sort_constructors_first


import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';
import '../model/reset_passwoed_response.dart';
import '../model/reset_password_requast.dart';

class ResetPasswordRepo {
  final ApisServices _apisServices;

  ResetPasswordRepo(
    this._apisServices,
  );

  Future<ApiResult<ResetPasswordResponse>> resetPasswordValid(
      ResetPasswordRequest resetPasswordRequest,
      {required String token}) async {
    try {
      final response = await _apisServices.resetPasswordValid(
        token,
        resetPasswordRequest,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
