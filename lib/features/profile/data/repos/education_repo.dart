import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/education_request_model.dart';
import '../models/profile_response_model.dart';
import '../models/education_response_model.dart';

class EducationRepo {
  final ApisServices _apisServices;

  EducationRepo(this._apisServices);

  Future<ApiResult<dynamic>> updateEducation({
    required String token,
    required int profileId,
    required int educationId,
   required EducationRequestModel educationRequestModel,
  }) async {
    try {
      final response = await _apisServices.updateEducation(
          profileId, educationId, token, educationRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> addEducation({
    required String token,
    required int profileId,
   required EducationRequestModel educationRequestModel,
  }) async {
    try {
      final response =
          await _apisServices.addEducation(profileId, token, educationRequestModel);
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

  Future<ApiResult<EducationResponseModel>> getAllEductions(
      {required String token, required int profileId}) async {
    try {
      final response = await _apisServices.getAllEducations(profileId, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
