import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final ProfileData? profileData;

  const ProfileResponseModel({
    required this.status,
    required this.message,
    required this.profileData,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class ProfileData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "user_id")
  final int userId;
  @JsonKey(name: "title_job")
  final String titleJob;
  @JsonKey(name: "job_position")
  final String jobPosition;
  @JsonKey(name: "is_default")
  final int isDefault;
  @JsonKey(name: "profile_image")
  final String profileImage;
  @JsonKey(name: "applied_applications")
  final int appliedApplications;
  @JsonKey(name: "interview_applications")
  final int interviewApplications;
  @JsonKey(name: "reviewed_applications")
  final int reviewedApplications;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "educations")
  final List<Education> educations;
  @JsonKey(name: "experiences")
  final List<Experience> experiences;
  @JsonKey(name: "documents")
  final List<Document> documents;

  ProfileData({
    required this.id,
    required this.userId,
    required this.titleJob,
    required this.jobPosition,
    required this.isDefault,
    required this.profileImage,
    required this.appliedApplications,
    required this.interviewApplications,
    required this.reviewedApplications,
    required this.createdAt,
    required this.updatedAt,
    required this.educations,
    required this.experiences,
    required this.documents,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}

@JsonSerializable()
class Document {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "format")
  final String format;
  @JsonKey(name: "url")
  final String url;

  Document({
    required this.id,
    required this.name,
    required this.type,
    required this.format,
    required this.url,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable()
class Education {
  @JsonKey(name: "id")
  final int id;
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
  final bool isCurrent;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "location")
  final String location;
  final String image;

  Education({
    required this.id,
    required this.college,
    required this.degree,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
    required this.description,
    required this.location,
    required this.image,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}

@JsonSerializable()
class Experience {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "company")
  final String company;
  @JsonKey(name: "position")
  final String position;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  @JsonKey(name: "is_current")
  final bool isCurrent;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "location")
  final String location;
  final String? image;


  Experience({
    required this.id,
    required this.company,
    required this.position,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
    required this.description,
    required this.location,
     this.image,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
