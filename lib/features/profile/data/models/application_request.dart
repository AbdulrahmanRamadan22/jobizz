import 'package:json_annotation/json_annotation.dart';
part 'application_request.g.dart';

@JsonSerializable()
class ApplicationRequest {
  final int cv_id;

  ApplicationRequest({
    required this.cv_id,

  });
  Map<String, dynamic> toJson() => _$ApplicationRequestToJson(this);
}
