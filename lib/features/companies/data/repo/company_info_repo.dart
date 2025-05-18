
import 'package:jobizz/core/networking/api_error_handler.dart';
import 'package:jobizz/core/networking/api_result.dart';
import 'package:jobizz/core/networking/api_services.dart';
import 'package:jobizz/features/companies/data/model/company_response.dart';

class CompanyInfoRepo {
  final ApisServices _apisServices;
  CompanyInfoRepo(
    this._apisServices,
  );
  Future<ApiResult<CompanyResponse>> getCompanyInfo(
      {required String token}) async {
    try {
      final response = await _apisServices.getCompanyInfo(token);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
