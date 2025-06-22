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
          ?.map((e) => SavedJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      countFavourites: (json['countFavourites'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FavoriteJobsDataToJson(FavoriteJobsData instance) =>
    <String, dynamic>{
      'favorites': instance.favoriteJobs,
      'countFavourites': instance.countFavourites,
    };

SavedJob _$SavedJobFromJson(Map<String, dynamic> json) => SavedJob(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      companyId: (json['company_id'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      location: json['location'] as String?,
      jobType: json['job_type'] as String?,
      jobStatus: json['job_status'] as String?,
      salary: json['salary'] as String?,
      position: json['position'] as String?,
      categoryName: json['category_name'] as String?,
      description: json['description'] as String?,
      requirement: json['requirement'] as String?,
      benefits: json['benefits'] as String?,
      isFavorite: json['isFavorite'] as bool?,
      companyLogo: json['companyLogo'] as String?,
    );

Map<String, dynamic> _$SavedJobToJson(SavedJob instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company_id': instance.companyId,
      'companyName': instance.companyName,
      'location': instance.location,
      'job_type': instance.jobType,
      'job_status': instance.jobStatus,
      'salary': instance.salary,
      'position': instance.position,
      'category_name': instance.categoryName,
      'description': instance.description,
      'requirement': instance.requirement,
      'benefits': instance.benefits,
      'isFavorite': instance.isFavorite,
      'companyLogo': instance.companyLogo,
    };
