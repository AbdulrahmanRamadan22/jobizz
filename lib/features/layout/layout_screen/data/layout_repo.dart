// import 'package:jobizz/core/networking/api_services.dart';

// import '../../../../core/networking/api_error_handler.dart';
// import '../../../../core/networking/api_result.dart';
// import '../../../profile/data/models/profile_response_model.dart';

// class LayoutRepo {
//   final ApisServices _apisServices;

//   LayoutRepo(this._apisServices);

//   Future<ApiResult<ProfileResponseModel>> getProfileDetails(
//       {required String token, required int id}) async {
//     try {
//       final response = await _apisServices.getProfileDetails(id, token);
//       return ApiResult.success(response);
//     } catch (error) {
//       return ApiResult.failure(ApiErrorHandler.handle(error));
//     }
//   }
// }
