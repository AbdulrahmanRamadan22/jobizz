import 'package:jobizz/features/profile/data/models/experience_request_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/experience_response_model.dart';

class ExperienceRepo {
  final ApisServices _apisServices;

  ExperienceRepo(this._apisServices);

  Future<ApiResult<dynamic>> updateExperience({
    required String token,
    required int profileId,
    required int experienceId,
    required ExperienceRequestModel experienceRequestModel,
  }) async {
    try {
      final response = await _apisServices.updateExperience(
          profileId, experienceId, token, experienceRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> addExperience({
    required String token,
    required int profileId,
    required ExperienceRequestModel experienceRequestModel,
  }) async {
    try {
      final response = await _apisServices.addExperience(
          profileId, token, experienceRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<dynamic>> deleteExperience({
    required int profileId,
    required int experienceId,
    required String token,
  }) async {
    try {
      final response =
          await _apisServices.deleteExperience(profileId, experienceId, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ExperienceResponseModel>> getAllExperiences(
      {required String token, required int profileId}) async {
    try {
      final response = await _apisServices.getAllExperience(profileId, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


}
