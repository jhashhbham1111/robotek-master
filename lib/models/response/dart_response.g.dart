// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      error_code: json['error_code'] as int,
      response_string: json['response_string'] as String,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'response_string': instance.response_string,
    };
