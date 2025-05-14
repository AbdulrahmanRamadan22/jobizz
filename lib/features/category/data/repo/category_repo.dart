// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jobizz/features/category/data/model/category_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';

class CategoryRepo {
  final ApisServices apisServices;
  CategoryRepo(
    this.apisServices,
  );
  Future<ApiResult<CategoryResponse>> getCategories(
      {required String token}) async {
    try {
      final response = await apisServices.getCategories(token);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
