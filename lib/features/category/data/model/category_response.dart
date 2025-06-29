// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../jobs/data/models/job.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse {
  final String? status;
  final String? message;
  final CategoryData? data;

  CategoryResponse(
    this.status,
    this.message,
    this.data,
  );

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@JsonSerializable()
class CategoryData {
  @JsonKey(name: 'Trending')
  final List<Category?>? trending;

  @JsonKey(name: 'Popular')
  final List<Category?>? popular;
  CategoryData(
    this.trending,
    this.popular,
  );

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@JsonSerializable()
class Category {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  @JsonKey(name: 'jobs_count')
  final int? jobsCount;
  @JsonKey(name: 'companies_count')
  final int? companiesCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final String? description;
  final List<Job>? jobs;
  Category(
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.jobs,
    this.jobsCount,
    this.companiesCount,
    this.description,
  );

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

// @JsonSerializable()
// class Job {
//   final int? id;
//   @JsonKey(name: 'company_id')
//   final int? companyId;
//   final String? title;
//   @JsonKey(name: 'job_type')
//   final String? jobType;
//   final String? salary;
//   final String? description;
//   final String? requirement;
//   @JsonKey(name: 'job_status')
//   final String? jobStatus;
//   final String? location;
//   final String? position;
//   final String? benefits;
//   @JsonKey(name: 'category_name')
//   final String? categoryName;
//   final String? companyName;
//   final String? companyLogo;
//   @JsonKey(name: 'created_at')
//   final String? createdAt;
//   @JsonKey(name: 'updated_at')
//   final String? updatedAt;

//   Job(
//     this.id,
//     this.companyId,
//     this.title,
//     this.jobType,
//     this.salary,
//     this.description,
//     this.requirement,
//     this.jobStatus,
//     this.location,
//     this.position,
//     this.benefits,
//     this.categoryName,
//     this.createdAt,
//     this.updatedAt,
//     this.companyName,
//     this.companyLogo,
//   );

//   factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
// }
