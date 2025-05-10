// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequestCode _$OtpRequestCodeFromJson(Map<String, dynamic> json) =>
    OtpRequestCode(
      pinCode: json['pinCode'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$OtpRequestCodeToJson(OtpRequestCode instance) =>
    <String, dynamic>{
      'email': instance.email,
      'pinCode': instance.pinCode,
    };
