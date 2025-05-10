import 'package:json_annotation/json_annotation.dart';
part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  String? message;
  String? status;

  ChangePasswordResponse(this.message, this.status);
  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
}
