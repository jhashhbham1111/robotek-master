import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:robotek/colorResource.dart';
import 'package:robotek/enterYourNumber.dart';
import 'package:robotek/home.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  _SignUpUserState createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(32.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          leading:     InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (Context)=>EnterYourNumber()));
            },


            child:     IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },


                icon: Icon(Icons.arrow_back, color: Colors.black,)
            ),
          ),
          leadingWidth: 50,

          title: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("Registration",
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

          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              SizedBox(
                height: 200,

                child: Image.asset('assets/istockphoto-1286081871-170667a.png'),  ),


              Padding(
                padding: EdgeInsets.only(top: 50),
              ),




              Container(

                  height: 45,

                  width: 300,

                  padding: EdgeInsets.only(left: 20),

                  decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      border: Border.all(color: Colors.black12, width: 1.0),
                    borderRadius: BorderRadius.circular(10)

                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [



                      Expanded(child: TextField(


                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                        ),
                        onChanged: (value) {

                          var number = value.toString();
                        },
                      ),),


                    ],
                  )

              ),






              Padding(
                padding: EdgeInsets.only(top: 20),
              ),

              Container(

                  height: 45,

                  width: 300,

                  padding: EdgeInsets.only(left: 20),

                  decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      border: Border.all(color: Colors.black12, width: 1.0),
                      borderRadius: BorderRadius.circular(10)

                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [



                      Expanded(child: TextField(


                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                        ),
                        onChanged: (value) {

                          var number = value.toString();
                        },
                      ),),


                    ],
                  )

              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Container(

                  height: 45,

                  width: 300,

                  padding: EdgeInsets.only(left: 20),

                  decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      border: Border.all(color: Colors.black12, width: 1.0),
                      borderRadius: BorderRadius.circular(10)

                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [



                      Expanded(child: TextField(


                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                        ),
                        onChanged: (value) {

                          var number = value.toString();
                        },
                      ),),


                    ],
                  )

              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Container(

                  height: 45,

                  width: 300,

                  padding: EdgeInsets.only(left: 20),

                  decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      border: Border.all(color: Colors.black12, width: 1.0),
                      borderRadius: BorderRadius.circular(10)

                  ),

                  child:  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme
                              .of(context)
                              .hintColor,
                        ),
                      ),
                      items: items
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },

                      buttonHeight: 55,
                      buttonWidth: 300,
                      itemHeight: 40,
                    ),
                  ),

              ),




              Padding(
                padding: EdgeInsets.only(top: 60),
              ),

              InkWell(
                child: Container(

                  height: 50,

                  width: 300,

                  decoration: BoxDecoration(
                      color: colorResource.primaryColorLight,
                      borderRadius: BorderRadius.circular(20)

                  ),
                  child: Center(
                    child: Text('Submit',style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  ),
                ),


                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (Context)=>Home()));
                },
              ),

              Padding(
                padding: EdgeInsets.only(top: 30),
              ),







            ],
          ),
        ),
      ),
    );
  }

  String? selectedValue;
  List<String> items = [
    'MALE',
    'FEMALE',
    'OTHERS'

  ];


}
