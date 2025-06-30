import 'package:json_annotation/json_annotation.dart';

part 'experience_request_model.g.dart';

@JsonSerializable()
class ExperienceRequestModel {
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
  final String? description;
  @JsonKey(name: "location")
  final String location;


  ExperienceRequestModel(
      {required this.company,
      required this.position,
      required this.startDate,
      this.endDate,
      required this.isCurrent,
      this.description,
      required this.location
      });

  Map<String, dynamic> toJson() => _$ExperienceRequestModelToJson(this);
}
