// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resalerlogin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResalerLoginResponse _$ResalerLoginResponseFromJson(
        Map<String, dynamic> json) =>
    ResalerLoginResponse(
      error_code: json['error_code'] as int,
      response_string: json['response_string'] as String,
    );

Map<String, dynamic> _$ResalerLoginResponseToJson(
        ResalerLoginResponse instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'response_string': instance.response_string,
    };
