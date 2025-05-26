import 'package:jobizz/features/switch_profile/data/models/profile_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../../../profile/data/models/profile_response_model.dart';

class SwitchProfilesRepo {
  final ApisServices _apisServices;

  SwitchProfilesRepo(this._apisServices);

  Future<ApiResult<ProfilesResponseModel>> getProfileDetails({
    required String token,
  }) async {
    try {
      final response = await _apisServices.getProfilesDetails(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


  Future<ApiResult<ProfileResponseModel>> getProfileDetailsById(
      {required String token, required int id}) async {
    try {
      final response = await _apisServices.getProfileDetailsById(id, token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


}
