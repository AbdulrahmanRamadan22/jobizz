// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
