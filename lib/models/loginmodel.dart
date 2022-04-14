import 'package:json_annotation/json_annotation.dart';

part 'loginmodel.g.dart';

@JsonSerializable()
class Login {
  final String id;
  final String name;
  final String company_name;
  final String email;
  final String password;
  final String gender;
  final String phone;
  final DateTime? createdAt;

  Login(
      {required this.id,
        required this.name,
        required this.company_name,
        required this.password,
        required this.email,
        required this.gender,

        required this.phone,
        this.createdAt});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}
