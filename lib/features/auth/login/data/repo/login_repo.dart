
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';
import '../model/login_request.dart';
import '../model/login_response.dart';

class LoginRepo {
  final ApisServices _apisServices;

  LoginRepo(this._apisServices);

  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _apisServices.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<LoginResponse>> googleAuth(
      {required Map<String, dynamic> data}) async {
    try {
      final response = await _apisServices.googleAuth(data);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
