
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:robotek/dealerRegistration.dart';
import 'package:robotek/models/response/login_response.dart';
import 'package:robotek/models/response/resalerlogin_response.dart';

import '../models/data_model.dart';
import '../models/response/dealer_registration.dart';

import '../models/response/verifyotp_response.dart';

class NetworkHelper{
  final String url;
  final dio=Dio();
  NetworkHelper(this.url);
/////////LoginResponse///////////
  Future<LoginResponse?> login({
    String? name, String? email, String? phone, String? company_name, String? password
  })async {
    try {
      var fromData = FormData.fromMap(
          {'phone':phone,'password':password}
      );
      var respose = await dio.post(
        '$url/RestApi/login_dealer',
        data:fromData,
      );
      return LoginResponse.fromJson(respose.data);
    } on DioError catch (e){
      print("Http Error ${e.response}");
      throw  HttpException(e.message);
    }
  }
/////////DealerRegistrationResponseApi///////////
   Future<DealerRegistrationResponse?>Register({
  String? name, String?  email, String? phone, String? company_name, String? password, String? location, String? pincode
})async {
     try {
       var fromData = FormData.fromMap(
           {
             'phone': phone,
             'password': password,
             'email': email,
             'name': name,
             'company_name': company_name,
             'location':location,
             'pincode':pincode
           }
       );
       var respose = await dio.post(
         '$url/RestApi/register_dealer',
         data: fromData,
       );
       return DealerRegistrationResponse.fromJson(respose.data);
     }
     on DioError catch (e){
       print("Http Error ${e.response}");
       throw  HttpException(e.message);
     }

   }

   ////////////ResalerLoginApi///////////
   Future<ResalerLoginResponse>ResalerLoginApi
       ({String? phone})
  async{
    try{
      var fromData = FormData.fromMap(
        {'phone':phone,});
      var response = await dio.post(
        '$url/RestApi/login_user',
            data: fromData,

      );
      return ResalerLoginResponse.fromJson(response.data);
    } on DioError catch (e){
      print("Http Error ${e.response}");
      throw  HttpException(e.message);
    }

  }
  ////////////VerifyOtpApi/////////////////
  Future<VerifyOtpResponse>VeriyfOtpApi
      ({ String? otp,})
  async{
    try{
      var fromData = FormData.fromMap(
          {'otp':otp});
      var response = await dio.post(
        '$url/RestApi/verify_otp',
        data: fromData,
      );
      return VerifyOtpResponse.fromJson(response.data);
    } on DioError catch (e){
      print("Http Error ${e.response}");
      throw  HttpException(e.message);
    }

  }
   }
