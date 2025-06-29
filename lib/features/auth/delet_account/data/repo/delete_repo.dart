import 'package:jobizz/core/networking/api_error_handler.dart';
import 'package:jobizz/core/networking/api_result.dart';
import 'package:jobizz/core/networking/api_services.dart';
import 'package:jobizz/features/auth/delet_account/data/model/delete_response_model.dart';

class DeleteRepo {
  final ApisServices apiServices;

  DeleteRepo(this.apiServices);

  Future<ApiResult<DeleteAccountResponse>> deleteAccount(String token) async {
    try {
      final response = await apiServices.deleteAccount('Bearer $token');
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
