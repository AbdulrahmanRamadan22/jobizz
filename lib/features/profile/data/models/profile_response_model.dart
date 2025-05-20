import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "data")
    Data data;

    ProfileResponseModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileResponseModel.fromJson(Map<String, dynamic> json) => _$ProfileResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "user_id")
    int userId;
    @JsonKey(name: "title_job")
    String titleJob;
    @JsonKey(name: "job_position")
    String jobPosition;
    @JsonKey(name: "is_default")
    int isDefault;
    @JsonKey(name: "profile_image")
    String profileImage;
    @JsonKey(name: "applied_applications")
    int appliedApplications;
    @JsonKey(name: "interview_applications")
    int interviewApplications;
    @JsonKey(name: "reviewed_applications")
    int reviewedApplications;
    @JsonKey(name: "created_at")
    DateTime createdAt;
    @JsonKey(name: "updated_at")
    DateTime updatedAt;
    @JsonKey(name: "educations")
    List<Education> educations;
    @JsonKey(name: "experiences")
    List<Experience> experiences;
    @JsonKey(name: "documents")
    List<Document> documents;

    Data({
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

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Document {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "type")
    String type;
    @JsonKey(name: "format")
    String format;
    @JsonKey(name: "url")
    String url;

    Document({
        required this.id,
        required this.name,
        required this.type,
        required this.format,
        required this.url,
    });

    factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

    Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

@JsonSerializable()
class Education {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "college")
    String college;
    @JsonKey(name: "degree")
    String degree;
    @JsonKey(name: "field_of_study")
    String fieldOfStudy;
    @JsonKey(name: "start_date")
    DateTime startDate;
    @JsonKey(name: "end_date")
    DateTime? endDate;
    @JsonKey(name: "is_current")
    bool isCurrent;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "location")
    String location;

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
    });

    factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);

    Map<String, dynamic> toJson() => _$EducationToJson(this);
}

@JsonSerializable()
class Experience {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "company")
    String company;
    @JsonKey(name: "position")
    String position;
    @JsonKey(name: "start_date")
    DateTime startDate;
    @JsonKey(name: "end_date")
    DateTime? endDate;
    @JsonKey(name: "is_current")
    bool isCurrent;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "location")
    String location;

    Experience({
        required this.id,
        required this.company,
        required this.position,
        required this.startDate,
        required this.endDate,
        required this.isCurrent,
        required this.description,
        required this.location,
    });

    factory Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);

    Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
