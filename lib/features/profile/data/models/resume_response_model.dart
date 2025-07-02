import 'package:jobizz/features/profile/data/models/profile_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resume_response_model.g.dart';

@JsonSerializable()
class ResumeResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final ResumeData? data;

  const ResumeResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory ResumeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResumeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeResponseModelToJson(this);
}

@JsonSerializable()
class ResumeData {
  @JsonKey(name: "cvs")
  final List<Cv> cvs;

  const ResumeData({
    required this.cvs,
  });

  factory ResumeData.fromJson(Map<String, dynamic> json) =>
      _$ResumeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeDataToJson(this);
}


