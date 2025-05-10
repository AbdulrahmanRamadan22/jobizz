// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? status;
  String? message;
  UserData? data;
  SignUpResponse(
    this.status,
    this.message,
    this.data,
  );

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  int? id;
  String? fullName;
  String? email;
  UserData(
    this.id,
    this.fullName,
    this.email,
  );
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
