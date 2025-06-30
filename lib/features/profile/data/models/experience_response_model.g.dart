// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceResponseModel _$ExperienceResponseModelFromJson(
        Map<String, dynamic> json) =>
    ExperienceResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ExperienceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExperienceResponseModelToJson(
        ExperienceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ExperienceData _$ExperienceDataFromJson(Map<String, dynamic> json) =>
    ExperienceData(
      experiences: (json['experiences'] as List<dynamic>)
          .map((e) => Experience.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExperienceDataToJson(ExperienceData instance) =>
    <String, dynamic>{
      'experiences': instance.experiences,
    };
