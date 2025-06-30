import 'package:jobizz/features/profile/data/models/profile_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'education_response_model.g.dart';

@JsonSerializable()
class EducationResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final EducationData? data;

  const EducationResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory EducationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EducationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationResponseModelToJson(this);
}

@JsonSerializable()
class EducationData {
  @JsonKey(name: "educations")
  final List<Education> educations;

  const EducationData({
    required this.educations,
  });

  factory EducationData.fromJson(Map<String, dynamic> json) =>
      _$EducationDataFromJson(json);

  Map<String, dynamic> toJson() => _$EducationDataToJson(this);
}

// @JsonSerializable()
// class EducationItem {
//   @JsonKey(name: "id")
//   final int? id;
//   @JsonKey(name: "profile_id")
//   final int? profileId;
//   @JsonKey(name: "college")
//   final String? college;
//   @JsonKey(name: "degree")
//   final String? degree;
//   @JsonKey(name: "field_of_study")
//   final String? fieldOfStudy;
//   @JsonKey(name: "start_date")
//   final String? startDate;
//   @JsonKey(name: "end_date")
//   final String? endDate;
//   @JsonKey(name: "is_current")
//   final int? isCurrent; // API returns 0/1, not boolean
//   @JsonKey(name: "description")
//   final String? description;
//   @JsonKey(name: "location")
//   final String? location;
//   @JsonKey(name: "image")
//   final String? image;
//   @JsonKey(name: "image_url")
//   final String? imageUrl;
//   @JsonKey(name: "created_at")
//   final String? createdAt;
//   @JsonKey(name: "updated_at")
//   final String? updatedAt;

//   const EducationItem({
//     this.id,
//     this.profileId,
//     this.college,
//     this.degree,
//     this.fieldOfStudy,
//     this.startDate,
//     this.endDate,
//     this.isCurrent,
//     this.description,
//     this.location,
//     this.image,
//     this.imageUrl,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory EducationItem.fromJson(Map<String, dynamic> json) =>
//       _$EducationItemFromJson(json);

//   Map<String, dynamic> toJson() => _$EducationItemToJson(this);

//   // Helper method to convert to boolean
//   bool get isCurrentlyStudying => isCurrent == 1;
// }