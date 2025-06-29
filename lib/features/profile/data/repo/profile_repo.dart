import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../profile/data/models/profile_response_model.dart';

class ProfileRepo {
  final ApisServices _apisServices;

  ProfileRepo(this._apisServices);

  Future<ApiResult<ProfileResponseModel>> getProfileDetails(
      {required String token, required int id}) async {
    try {
      final response = await _apisServices.getProfileDetailsById(id, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> updateGeneralProfileData(
      {required String token,
      required int id,
      required Map<String, dynamic> data}) async {
    try {
      final response =
          await _apisServices.updateGeneralProfileData(id, token, data);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> updateEducation({
    required String token,
    required int profileId,
    required int educationId,
    Education? education,
  }) async {
    try {
      final response = await _apisServices.updateEducation(
          profileId, educationId, token, education);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> addEducation({
    required String token,
    required int profileId,
    required Education education,
  }) async {
    try {
      final response =
          await _apisServices.addEducation(profileId, token, education);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> deleteEducation({
    required int profileId,
    required int educationId,
    required String token,
  }) async {
    try {
      final response =
          await _apisServices.deleteEducation(profileId, educationId, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
