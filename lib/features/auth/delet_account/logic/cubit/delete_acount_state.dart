import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/core/networking/api_error_model.dart';

part 'delete_acount_state.freezed.dart';

@freezed
class DeleteAccountState<T> with _$DeleteAccountState<T> {
  const factory DeleteAccountState.initial() = _Initial;

  const factory DeleteAccountState.deleteAccountLoading() =
      DeleteAccountLoading<T>;

  const factory DeleteAccountState.deleteAccountSuccess(T data) =
      DeleteAccountSuccess<T>;

  const factory DeleteAccountState.deleteAccountFailure(
      ApiErrorModel apiErrorModel) = DeleteAccountFailure;
}
