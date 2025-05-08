import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? status;
  String? message;
  UserData data;
  LoginResponse({
    this.status,
    required this.message,
    required this.data,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String token;
  String fullName;
  String email;
  int id;
  UserData({
    required this.token,
    required this.fullName,
    required this.email,
    required this.id,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
