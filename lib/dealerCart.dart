import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:robotek/cartResaler.dart';
import 'package:robotek/colorResource.dart';

class DealerCart extends StatefulWidget {
  const DealerCart({Key? key}) : super(key: key);

  @override
  _DealerCartState createState() => _DealerCartState();
}

class _DealerCartState extends State<DealerCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },


              icon: Icon(Icons.arrow_back, color: Colors.black,)
          ),


          title: Text("My cart", style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),),
          centerTitle: false,
        ),



      ),



      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(


            children: [

              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                width: 350,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){

                      },
                      child:   Container(
                        margin: EdgeInsets.only(bottom: 20, left: 0, right: 0),
                        padding: EdgeInsets.only(left: 20, right: 20),

                        height: 60,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 3,
                              // changes position of shadow
                            ),]
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Image.network("https://www.freepnglogos.com/uploads/airpods-png/airpods-apply-airpod-skins-mightyskins-3.png", height: 50, fit: BoxFit.fitHeight,),
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text( "AirPods Pro " , style: TextStyle(
                                        fontSize: 17, color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                    ),
                                    Text( "20 PCS/Box " , style: TextStyle(
                                        fontSize: 12, color: Colors.black54
                                    ),),
                                  ],
                                ),
                              ],
                            ),


                            Row(
                              children: [
                                Text("Rs. 9,000", style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18
                                ),),
                                Padding(
                                  padding: EdgeInsets.all(3),
                                ),


                              ],
                            )
                          ],
                        ),




                      ));







                  },),
              ),




              Container(
width: 350,

                margin: EdgeInsets.only(bottom: 40, left: 0, right: 0),



                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 3,
                      // changes position of shadow
                    ),]
                ),

                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(

                    children: [
                      Padding(padding: EdgeInsets.only(top: 13)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal", style: TextStyle(
                            fontSize: 16
                          ),),
                          Text("10000", style: TextStyle(
                              fontSize: 16
                          ),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 13)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Discount (10%)", style: TextStyle(
                              fontSize: 16
                          ),),
                          Text("1000", style: TextStyle(
                              fontSize: 16
                          ),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 13)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Shipping Charges", style: TextStyle(
                              fontSize: 16
                          ),),
                          Text("30", style: TextStyle(
                              fontSize: 16
                          ),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 18)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("total", style: TextStyle(
                              fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colorResource.primaryColor2
                          ),),
                          Text("9,930", style: TextStyle(
                              fontSize: 16
                          ),),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 13)),

                      Container(
                        width: 320,
                        height: 40,

                        child: Center(
                          child: Text("Place Order", style: TextStyle(
                              fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        ),

                        decoration: BoxDecoration(
                            color: colorResource.primaryColor2,
                            borderRadius: BorderRadius.circular(04),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 3,
                              // changes position of shadow
                            ),]
                        ),

                      ),
                      Padding(padding: EdgeInsets.only(top: 13)),
                    ],
                  ),
                ),


              ),

            ],


          ),
        ),
      ),











    );
  }
}
