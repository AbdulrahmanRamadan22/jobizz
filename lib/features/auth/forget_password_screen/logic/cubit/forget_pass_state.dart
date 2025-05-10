import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_model.dart';

part 'forget_pass_state.freezed.dart';

@freezed
class ForgetPassState<T> with _$ForgetPassState<T> {
  const factory ForgetPassState.initial() = _Initial;
  const factory ForgetPassState.loading() = Loading;
  const factory ForgetPassState.success(T data , String email) = Success<T>;
  const factory ForgetPassState.failure(ApiErrorModel apiErrorModel) = Error;
}
