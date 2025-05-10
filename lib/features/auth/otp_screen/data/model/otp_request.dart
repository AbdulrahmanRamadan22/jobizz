// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable()
class OtpRequestCode {
  String email;
  String pinCode;
  OtpRequestCode({
    required this.pinCode,
    required this.email,
  });
  Map<String, dynamic> toJson() => _$OtpRequestCodeToJson(this);
}
