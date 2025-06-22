import 'package:jobizz/core/networking/api_error_handler.dart';
import 'package:jobizz/core/networking/api_result.dart';
import 'package:jobizz/core/networking/api_services.dart';
import 'package:jobizz/features/saved_jobs/data/model/saved_response.dart';
import 'package:jobizz/features/saved_jobs/data/model/saved_request.dart';

class RepoSaved {
  final ApisServices _apisServices;
  RepoSaved(this._apisServices);
// get saved jobs
  Future<ApiResult<SavedResponse>> getSavedJobs({
    required String token,
    required int profileId,
  }) async {
    try {
      final response = await _apisServices.getFavorites(token, profileId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

// post saved jobs
  Future<ApiResult<SavedRequest>> savedJobs({
    required int itemId,
    required String token,
    required int profileId,
  }) async {
    try {
      final response =
          await _apisServices.addFavorite(token, profileId, itemId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
