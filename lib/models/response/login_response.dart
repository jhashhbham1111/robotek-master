import 'package:json_annotation/json_annotation.dart';
import 'package:robotek/models/loginmodel.dart';


import '../loginmodel.dart';


part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int error_code;
  final String response_string;
  final Login? login;
  LoginResponse(
      {required this.error_code, required this.response_string, this.login});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
