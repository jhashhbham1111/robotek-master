import 'package:flutter/material.dart';
import 'package:robotek/colorResource.dart';
import 'package:robotek/dealerLogin.dart';

import 'package:robotek/services/networking.dart';
import 'enterYourNumber.dart';
import 'models/response/dealer_registration.dart';

import 'package:fluttertoast/fluttertoast.dart';

class DealerRegistration extends StatefulWidget {
  const DealerRegistration({Key? key}) : super(key: key);

  @override
  _DealerRegistrationState createState() => _DealerRegistrationState();
}

class _DealerRegistrationState extends State<DealerRegistration> {

  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final emailRegex =
  RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  bool isVisible = false;
  NetworkHelper networkHelper = NetworkHelper("http://robotek.frantic.in",);

  void Register() async {
    String email = _emailController.text;
    String name = _nameController.text;
    String company_name = _companyNameController.text;
    String password = _passwordController.text;
    String location = _locationController.text;
    String pincode = _pincodeController.text;
    String phone = _phonenumberController.text;
    DealerRegistrationResponse? res = await networkHelper.Register(
      name: _nameController.text,
      company_name: _companyNameController.text,
      phone: _phonenumberController.text,
      email: _emailController.text,
      password: _passwordController.text,
      location: _locationController.text,
      pincode: _pincodeController.text,

    );
    if (res!.error_code == 1) {
      Fluttertoast.showToast(
          msg: "Profile Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      //navigate here
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => EnterYourNumber()));
    }else{
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

        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          leading:     InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>const DealerLogin()));
            },

            child:     IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black,)
            ),
          ),
          leadingWidth: 50,

          title:  const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("Dealer Registration",
              textAlign: TextAlign.left, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff3E3C3C),
              ),),
          ),
          centerTitle: false,


          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //
          //   children: [
          //
          //
          //
          //
          //
          //
          //
          //     InkWell(
          //         onTap: (){
          //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>Home()));
          //         },
          //
          //         child: ImageIcon( AssetImage("assets/cancel.png", ), color: Colors.black,size: 40,)),
          //   ],
          // ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-120,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Form(
                key: signUpForm,
                child: Container(
                  height: MediaQuery.of(context).size.height*(6/10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            height: MediaQuery.of(context).size.height*(2/10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(



                                    width: 180,


                                    child: TextFormField(

                                      controller:_nameController,

                                        autovalidateMode:AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        labelText: "Name",
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
                                    )

                                ),
                                Container(

                                    height: 55,

                                    width: 180,



                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Expanded(child: TextField(
                                          controller:_companyNameController,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            labelText: "Company Name",
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



                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: SizedBox(
                              height:100,
                              width: 100,

                              child: CircleAvatar(
                                  radius: 100,
                                  child: Image.asset("assets/businessMale.png") ),),
                          ),
                        ],
                      ),
                      Container(

                          height: 55,

                          width: 300,



                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Expanded(child: TextField(
                                controller: _phonenumberController,
                                keyboardType:TextInputType.number,

                                decoration: const InputDecoration(
                                  labelText: "Phone",
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



                      Container(

                          height: 55,

                          width: 300,



                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Expanded(child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,

                                decoration: const InputDecoration(
                                  labelText: "Email",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                  ),
                                ),
                              /*  validator: (val){
                                  if(val!.isEmpty){
                                    print("text ise");
                                    return '*Required';
                                  }
                                  else if (!emailRegex.hasMatch(val)){
                                    return 'please enter valid email';
                                  }
                                  return null;
                                },*/
                                onChanged: (value) {

                                  var number = value.toString();
                                },
                              ),),




                            ],
                          )

                      ),
                      Container(

                          height: 55,

                          width: 320,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: Expanded(child: TextFormField(
                                  controller: _locationController,
                                  keyboardType: TextInputType.text,

                                  decoration: const InputDecoration(
                                    labelText: "Location",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.cyan),
                                    ),
                                  ),
                                 /* validator: (val){
                                    if(val!.isEmpty){
                                      print("location");
                                      return '*Required';
                                    }
                                    return null;
                                  },*/
                                  onChanged: (value) {

                                    var number = value.toString();
                                  },
                                ),),
                              ),
                              Container(
                                child: const Icon(Icons.location_on_outlined,
                                  color: Colors.orange,
                                  size: 22,),
                              )




                            ],
                          )

                      ),





                      Container(

                          height: 55,

                          width: 300,



                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Expanded(
                                child: TextField(
                                  controller: _pincodeController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: "Pin Code",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.cyan),
                                    ),
                                  ),
                                 /* validator: (val){
                                    if(val!.isEmpty){
                                      print("pincode");
                                    }
                                    return null;
                                  }*/

                                  onChanged: (value) {

                                    var number = value.toString();
                                  },

                                ),
                              ),




                            ],
                          )

                      ),




                      Container(

                          height: 55,

                          width: 300,



                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Expanded(child: TextField(
                                controller: _passwordController,
                                obscureText: true,

                                decoration: const InputDecoration(
                                  labelText: "Password",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                  ),
                                ),
                               /* validator: (val){
                                  if(val!.isEmpty){
                                    print("text password");
                                    return '*Required';
                                  }
                                  return null;
                                },*/

                                onChanged: (value) {

                                  var number = value.toString();
                                },
                              ),),

                            ],
                          )

                      ),

                    ],
                  ),
                ),
              ),






              const Padding(
                padding: const EdgeInsets.only(top: 60),
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


                onTap: () {
                //   if(signUpForm.currentState!.validate()){
                //     showToast("please register ");
                //   }
                //   else {
                Register();
                    /*Navigator.push(context, MaterialPageRoute(builder: (Context)=>const DealerLogin()));*/
                  // }


                },
              ),

              const Padding(
                padding: EdgeInsets.only(top: 30),
              ),

            ],
          ),
        ),
      ),
    );

  }


 showToast(String message){
    return Fluttertoast.showToast(
      msg:message,
      toastLength:Toast.LENGTH_SHORT,
     gravity:ToastGravity.BOTTOM,
      backgroundColor:Colors.transparent,
      textColor:Colors.white,
      fontSize:16

    );
 }

}



