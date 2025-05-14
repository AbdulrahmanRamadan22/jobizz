// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:jobizz/features/companies/data/model/company_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

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
