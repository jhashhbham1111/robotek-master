import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:robotek/Constants.dart';
import 'package:robotek/cartResaler.dart';
import 'package:robotek/colorResource.dart';
import 'package:robotek/customerSupport.dart';
import 'package:robotek/dealerCart.dart';
import 'package:robotek/myOrdersDealer.dart';
import 'package:robotek/terms&Conditions.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double height =40;
  double width =160;
  Color colorContainer = colorResource.primaryColor2;

  bool categoryVis = true;






  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(

          padding: EdgeInsets.only(top: 40, left: 20, right: 20),

          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/category.png", height: 25,),
                  Image.asset("assets/RobotekLogo.png", height: 30,),

                  Image.asset("assets/search (1).png", height: 25,)
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 25)),

              Container(

                  height: 160,
                  child: Image.asset("assets/homeMainHeader.png", height: 40,)),
              Padding(padding: EdgeInsets.only(top: 25)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text("CATEGORIES", style: TextStyle(
                   color: colorResource.primaryColorLight,
                   fontWeight: FontWeight.bold,
                   fontSize: 14
                 ),),

                  Flexible(
                    child: Text("DOWLOAD CATALOGUE", style: TextStyle(
                        color: colorResource.primaryColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 13
                    ),),
                  )

                ],
              ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: (){

                    },
                    child:  ExpandablePanel(

                        theme: ExpandableThemeData(
                            hasIcon: false,
                          headerAlignment: ExpandablePanelHeaderAlignment.bottom

                        ),
                        header: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.only(left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            height: 60,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, 0), // changes position of shadow
                                ),]
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Expanded(
                                  child: Row(
                                    children: [



                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 15,
                                                  height: 18,
                                                  child: Image.asset("assets/fast-forward.png", color: Colors.yellow,),
                                                ),
                                                Text(
                                                  " "+ "Bluetooth Speaker",style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    overflow: TextOverflow.ellipsis,

                                                    decorationColor: colorResource.primaryColor

                                                ),
                                                ),
                                              ],
                                            ),
                                            Row(

                                              children: [


                                                SizedBox(
                                                  width: 15,
                                                  height: 18,
                                                 ),
                                                Text(
                                                  " "+ "57 Products",style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.normal,
                                                    overflow: TextOverflow.ellipsis,

                                                    decorationColor: Colors.grey

                                                ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),





                                SizedBox(
                                  width: 30,
                                  height: 25,
                                  child: Image.asset("assets/download (1).png"),
                                )

                              ],
                            )




                        ),






                        collapsed: Column(),





                        expanded: Column(
                          children: [
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 6,
                                itemBuilder: (BuildContext context, int index){

                                  return  Container(

                                      padding: EdgeInsets.all(5),

                                  margin: EdgeInsets.fromLTRB(00, 00, 00, 10),
                                  decoration: BoxDecoration(


                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          SizedBox(

                                              width: 70,

                                              child: Image.network("https://www.freepnglogos.com/uploads/airpods-png/airpods-apply-airpod-skins-mightyskins-3.png", height: 60, fit: BoxFit.fitHeight, alignment: Alignment.bottomLeft,)),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text( "AirPods Pro " , style: TextStyle(
                                              fontSize: 15, color: Colors.black,
                                                fontWeight: FontWeight.bold
                                              ),),
                                              Padding(
                                                padding: EdgeInsets.only(top: 5),
                                              ),
                                              Text( "20 PCS/Box " , style: TextStyle(
                                                  fontSize: 13, color: Colors.black54
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),


                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Icon(Icons.menu_sharp, color: colorResource.primaryColor2,),

                                          Row(
                                            children: [
                                              Text("PCS", style: TextStyle(
                                                fontSize: 10
                                              ),),
                                              Padding(
                                                padding: EdgeInsets.all(3),
                                              ),
                                              Container(
                                                width: 70,
                                                height: 30,

                                                child:  Container(

                                                  margin: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black26,
                                                    borderRadius: BorderRadius.circular(20),
                                                    border: Border.all(width: 2, color: Colors.white)
                                                  ),


                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10.0,),
                                                    child: Center(
                                                      child: TextField(

keyboardType: TextInputType.number,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white
                                                        ),
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

                                                decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                  borderRadius: BorderRadius.circular(20),

                                                ),
                                              ),

                                            ],
                                          )

                                        ],
                                      )
                                    ],
                                  ),);

                                },),
                            Padding(padding: EdgeInsets.only(bottom: 20))
                          ],
                        ),
                        ),
                  );



                },),
              
              
              
              Padding(padding: EdgeInsets.only(bottom: 120))






            ],
          ),
        ),
      ),

      floatingActionButton: Container(

        width: 370,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(

              onTap: () async {
                setState(()  {
                  width = 160;
                  height = 180;
                  colorContainer = Colors.white;

                });
                await Future.delayed(Duration(milliseconds: 400));
                setState(() {
                  categoryVis =false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                width: width,
                height: height,

                child: categoryVis? new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.menu, size: 20,),
                  Text("Browse Categories", style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),


                ],
              ): Container(
                  width: width,
                height: height,
                padding: EdgeInsets.only(left: 10, top: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Arrival", style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: width-20,
                        height: 1,
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                      ),
                      Text("Wireless Headphones",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: width-20,
                        height: 1,
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                      ),
                      Text("Bluetooth Speakers",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: width-20,
                        height: 1,
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                      ),
                      Text("Airpods",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: width-20,
                        height: 1,
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                      ),
                      Text("Mobile Phones",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: width-20,
                        height: 1,
                        color: Colors.black,
                        margin: EdgeInsets.only(top: 4, bottom: 4),
                      ),

                      InkWell(
                        onTap: (){
                          setState(() {
                            categoryVis= true;

                             height =40;
                         width =160;
                          colorContainer = colorResource.primaryColor2;

                          });

                        },
                        child: Container(
                          width: width-20,
                          height: 30,
                          child: Center(
                            child: Text("Close", style: TextStyle(
                              color: Colors.white
                            ),),
                          ),
                          margin: EdgeInsets.only(top: 4, bottom: 4),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)
                          ),
                        ),
                      ),
                    ],
                  ),
              ),

              decoration: BoxDecoration(
                color: colorContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            InkWell(
              onTap: (){

           //  Navigator.push(context, MaterialPageRoute(builder: (Context)=>CartResaler()));

                toCart();

              },
              child: Container(
              width: 370,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,

                  borderRadius: BorderRadius.circular(10),



                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("0"+" items", style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),),

                    Text("Review List", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [

            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 00, 40),


              child:  Row(
                children: [
                 Image.asset('assets/businessMale.png', height: 50,),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Expanded(
                    child: Text("Hi, Yash Malhotra", style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              )
            ),
            ListTile(
              title: const Text('My Orders',  style: TextStyle(
                  fontSize: 18
              ),),

              leading: IconButton(
                onPressed: (){

                },
                icon: Icon(Icons.shopping_cart),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (Context)=>MyOrdersDealer()));
              },
            ),
            ListTile(
              title: const Text('About Us',style: TextStyle(
                  fontSize: 18
              ),),
              leading: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (Context) => TermsCondition()));
                },
                icon: Image.asset('assets/team.png'),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context, MaterialPageRoute(builder: (Context) => TermsCondition()));
              },
            ),
            ListTile(
              title: const Text('Contact Us',style: TextStyle(
                  fontSize: 18
              ),),
              leading: IconButton(
                onPressed: (){

                },
                icon: Image.asset('assets/support.png'),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context, MaterialPageRoute(builder: (Context)=> CustomerSupport()));
              },
            ),
            ListTile(
              title: const Text('Terms & Conditions',style: TextStyle(
                  fontSize: 18
              ),),
              leading: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (Context) => TermsCondition()));
                },
                icon: Image.asset('assets/terms-and-conditions.png'),
              ),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context, MaterialPageRoute(builder: (Context) => TermsCondition()));
              },
            ),
            ListTile(
              title: const Text('Privacy Policy',style: TextStyle(
                  fontSize: 18
              ),),
              leading: IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (Context) => TermsCondition()));
                },
                icon: Image.asset('assets/privacy-policy (1).png'),
              ),

              onTap: () {
                // Update the state of the app.
                Navigator.push(context, MaterialPageRoute(builder: (Context) => TermsCondition()));
              },
            ),
            ListTile(
              title: const Text('FAQ',style: TextStyle(
                  fontSize: 18
              ),),
              leading: IconButton(
                onPressed: (){

                },
                icon: Image.asset('assets/faq.png'),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 40, 00, 40),


                child:   Image.asset('assets/RobotekLogo.png', height: 90,),
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );





  }


  void toCart(){
    if(Constants.dealer) {
      Navigator.push(
          context, MaterialPageRoute(builder: (Context) => CartResaler()));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (Context)=>DealerCart()));
    }
  }

}

