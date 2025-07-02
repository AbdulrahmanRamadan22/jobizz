// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumeResponseModel _$ResumeResponseModelFromJson(Map<String, dynamic> json) =>
    ResumeResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ResumeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResumeResponseModelToJson(
        ResumeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ResumeData _$ResumeDataFromJson(Map<String, dynamic> json) => ResumeData(
      cvs: (json['cvs'] as List<dynamic>)
          .map((e) => Cv.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResumeDataToJson(ResumeData instance) =>
    <String, dynamic>{
      'cvs': instance.cvs,
    };
