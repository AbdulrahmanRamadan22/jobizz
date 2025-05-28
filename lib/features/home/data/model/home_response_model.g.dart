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
              (e) => e == null ? null : Jop.fromJson(e as Map<String, dynamic>))
          .toList(),
      popular: (json['Popular'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Jop.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommended: (json['Recommended'] as List<dynamic>?)
          ?.map(
              (e) => e == null ? null : Jop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'Trending': instance.trending,
      'Popular': instance.popular,
      'Recommended': instance.recommended,
    };

Jop _$JopFromJson(Map<String, dynamic> json) => Jop(
      id: (json['id'] as num?)?.toInt(),
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
      isFavorite: json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$JopToJson(Jop instance) => <String, dynamic>{
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
    };
