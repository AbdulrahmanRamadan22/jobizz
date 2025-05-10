import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_model.dart';
part 'resetpassword_state.freezed.dart';

@freezed
class ResetPasswordState<T> with _$ResetPasswordState<T> {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = Loading;
  const factory ResetPasswordState.success(T data) = Success<T>;
  const factory ResetPasswordState.error(ApiErrorModel apiErrorModel) = Error;
}
