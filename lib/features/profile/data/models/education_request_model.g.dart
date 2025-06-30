// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationRequestModel _$EducationRequestModelFromJson(
        Map<String, dynamic> json) =>
    EducationRequestModel(
      college: json['college'] as String,
      degree: json['degree'] as String,
      fieldOfStudy: json['field_of_study'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      isCurrent: json['is_current'] as bool,
      description: json['description'] as String?,
      location: json['location'] as String,
    );

Map<String, dynamic> _$EducationRequestModelToJson(
        EducationRequestModel instance) =>
    <String, dynamic>{
      'college': instance.college,
      'degree': instance.degree,
      'field_of_study': instance.fieldOfStudy,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_current': instance.isCurrent,
      'description': instance.description,
      'location': instance.location,
    };
