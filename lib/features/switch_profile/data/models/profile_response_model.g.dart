// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilesResponseModel _$ProfilesResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfilesResponseModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfilesResponseModelToJson(
        ProfilesResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      profiles: (json['profiles'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'profiles': instance.profiles,
    };

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: (json['id'] as num?)?.toInt(),
      titleJob: json['title_job'] as String?,
      jobPosition: json['job_position'] as String?,
      isDefault: (json['is_default'] as num?)?.toInt(),
      profileImage: json['profile_image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_job': instance.titleJob,
      'job_position': instance.jobPosition,
      'is_default': instance.isDefault,
      'profile_image': instance.profileImage,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
