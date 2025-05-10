import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_model.dart';
import '../../data/model/change_password_response.dart';


part 'change_password_state.freezed.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.changePasswordLoading() = Loading;
  const factory ChangePasswordState.changePasswordSuccess(
      ChangePasswordResponse changePasswordResponse) = Success;
  const factory ChangePasswordState.changePasswordFailure(
      ApiErrorModel apiErrorModel) = Error;
}
