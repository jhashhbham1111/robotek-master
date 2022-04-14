import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:robotek/colorResource.dart';
/*import 'package:flutter_otp/flutter_otp.dart';*/

import 'package:robotek/services/networking.dart';



import 'models/response/verifyotp_response.dart';


class otpVerification extends StatefulWidget {
  const otpVerification({Key? key}) : super(key: key);

  @override
  _otpVerificationState createState() => _otpVerificationState();
}
class _otpVerificationState extends State<otpVerification> {
  final TextEditingController _otpVerificationController = TextEditingController();

  bool isVisible = false;
  NetworkHelper networkHelper = NetworkHelper("http://robotek.frantic.in",);
  void VeriyfOtpApi() async {
    VerifyOtpResponse? res = await networkHelper.VeriyfOtpApi(
      otp: _otpVerificationController.text,
    );
    if(res!.error_code==1) {
      Fluttertoast.showToast(
          msg: "User Already Exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      //navigate here

      print(res!.response_string);
    }
    else if(res!.error_code==2){
      Fluttertoast.showToast(
          msg: "New Registration",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else{
      showSnackBar(res!.response_string);
    }
  }
  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message),);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },


            icon: Icon(Icons.arrow_back, color: Colors.black,)
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(

          height: MediaQuery.of(context).size.height - 120 ,

         width: MediaQuery.of(context).size.width,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 250,

                child: Image.asset('assets/enter-otp-concept-illustration_114360-7887.jpg'), ),

              Container(
                width: 320,
                child: Column(
                  children: const [
                    Text(
                      'Verification',textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Text(
                      'We have sent a 4 digit otp at your number. Please Enter it within 5 min',textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                      ),
                    ),

                  ],
                ),
              ),
            Container(
              width: 250,
              child: PinCodeTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller:_otpVerificationController,
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 4) {
                    return "";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  activeColor: Colors.greenAccent,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                  selectedFillColor: Colors.white
                ),
                cursorColor: Colors.black,

                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,

                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  print("Completed");
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  print(value);
                  setState(() {

                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),



              InkWell(

                child: Container(
                  height: 50,
                  width: 300,


                  decoration: BoxDecoration(
                      color: colorResource.primaryColorLight,
                      borderRadius: BorderRadius.circular(20)

                  ),
                  child: const Center(
                    child: Text('Submit',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  ),
                ),

                onTap: (){
                  print("sknjfjwwi");
                  VeriyfOtpApi();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (BuildContext context) =>otpVerification()));


                },
              ),
            ],
          ),
        ),
      ),

    );
  }

  /*Future<String?> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "9627") {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }
*/
  // action to be performed after OTP validation is success
  /*void moveToNextScreen(context) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>()));
  }

  @override
  Widget otp(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialize the OTP screen by passing validation logic and route callback
      home: OtpScreen(
        otpLength: 4,
        validateOtp: validateOtp,
        routeCallback: moveToNextScreen,
        titleColor: Colors.black,
        themeColor: Colors.black,
      ),
    );
  }*/
}


