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
