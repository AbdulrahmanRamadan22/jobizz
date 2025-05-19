import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/features/auth/login/data/model/login_response.dart';

import '../../../../../core/networking/api_error_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(LoginResponse loginResponse) = Success;
  const factory LoginState.failure(ApiErrorModel apiErrorModel) = Error;



  const factory LoginState.googleAuthenticationLoading() = GoogleAuthenticationLoading;
  const factory LoginState.googleAuthenticationSuccess(T data) = GoogleAuthenticationSuccess<T>;
  const factory LoginState.googleAuthenticationFailure(ApiErrorModel apiErrorModel) = GoogleAuthenticationError;
}
