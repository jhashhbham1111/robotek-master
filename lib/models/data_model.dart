import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class Data {
  final String id;
  final String name;
  final String company_name;
  final String email;
  final String password;
  final String gender;
  final String? pincode;
  final String? locations;
  final String phone;
  final DateTime? createdAt;

  Data(
      {required this.id,
      required this.name,
      required this.company_name,
      required this.password,
      required this.email,
      required this.gender,
      this.pincode,
       this.locations,
      required this.phone,
      this.createdAt});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
