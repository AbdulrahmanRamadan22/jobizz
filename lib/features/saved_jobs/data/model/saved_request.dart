import 'package:json_annotation/json_annotation.dart';

part 'saved_request.g.dart';
@JsonSerializable()
class SavedRequest {
  final String? status;
  final String? message;
  SavedRequest({
    this.status,
    this.message,
  });
  factory SavedRequest.fromJson(Map<String, dynamic> json) =>
      _$SavedRequestFromJson(json);
}
