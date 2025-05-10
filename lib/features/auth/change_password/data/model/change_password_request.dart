// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';
@JsonSerializable()
class ChangePasswordRequest {
  String newPassword;
  @JsonKey(name: 'newPassword_confirmation')
  String newPasswordConfirmation;
  String oldPassword;
  ChangePasswordRequest({
    required this.newPassword,
    required this.newPasswordConfirmation,
    required this.oldPassword,
  });

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}


