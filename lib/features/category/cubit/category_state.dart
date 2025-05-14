import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/model/category_response.dart';
part 'category_state.freezed.dart';
@freezed
class CategoryState<T> with _$CategoryState<T> {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.categoryLoading() = CategoryLoading;
  const factory CategoryState.categorySuccess(CategoryResponse categoryResponse) = CategorySuccess;
  const factory CategoryState.categoryFailure(ApiErrorModel apiErrorModel) = CategoryFailure;
}