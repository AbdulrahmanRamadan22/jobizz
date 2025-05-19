// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  List<Profile?> profiles;

  UserData({
    required this.token,
    required this.fullName,
    required this.email,
    required this.id,
    required this.profiles,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@JsonSerializable()
class Profile {
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'title_job')
  final String? titleJob;
  @JsonKey(name: 'job_position')
  final String? jobPosition;
  @JsonKey(name: 'is_default')
  final int? isDefault;
  @JsonKey(name: 'profile_image')
  final String? profileImage;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  Profile({
    this.id,
    this.userId,
    this.titleJob,
    this.jobPosition,
    this.isDefault,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
