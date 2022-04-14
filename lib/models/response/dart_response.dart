import 'package:json_annotation/json_annotation.dart';

part 'dart_response.g.dart';

@JsonSerializable()
class DataResponse{
 final int error_code;
 final String response_string;

 DataResponse(
 {
   required this.error_code,
   required this.response_string,
   });
 factory DataResponse.fromJson(Map<String, dynamic> json) =>
     _$DataResponseFromJson(json);

}

