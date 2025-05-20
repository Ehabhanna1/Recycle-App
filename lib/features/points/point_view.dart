import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';
import 'package:recycle_app/core/services/data_base_sevice.dart';
import 'package:recycle_app/core/services/shared_prefs_helper.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';
import 'package:recycle_app/core/widgets/custom_buttom.dart';

class PointView extends StatefulWidget {
  const PointView({super.key});

  @override
  State<PointView> createState() => _PointViewState();
}

class _PointViewState extends State<PointView> {
  String? id,myPoints,name;

  getTheSharedPrefs()async{
    id = await SharedPrefsHelper().getUserId();
    name = await SharedPrefsHelper().getUserName();
    setState(() {});
  }

  onTheLoading()async{
    await getTheSharedPrefs();
   myPoints = await getUserPoints(id!);
   setState(() {});
  }

  @override
  void initState() {
    
    super.initState();
    onTheLoading();
  }

  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _upiController = TextEditingController();

  Future<String> getUserPoints(String docId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection("users").doc(docId).get();

      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        String points = data["Points"];

        return points.toString();
      } else {
        log("No such document");
        return "No Data";
      }
    } catch (e) {
      log("Error getting document: $e");
      return "No Error";
    }
  }

  @override
  void dispose() {
    _pointsController.dispose();
    _upiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myPoints==null? Center(
        child: CupertinoActivityIndicator(
          animating: true,color: Colors.green,radius: 40,),):
           Container(
        margin: EdgeInsets.only(top: 47),
        child: Column(
          children: [
            Center(child: Text("Points", style: AppText.headLineTextStyle(25))),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 233, 249),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      child: Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Image.asset(
                                "assets/images/coin.png",
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 30),
                              Column(
                                children: [
                                  Text(
                                    "Points Earned",
                                    style: AppText.normalTextStyle(20),
                                  ),
                                  Text(
                                    myPoints.toString(),
                                    style: AppText.greenTextStyle(25),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CustomButtom(
                        title: "Redeem Points",
                        onPressed: () {
                          openBox();
                        },
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Text("Last Transactions", style: AppText.normalTextStyle(22.0)),
                            SizedBox(height: 20),
                            Container(
                              height: MediaQuery.of(context).size.height/2.3,
                               margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                              decoration: BoxDecoration(
                              // color: Color.fromARGB(255, 233, 233, 249),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 233, 233, 249),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                         padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text("20\nMay",textAlign: TextAlign.center,style: AppText.whiteTextStyle(22),),

                                        ),
                                        SizedBox(width: 20),
                                        Column(
                                          children: [
                                            Text("Redeem Points", style: AppText.normalTextStyle(21)),
                                            Text("100", style: AppText.greenTextStyle(25)),
                                          ],
                                        ),
                                        SizedBox(width: 30,),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(48, 241, 77, 66),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text("Pending", style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold)),
                                        ),
                                        
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )
                            
                            
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future openBox() => showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.cancel),
                      ),
                      SizedBox(width: 30),
                      Text("Redeem Points", style: AppText.greenTextStyle(20)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Add Points", style: AppText.normalTextStyle(18)),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _pointsController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Points",
                        hintStyle: AppText.normalTextStyle(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Add UPI ID", style: AppText.normalTextStyle(18)),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _upiController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter UPI ID",
                        hintStyle: AppText.normalTextStyle(18),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async{
                      if (_pointsController.text.isNotEmpty &&
                      _upiController.text.isNotEmpty &&
                       int.parse(myPoints!)>int.parse(_pointsController.text) ) {
                            int updatePoints = int.parse(myPoints!)-int.parse(_pointsController.text);
                            DateTime now = DateTime.now();
                            String formattedDate = DateFormat("yyyy-MM-dd").format(now);
                            await DataBaseService().updateUserPoints(id!, updatePoints.toString());

                            Map<String,dynamic> userRedeemMap = {
                              "Name": name,
                              "Points": _pointsController.text,
                              "UPI ID": _upiController.text,
                              "Status": "Pending",
                              "Date": formattedDate,
                            };
                            String redeemId = randomAlphaNumeric(10);

                            await DataBaseService().addUserRedeemPoints(userRedeemMap, id!, redeemId); 
                            await DataBaseService().addAdminRedeemRequest(userRedeemMap, redeemId);

                            myPoints = await getUserPoints(id!);
                            setState(() {
                           
                            });

                            Navigator.pop(context);
                            
                          }
                    },
                    child: Center(
                      child: Container(
                        width: 100,

                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text("Add", style: AppText.whiteTextStyle(20)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  );
}
