import 'package:json_annotation/json_annotation.dart';

part 'reset_password_requast.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  String newPassword;
  @JsonKey(name: 'newPassword_confirmation')
  String newPasswordConfirmation;
  ResetPasswordRequest({
    required this.newPasswordConfirmation,
    required this.newPassword,
  });
  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
