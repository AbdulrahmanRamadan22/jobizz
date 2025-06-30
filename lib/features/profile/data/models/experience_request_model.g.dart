// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExperienceRequestModel _$ExperienceRequestModelFromJson(
        Map<String, dynamic> json) =>
    ExperienceRequestModel(
      company: json['company'] as String,
      position: json['position'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      isCurrent: json['is_current'] as bool,
      description: json['description'] as String?,
      location: json['location'] as String,
    );

Map<String, dynamic> _$ExperienceRequestModelToJson(
        ExperienceRequestModel instance) =>
    <String, dynamic>{
      'company': instance.company,
      'position': instance.position,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_current': instance.isCurrent,
      'description': instance.description,
      'location': instance.location,
    };
