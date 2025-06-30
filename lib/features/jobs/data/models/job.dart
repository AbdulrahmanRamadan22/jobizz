import 'package:freezed_annotation/freezed_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  final int id;
  final String? title;
  @JsonKey(name: "company_id")
  final int? companyId;
  final String? location;
  @JsonKey(name: "job_type")
  final String? jobType;
  final String? salary;
  final String? position;
  @JsonKey(name: "category_name")
  final String? categoryName;
  final String? description;
  final String? requirement;
  final String? benefits;
  final String? companyName;
  final String? companyLogo;
  final bool isFavorite;

  @JsonKey(name: "job_status")
  final String? jobStatus;

  Job({
    required this.id,
    this.companyId,
    this.title,
    this.jobType,
    this.salary,
    this.description,
    this.requirement,
    this.location,
    this.position,
    this.benefits,
    this.categoryName,
    this.companyName,
    this.companyLogo,
    this.jobStatus,
    required this.isFavorite,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

  Map<String, dynamic> toJson() => _$JobToJson(this);
}
