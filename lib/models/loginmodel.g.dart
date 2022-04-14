// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      id: json['id'] as String,
      name: json['name'] as String,
      company_name: json['company_name'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company_name': instance.company_name,
      'email': instance.email,
      'password': instance.password,
      'gender': instance.gender,
      'phone': instance.phone,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
