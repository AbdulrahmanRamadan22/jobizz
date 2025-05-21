import 'package:jobizz/features/switch_profile/data/models/profile_response_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class ProfilesRepo {
  final ApisServices _apisServices;

  ProfilesRepo(this._apisServices);

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
}
