import 'package:json_annotation/json_annotation.dart';
part 'company_response.g.dart';

@JsonSerializable()
class CompanyResponse {
  final String? status;
  final String? message;
  final CompanyData? data;

  CompanyResponse(
    this.status,
    this.message,
    this.data,
  );

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);
}

@JsonSerializable()
class CompanyData {
  @JsonKey(name: 'Trending')
  final List<Company?>? trending;
  @JsonKey(name: 'Popular')
  final List<Company>? popular;

  CompanyData(
    this.trending,
    this.popular,
  );

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);
}

@JsonSerializable()
class Company {
  final int? id;
  final String? name;
  @JsonKey(name: 'admin_id')
  final int? adminId;
  final String? logo;
  final String? description;
  @JsonKey(name: 'jobs_count')
  final int? jobsCount;
  final String? location;
  final String? website;
  final String? size;
  @JsonKey(name: 'hired_people')
  final int? hiredPeople;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<Job>? jobs;

  Company(
    this.id,
    this.name,
    this.adminId,
    this.logo,
    this.description,
    this.location,
    this.website,
    this.size,
    this.hiredPeople,
    this.createdAt,
    this.updatedAt,
    this.jobs,
    this.jobsCount,
  );

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@JsonSerializable()
class Job {
  final int? id;
  @JsonKey(name: 'company_id')
  final int? companyId;
  final String? title;
  @JsonKey(name: 'job_status')
  final String? jobStatus;
  @JsonKey(name: 'job_salary')
  final String? jobSalary;

  Job(
    this.id,
    this.companyId,
    this.title,
    this.jobStatus,
    this.jobSalary,
  );

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
