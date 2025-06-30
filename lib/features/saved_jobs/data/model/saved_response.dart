// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobizz/features/jobs/data/models/job.dart';

part 'saved_response.g.dart';

@JsonSerializable()
class SavedResponse {
  final String? status;
  final String? message;
  final FavoriteJobsData? data;
  SavedResponse({
    this.status,
    this.message,
    this.data,
  });
  factory SavedResponse.fromJson(Map<String, dynamic> json) =>
      _$SavedResponseFromJson(json);
}

@JsonSerializable()
class FavoriteJobsData {
  @JsonKey(name: 'favorites')
  final List<Job>? favoriteJobs;
  final int? countFavourites;
  FavoriteJobsData({
    this.favoriteJobs,
    this.countFavourites,
  });
  factory FavoriteJobsData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteJobsDataFromJson(json);
}

//@JsonSerializable()
// class SavedJob {
//   final int? id;
//   final String? title;
//   @JsonKey(name: 'company_id')
//   final int? companyId;
//   final String? companyName;
//   final String? location;
//   @JsonKey(name: 'job_type')
//   final String? jobType;
//   @JsonKey(name: 'job_status')
//   final String? jobStatus;
//   final String? salary;
//   final String? position;
//   @JsonKey(name: 'category_name')
//   final String? categoryName;
//   final String? description;
//   final String? requirement;
//   final String? benefits;
//   final bool? isFavorite;
//   final String? companyLogo;

//   SavedJob({
//     this.id,
//     this.title,
//     this.companyId,
//     this.companyName,
//     this.location,
//     this.jobType,
//     this.jobStatus,
//     this.salary,
//     this.position,
//     this.categoryName,
//     this.description,
//     this.requirement,
//     this.benefits,
//     this.isFavorite,
//     this.companyLogo,
//   });
//   factory SavedJob.fromJson(Map<String, dynamic> json) =>
//       _$SavedJobFromJson(json);
// }
