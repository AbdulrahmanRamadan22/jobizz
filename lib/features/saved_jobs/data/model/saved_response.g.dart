// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedResponse _$SavedResponseFromJson(Map<String, dynamic> json) =>
    SavedResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : FavoriteJobsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SavedResponseToJson(SavedResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FavoriteJobsData _$FavoriteJobsDataFromJson(Map<String, dynamic> json) =>
    FavoriteJobsData(
      favoriteJobs: (json['favorites'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      countFavourites: (json['countFavourites'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FavoriteJobsDataToJson(FavoriteJobsData instance) =>
    <String, dynamic>{
      'favorites': instance.favoriteJobs,
      'countFavourites': instance.countFavourites,
    };
