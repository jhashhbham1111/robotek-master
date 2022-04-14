import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:robotek/colorResource.dart';

import 'customDialogBox.dart';

class CartResaler extends StatefulWidget {
  const CartResaler({Key? key}) : super(key: key);

  @override
  _CartResalerState createState() => _CartResalerState();
}

class _CartResalerState extends State<CartResaler> {
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


          title: Text("Review items", style: TextStyle(
            color: colorResource.primaryColor2,
            fontSize: 20,
          ),),
          centerTitle: true,
        ),
      ),



      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(

            children: [

              Padding(padding: EdgeInsets.only(top: 40)),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){

                    },
                    child:  Container(
                        margin: EdgeInsets.only(bottom: 20, left: 40, right: 40),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 60,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              // changes position of shadow
                            ),]
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Expanded(
                              child: Row(
                                children: [



                                  Expanded(
                                    child: Text(
                                      " "+ "Bluetooth Speaker",style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,

                                        decorationColor: colorResource.primaryColor

                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            ),





                            Container(
                              height: 40,
                              width: 40,

                              child: Center(child: Text("15", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),)),

                              decoration: BoxDecoration(
                                  color: colorResource.primaryColor2,
                                  borderRadius: BorderRadius.circular(40)

                              ),
                            ),


                          ],
                        )




                    ),
                  );



                },),
            ],


          ),
        ),
      ),








      floatingActionButton:  Container(
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){

            //    Navigator.push(context, MaterialPageRoute(builder: (Context)=>CartResaler()));


              },
              child: InkWell(
                onTap: (){
        showDialog(context: context,
          builder: (BuildContext context){
            return CustomDialogBox(
              title: "Rules",
              descriptions: "1. Rewards will be given after 1 day of competition ends."
                  "\n\n\n\n\n",
              text: "Yes",
            );});
                },
                child: Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    color: colorResource.primaryColor2,

                    borderRadius: BorderRadius.circular(10),



                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text("    ", style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),),

                      Text("Share", style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,

                      ),),

                      Container(
                        width: 45,
                          height: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Image.asset("assets/share (2).png", color: Colors.grey,)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,





    );
  }
}
