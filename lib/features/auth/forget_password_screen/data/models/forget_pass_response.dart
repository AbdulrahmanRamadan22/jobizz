import 'package:json_annotation/json_annotation.dart';
part 'forget_pass_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  String? message;
  String? status;

  ForgetPasswordResponse(
    this.message,
    this.status,
  );
  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);
}
