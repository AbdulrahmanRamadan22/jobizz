// ignore_for_file: public_member_api_docs, sort_constructors_first


import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';
import '../model/sign_up_request.dart';
import '../model/sign_up_response.dart';

class SignUpRepo {
  final ApisServices _apisServices;
  SignUpRepo(
    this._apisServices,
  );

  Future<ApiResult<SignUpResponse>> signUp(
    SignUpRequest signUpRequest,
  ) async {
    try {
      final response = await _apisServices.signUp(signUpRequest);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  // Add Google authentication for registration
  Future<ApiResult<SignUpResponse>> googleAuth(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await _apisServices.googleAuthSignUp(data);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
