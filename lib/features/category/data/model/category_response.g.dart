// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : CategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      (json['Trending'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Popular'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'Trending': instance.trending,
      'Popular': instance.popular,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['slug'] as String?,
      json['image'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      (json['jobs'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['jobs_count'] as num?)?.toInt(),
      (json['companies_count'] as num?)?.toInt(),
      json['description'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'jobs_count': instance.jobsCount,
      'companies_count': instance.companiesCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'description': instance.description,
      'jobs': instance.jobs,
    };

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      (json['id'] as num?)?.toInt(),
      (json['company_id'] as num?)?.toInt(),
      json['title'] as String?,
      json['job_type'] as String?,
      json['salary'] as String?,
      json['description'] as String?,
      json['requirement'] as String?,
      json['job_status'] as String?,
      json['location'] as String?,
      json['position'] as String?,
      json['benefits'] as String?,
      json['category_name'] as String?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['companyName'] as String?,
      json['companyLogo'] as String?,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'title': instance.title,
      'job_type': instance.jobType,
      'salary': instance.salary,
      'description': instance.description,
      'requirement': instance.requirement,
      'job_status': instance.jobStatus,
      'location': instance.location,
      'position': instance.position,
      'benefits': instance.benefits,
      'category_name': instance.categoryName,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
