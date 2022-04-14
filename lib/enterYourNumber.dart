import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:robotek/Constants.dart';
import 'package:robotek/colorResource.dart';
import 'package:robotek/otpVerfication.dart';
import 'package:robotek/services/networking.dart';


import 'models/response/resalerlogin_response.dart';

class EnterYourNumber extends StatefulWidget {
  const EnterYourNumber({Key? key}) : super(key: key);

  @override
  _EnterYourNumberState createState() => _EnterYourNumberState();
}

class _EnterYourNumberState extends State<EnterYourNumber> {
   TextEditingController _phonenumberController = TextEditingController();
   bool isVisible = false;
   NetworkHelper networkHelper = NetworkHelper("http://robotek.frantic.in",);
   void ResalerLoginApi() async {
     ResalerLoginResponse? res = await networkHelper.ResalerLoginApi(
       phone: _phonenumberController.text,

     );
     if(res!.error_code==1) {
       Fluttertoast.showToast(
           msg: "Logged In Successfully",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.green,
           textColor: Colors.white,
           fontSize: 16.0);
       //navigate here
       Navigator.push(
           context, MaterialPageRoute(builder: (BuildContext context) =>otpVerification()));
       print(res!.response_string);
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
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
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
      body:SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-120,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                height: 200,

                child: Image.asset('assets/sign-page-abstract-concept-illustration_335657-2242.jpg'), ),


              Container(
                width: 320,
                child: Column(
                  children: const [
                    Text(
                      'Enter your phone number',textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        color: colorResource.primaryColor2
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                    ),
                    Text(
                      'We will send a code (via SMS text message) to your phone number',textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                    ),

                  ],
                ),
              ),

              Container(

                  height: 55,

                  width: 300,

                  decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      border: Border.all(color: Colors.black12, width: 1.0)

                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CountryCodePicker(
                        onChanged: print,
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IN',
                        favorite: ['+91','IN'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),


                      Expanded(child: TextField(
                        controller: _phonenumberController,
                        keyboardType: TextInputType.number,


                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                        ),
                        onChanged: (value) {

                          var number = value.toString();
                        },
                      ),),

                      Container(
                        key: Key("tickMark"),
                        margin: EdgeInsets.all(10),
                        height: 24,
                        width: 24,
                        child: Icon(Icons.check, color: Colors.white,),

                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(22),
                        ),
                      )


                    ],
                  )

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
                    child: Text('Send OTP',style: TextStyle(
                        color: Colors.white,
                        fontSize: 19
                    ),),
                  ),
                ),


                onTap: (){
                  ResalerLoginApi();

                },
              ),





            ],
          ),
        ),
      ),
    );
  }

  void initState() {

    // TODO: implement initState
    super.initState();

    Constants.dealer = true;

  }
}
