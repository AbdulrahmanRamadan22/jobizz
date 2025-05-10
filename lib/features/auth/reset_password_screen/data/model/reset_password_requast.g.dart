// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_requast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequest(
      newPasswordConfirmation: json['newPassword_confirmation'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'newPassword': instance.newPassword,
      'newPassword_confirmation': instance.newPasswordConfirmation,
    };
