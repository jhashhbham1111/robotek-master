
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robotek/colorResource.dart';

import 'Constants.dart';


class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;


  const CustomDialogBox({required this.title, required this.descriptions, required this.text});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  bool value = false;
  bool value2 = false;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }
  contentBox(context){
    return Container(
      width: 300,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: Constants.padding,top: 20
                + Constants.padding, right: Constants.padding,bottom: Constants.padding
            ),
            margin: EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: [
                  BoxShadow(color: Colors.black,offset: Offset(0,10),
                      blurRadius: 10
                  ),
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                
                Image.asset("assets/ConvertJPGToPDF.png", height: 100,),
                SizedBox(height: 15,),
                Text("Title",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                SizedBox(height: 15,),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(

                      width: 280,
                      height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        // changes position of shadow
                      ),]
                    ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Center(
                          child: TextField(

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {

                              var number = value.toString();
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ),
                SizedBox(height: 25,),
                Text("Format",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                SizedBox(height: 0,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [

               Row(
                 children: [
                   Checkbox(
                    value: this.value,
                      onChanged: ( val) {
                        setState(() {
                        this.value = val!;
                         });
                      },
                   ),
                   Text("PDF"),
                 ],
               ),
               Row(
                 children: [
                   Checkbox(
                     value: this.value2,
                     onChanged: ( val) {
                       setState(() {
                         this.value2 = val!;
                       });
                     },
                   ),
                   Text("Image"),
                 ],
               ),

             ],

           ),

                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(

                      child: Text("Cancel", style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 20
                      ),),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 15,),
                    Text("Done", style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 20
                    ),)
                  ],
                )





              ],


            ),
          ),

        ],
      ),
    );
  }
}