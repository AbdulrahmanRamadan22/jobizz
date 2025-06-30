import 'package:json_annotation/json_annotation.dart';

part 'education_request_model.g.dart';

@JsonSerializable()
class EducationRequestModel {
  @JsonKey(name: "college")
  final String college;
  @JsonKey(name: "degree")
  final String degree;
  @JsonKey(name: "field_of_study")
  final String fieldOfStudy;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  @JsonKey(name: "is_current")
  final bool isCurrent; // API returns 0/1, not boolean
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "location")
  final String location;

 

  EducationRequestModel({
    required this.college,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    this.endDate,
    required this.isCurrent,
    this.description,
    required this.location
  
  });

  Map<String, dynamic> toJson() => _$EducationRequestModelToJson(this);
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