// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'reset_passwoed_response.g.dart';
@JsonSerializable()
class ResetPasswordResponse {
  String? status;
  String? message;
  ResetPasswordResponse({
    this.status,
    this.message,
  });
  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}
