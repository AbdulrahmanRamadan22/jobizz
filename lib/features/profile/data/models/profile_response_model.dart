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
}

@JsonSerializable()
class ProfileData {
  @JsonKey(name: "id")
  final int id;
   @JsonKey(name: "full_name")
  final String? fullName;
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
  final List<Cv> cvs;
  final Portfolios? portfolios;

  // @JsonKey(name: "documents")
  // final List<Document> documents;

  ProfileData(
      {required this.id,
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
      required this.cvs,
      required this.portfolios,
      this.fullName
      // required this.documents,
      });

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@JsonSerializable()
class Education {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "college")
  final String? college;
  @JsonKey(name: "degree")
  final String? degree;
  @JsonKey(name: "field_of_study")
  final String? fieldOfStudy;
  @JsonKey(name: "start_date")
  final String? startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  @JsonKey(name: "is_current")
  final dynamic isCurrent;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "location")
  final String? location;
  final String? image;

  Education({
     this.id,
     this.college,
     this.degree,
     this.fieldOfStudy,
     this.startDate,
     this.endDate,
     this.isCurrent,
     this.description,
     this.location,
     this.image,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}

@JsonSerializable()
class Experience {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "company")
  final String? company;
  @JsonKey(name: "position")
  final String? position;
  @JsonKey(name: "start_date")
  final String? startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  @JsonKey(name: "is_current")
  final dynamic isCurrent;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "location")
  final String? location;
  final String? image;

  Experience({
     this.id,
     this.company,
     this.position,
     this.startDate,
     this.endDate,
     this.isCurrent,
     this.description,
     this.location,
    this.image,
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}

@JsonSerializable()
class Cv {
  final int id;
  final String name;
  final String type;
  final String path;
  Cv({
    required this.id,
    required this.name,
    required this.type,
    required this.path,
  });

  factory Cv.fromJson(Map<String, dynamic> json) => _$CvFromJson(json);
}

@JsonSerializable()
class Portfolios {
  final List<Pdf?>? pdf;
  final List<Url>? url;
  final List<PortfolioImages>? images;

  Portfolios({
    this.pdf,
    this.url,
    this.images,
  });

  factory Portfolios.fromJson(Map<String, dynamic> json) =>
      _$PortfoliosFromJson(json);
}

@JsonSerializable()
class Pdf {
  final int? id;
  final String? name;
  final String? format;
  final String? path;

  Pdf({this.id, this.name, this.format, this.path});

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);
}

@JsonSerializable()
class Url {
  final int? id;
  final String? name;
  final String? format;
  final String? url;

  Url({this.id, this.name, this.format, this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
}

@JsonSerializable()
class PortfolioImages {
  final int? id;
  final String? name;
  final String? format;
  @JsonKey(name: "image_count")
  final int? imageCount;

  final List<PortfolioImageItem>? images;

  PortfolioImages(
      {this.id, this.name, this.format, this.imageCount, this.images});

  factory PortfolioImages.fromJson(Map<String, dynamic> json) =>
      _$PortfolioImagesFromJson(json);
}

@JsonSerializable()
class PortfolioImageItem {
  final int? id;
  final String? path;

  PortfolioImageItem({
    this.id,
    this.path,
  });

  factory PortfolioImageItem.fromJson(Map<String, dynamic> json) =>
      _$PortfolioImageItemFromJson(json);
}
