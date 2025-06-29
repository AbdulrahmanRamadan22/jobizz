// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponseModel _$HomeResponseModelFromJson(Map<String, dynamic> json) =>
    HomeResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HomeResponseModelToJson(HomeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      trending: (json['Trending'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      popular: (json['Popular'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommended: (json['Recommended'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'Trending': instance.trending,
      'Popular': instance.popular,
      'Recommended': instance.recommended,
    };
