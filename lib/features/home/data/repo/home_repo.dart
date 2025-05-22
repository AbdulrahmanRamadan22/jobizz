// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:jobizz/features/home/data/model/home_response_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_services.dart';

class HomeRepo {
  final ApisServices _apisServices;
  HomeRepo(
    this._apisServices,
  );
  Future<ApiResult<HomeResponseModel>> getHomeData(
      {required String token}) async {
    try {
      final response = await _apisServices.homeData(token);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }



}


