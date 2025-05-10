// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResponse _$OtpResponseFromJson(Map<String, dynamic> json) => OtpResponse(
      json['message'] as String?,
      json['status'] as String?,
      DataOtp.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpResponseToJson(OtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

DataOtp _$DataOtpFromJson(Map<String, dynamic> json) => DataOtp(
      json['token'] as String?,
    );

Map<String, dynamic> _$DataOtpToJson(DataOtp instance) => <String, dynamic>{
      'token': instance.token,
    };
