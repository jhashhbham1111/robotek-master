import 'package:json_annotation/json_annotation.dart';

part 'resalerlogin_response.g.dart';

@JsonSerializable()
class ResalerLoginResponse {
  final int error_code;
  final String response_string;

  ResalerLoginResponse(
      {required this.error_code, required this.response_string,});

  factory ResalerLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$ResalerLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResalerLoginResponseToJson(this);
}