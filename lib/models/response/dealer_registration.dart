import 'package:json_annotation/json_annotation.dart';

import '../data_model.dart';

part 'dealer_registration.g.dart';

@JsonSerializable()

/////////////DealerRegistrationResponse////////////
class DealerRegistrationResponse{
  final int error_code;
  final String response_string;
  final Data? data;
  DealerRegistrationResponse({
    required this.error_code,required this.response_string,this.data
  });
  factory DealerRegistrationResponse.fromJson(Map<String,dynamic>json)=>
      _$DealerRegistrationResponseFromJson(json);

  Map<String ,dynamic> toJson() => _$DealerRegistrationResponseToJson(this);

}


