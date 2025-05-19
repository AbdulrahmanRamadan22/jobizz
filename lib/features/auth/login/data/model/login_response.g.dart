// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      id: (json['id'] as num).toInt(),
      profiles: (json['profiles'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token': instance.token,
      'fullName': instance.fullName,
      'email': instance.email,
      'id': instance.id,
      'profiles': instance.profiles,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      titleJob: json['title_job'] as String?,
      jobPosition: json['job_position'] as String?,
      isDefault: (json['is_default'] as num?)?.toInt(),
      profileImage: json['profile_image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title_job': instance.titleJob,
      'job_position': instance.jobPosition,
      'is_default': instance.isDefault,
      'profile_image': instance.profileImage,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
