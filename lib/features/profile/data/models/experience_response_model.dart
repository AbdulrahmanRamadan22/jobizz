import 'package:jobizz/features/profile/data/models/profile_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'experience_response_model.g.dart';

@JsonSerializable()
class ExperienceResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final ExperienceData? data;

  const ExperienceResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ExperienceResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceResponseModelToJson(this);
}

@JsonSerializable()
class ExperienceData {
  @JsonKey(name: "experiences")
  final List<Experience> experiences;

  const ExperienceData({
    required this.experiences,
  });

  factory ExperienceData.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceDataToJson(this);
}