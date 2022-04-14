import 'package:json_annotation/json_annotation.dart';

part 'verifyotp_response.g.dart';

@JsonSerializable()
class VerifyOtpResponse {
  final int error_code;
  final String response_string;
  final String? phone;

  VerifyOtpResponse(
      {required this.error_code, required this.response_string, required this.phone});
  factory VerifyOtpResponse.fromJson(Map<String, dynamic>json) =>

      _$VerifyOtpResponseFromJson(json,);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}
