// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) =>
    CompanyResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : CompanyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) => CompanyData(
      (json['Trending'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['Popular'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'Trending': instance.trending,
      'Popular': instance.popular,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      (json['admin_id'] as num?)?.toInt(),
      json['logo'] as String?,
      json['description'] as String?,
      json['location'] as String?,
      json['website'] as String?,
      json['size'] as String?,
      (json['hired_people'] as num?)?.toInt(),
      json['created_at'] as String?,
      json['updated_at'] as String?,
      (json['jobs'] as List<dynamic>?)
          ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'admin_id': instance.adminId,
      'logo': instance.logo,
      'description': instance.description,
      'location': instance.location,
      'website': instance.website,
      'size': instance.size,
      'hired_people': instance.hiredPeople,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'jobs': instance.jobs,
    };

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      (json['id'] as num?)?.toInt(),
      (json['company_id'] as num?)?.toInt(),
      json['title'] as String?,
      json['job_status'] as String?,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'title': instance.title,
      'job_status': instance.jobStatus,
    };
