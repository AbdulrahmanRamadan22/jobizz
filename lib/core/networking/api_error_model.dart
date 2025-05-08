
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';



@JsonSerializable()
class ApiErrorModel {

  final String? status;
  final String? message;
  final List<dynamic>? data;

  ApiErrorModel({
     this.status,
     this.message,
     this.data,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getErrorMessage() {
    if (data != null && data!.isNotEmpty) {
      return data!.join('\n');
    }
    return message ?? 'Unknown error occurred';
}
}
