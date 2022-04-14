// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifyotp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      error_code: json['error_code'] as int,
      response_string: json['response_string'] as String, phone: '',
    );

Map<String, dynamic> _$VerifyOtpResponseToJson(VerifyOtpResponse instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'response_string': instance.response_string,
    };
