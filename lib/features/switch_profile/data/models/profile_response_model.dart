import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfilesResponseModel {
  String message;
  Data data;

  ProfilesResponseModel({
    required this.message,
    required this.data,
  });

  factory ProfilesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfilesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilesResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  List<ProfileModel?>? profiles;

  Data({
    this.profiles,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ProfileModel {
  final int? id;
  @JsonKey(name: "title_job")
  final String? titleJob;
  @JsonKey(name: "job_position")
  final String? jobPosition;
  @JsonKey(name: "is_default")
  final int? isDefault;
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  ProfileModel(
      {this.id,
      this.titleJob,
      this.jobPosition,
      this.isDefault,
      this.profileImage,
      this.createdAt,
      this.updatedAt});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
