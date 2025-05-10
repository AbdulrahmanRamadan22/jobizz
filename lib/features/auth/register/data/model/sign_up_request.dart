// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final String fullName;
  SignUpRequest({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.fullName,
  });
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
