// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerRegistrationResponse _$DealerRegistrationResponseFromJson(
        Map<String, dynamic> json) =>
    DealerRegistrationResponse(
      error_code: json['error_code'] as int,
      response_string: json['response_string'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DealerRegistrationResponseToJson(
        DealerRegistrationResponse instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'response_string': instance.response_string,
      'data': instance.data,
    };
