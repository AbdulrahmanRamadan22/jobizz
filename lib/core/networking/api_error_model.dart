import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';
import 'package:jobizz/core/helper/extensions.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? status;
  final String? message;
  @JsonKey(name: "data")
  List<dynamic> ? errors;

  ApiErrorModel({
    this.status,
    this.message,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getErrorMessage() {
    // 1. Handle null/empty cases first
    if (errors.isNullOrEmpty()) {
      return message ?? "Unknown error occurred";
    }

    // 2. Safe to use ! here because we've validated data is non-null and non-empty
    final errorMessages = errors!.join('\n');

    log("Error messages: $errorMessages");
    return errorMessages;
  }
}

// String getAllErrorMessages() {
//   if (errors.isNullOrEmpty()) return message ?? "Unknown error occurred";

//   final errorMessages = errors!.entries.map((entry) {
//     final value = entry.value;
//     return "${value.join(', ')}";
//   }).join('\n');

//   return errorMessages;
// }
