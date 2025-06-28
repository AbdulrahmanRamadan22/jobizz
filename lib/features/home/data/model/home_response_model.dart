import 'package:json_annotation/json_annotation.dart';

import '../../../jobs/data/models/job.dart';

part 'home_response_model.g.dart';

@JsonSerializable()
class HomeResponseModel {
  final String? status;
  final String? message;
  final Data? data;

  HomeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "Trending")
  final List<Job?>? trending;
  @JsonKey(name: "Popular")
  final List<Job?>? popular;
  @JsonKey(name: "Recommended")
  final List<Job?>? recommended;

  Data({
    this.trending,
    this.popular,
    this.recommended,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

// class Job {


//   @JsonKey(name: 'job_status')
//   final String? jobStatus;



// @JsonSerializable()
// class Job {
//   final int id;
//   final String? title;
//   @JsonKey(name: "company_id")
//   final int? companyId;
//   final String? location;
//   @JsonKey(name: "job_type")
//   final String? jobType;
//   final String? salary;
//   final String? position;
//   @JsonKey(name: "category_name")
//   final String? categoryName;
//   final String? description;
//   final String? requirement;
//   final String? benefits;
//   final String? companyName;
//   final String? companyLogo;
//   final bool isFavorite;

//   // @JsonKey(name: "job_status")
//   // final String? jobStatus;

//   Job({
//   required  this.id,
//     this.companyId,
//     this.title,
//     this.jobType,
//     this.salary,
//     this.description,
//     this.requirement,
//     this.location,
//     this.position,
//     this.benefits,
//     this.categoryName,
//     this.companyName,
//     this.companyLogo,
//     required this.isFavorite,
//   });

//   factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

//   Map<String, dynamic> toJson() => _$JobToJson(this);
// }
