// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EducationResponseModel _$EducationResponseModelFromJson(
        Map<String, dynamic> json) =>
    EducationResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : EducationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EducationResponseModelToJson(
        EducationResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

EducationData _$EducationDataFromJson(Map<String, dynamic> json) =>
    EducationData(
      educations: (json['educations'] as List<dynamic>)
          .map((e) => Education.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EducationDataToJson(EducationData instance) =>
    <String, dynamic>{
      'educations': instance.educations,
    };
