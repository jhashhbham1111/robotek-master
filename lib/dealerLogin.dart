import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:robotek/Constants.dart';
import 'package:robotek/colorResource.dart';
import 'package:robotek/dealerRegistration.dart';
import 'package:robotek/models/response/login_response.dart';
import 'package:robotek/services/networking.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/data_model.dart';

class DealerLogin extends StatefulWidget {
  const DealerLogin({Key? key}) : super(key: key);

  @override
  _DealerLoginState createState() => _DealerLoginState();
}


class _DealerLoginState extends State<DealerLogin> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passworrdController = TextEditingController();
  bool isVisible = false;

  NetworkHelper networkHelper = NetworkHelper("http://robotek.frantic.in",);
  void login() async {
   LoginResponse? res = await networkHelper.login(
     password: _passworrdController.text,
     phone: _phoneController.text,
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
     Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (BuildContext context) =>DealerRegistration()));
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
  void initState() {

    // TODO: implement initState
    super.initState();

    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter',) ?? 0;
    });
    Constants.dealer = false;

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black,)
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset('assets/sign-page-abstract-concept-illustration_335657-3875.jpg'), ),
              const Padding(
                padding: const EdgeInsets.only(top: 80),
              ),
              Form(
                  key: _formKey,
                child: Container(
                    height: 55,
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                    decoration: const InputDecoration(
                    labelText: "Enter phone number",
                    enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
        ),
                          onChanged: (value) {
                            var number = value.toString();
                          },
                        ),),
                      ],
                    )

                ),
              ),


              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),

              Container(

                  height: 55,

                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: TextField(
                        controller: _passworrdController,
                        decoration: const InputDecoration(
                          labelText: "Enter Password",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                        ),
                        onChanged: (value) {

                          var number = value.toString();
                        },
                      ),),




                    ],
                  )

              ),


              const Padding(
                padding: const EdgeInsets.only(top: 60),
              ),

              const SizedBox(
                height: 40,
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
                    child: Text('Login',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  ),
                ),


                onTap: (){

                  login();
                },
              ),   

              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Text(
                      "Don't have a account? ", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                  ),

                  InkWell(
                    onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (Context)=>const DealerRegistration()));
                    },
                    child: const Text(
                      "Sign Up", style: TextStyle(
                        color: colorResource.primaryColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
