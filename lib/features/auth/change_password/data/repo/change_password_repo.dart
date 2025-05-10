

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';
import '../model/change_password_request.dart';
import '../model/change_password_response.dart';

class ChangePasswordRepo {
  final ApisServices apisServices;
  ChangePasswordRepo(this.apisServices);

  Future<ApiResult<ChangePasswordResponse>> changePassword(
      String token, ChangePasswordRequest changePasswordRequest) async {
    try {
      final response = await apisServices.changePassword(
        token,
        changePasswordRequest,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
