// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  String? message;
  String? status;
  DataOtp data;
  OtpResponse(
    this.message,
    this.status,
    this.data,
  );
  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);
}

@JsonSerializable()
class DataOtp {
  String? token;
  DataOtp(
    this.token,
  );
  factory DataOtp.fromJson(Map<String, dynamic> json) =>
      _$DataOtpFromJson(json);
}
