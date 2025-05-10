// ignore_for_file: public_member_api_docs, sort_constructors_first


import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';
import '../models/forget_pass_request.dart';
import '../models/forget_pass_response.dart';

class ForgetPasswordRepo {
  final ApisServices apisServices;
  ForgetPasswordRepo(
    this.apisServices,
  );

  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPassRequest forgetPasswordRequest,
  ) async {
    try {
      final response =
          await apisServices.forgetpassword(forgetPasswordRequest);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
