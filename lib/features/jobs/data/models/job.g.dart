// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      id: (json['id'] as num).toInt(),
      companyId: (json['company_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      jobType: json['job_type'] as String?,
      salary: json['salary'] as String?,
      description: json['description'] as String?,
      requirement: json['requirement'] as String?,
      location: json['location'] as String?,
      position: json['position'] as String?,
      benefits: json['benefits'] as String?,
      categoryName: json['category_name'] as String?,
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
      jobStatus: json['job_status'] as String?,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company_id': instance.companyId,
      'location': instance.location,
      'job_type': instance.jobType,
      'salary': instance.salary,
      'position': instance.position,
      'category_name': instance.categoryName,
      'description': instance.description,
      'requirement': instance.requirement,
      'benefits': instance.benefits,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'isFavorite': instance.isFavorite,
      'job_status': instance.jobStatus,
    };
