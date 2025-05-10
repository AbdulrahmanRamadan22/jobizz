import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_model.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(T data) = Success<T>;
  const factory SignUpState.failure(ApiErrorModel error) = Error;

  const factory SignUpState.googleAuthenticationLoading() =
      GoogleAuthenticationLoading;
  const factory SignUpState.googleAuthenticationSuccess(T data) =
      GoogleAuthenticationSuccess<T>;
  const factory SignUpState.googleAuthenticationFailure(
      ApiErrorModel apiErrorModel) = GoogleAuthenticationError;
}
