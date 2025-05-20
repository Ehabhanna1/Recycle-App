import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/services/data_base_sevice.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class AdminRedeemApproved extends StatefulWidget {
  const AdminRedeemApproved({super.key});

  @override
  State<AdminRedeemApproved> createState() => _AdminRedeemApprovedState();
}

class _AdminRedeemApprovedState extends State<AdminRedeemApproved> {

Stream? redeemStream;
getTheLoading() async {
redeemStream = await DataBaseService().getAdminRedeemApproval();
  setState(() {});
}


@override
  void initState() {
  getTheLoading();
  super.initState();
}





   Widget allApproval() {
    return StreamBuilder(
      stream: redeemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                return  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20,right: 20,bottom: 17),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                     child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(documentSnapshot["Date"],textAlign: TextAlign.center, style: AppText.whiteTextStyle(20)),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person,color: Colors.green,size: 30,),
                                SizedBox(width: 10,),
                                Text(documentSnapshot["Name"], style: AppText.normalTextStyle(18)),
                              ],
                            ),
                             Row(
                              children: [
                                Icon(Icons.point_of_sale_rounded,color: Colors.green,size: 30,),
                                SizedBox(width: 10,),
                                Text("Points Redeem : ${documentSnapshot["Points"]}", style: AppText.normalTextStyle(18)),
                              ],
                            ),
                             Row(
                              children: [
                                Icon(Icons.monetization_on_rounded,color: Colors.green,size: 30,),
                                SizedBox(width: 10,),
                                Text("UPI ID : ${documentSnapshot["UPI ID"]}", style: AppText.normalTextStyle(18)),
                              ],
                            ),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: () async{
                                await DataBaseService().updateAdminRedeemRequests(documentSnapshot.id);
                                await DataBaseService().updateUserRedeemRequests(documentSnapshot["UserId"], documentSnapshot.id);
                              
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 5),
                                width: 150,
                                height: 40,
                              
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text("Approved", style: AppText.whiteTextStyle(20))),
                              ),
                            )
                          ],
                        ),

                        
                      ],
                     ),
                   );
              },
            )
            : Center(child: Text("No Data",style: AppText.normalTextStyle(30),));
      },
    );
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 6),
                  Text("Redeem Approval", style: AppText.headLineTextStyle(24)),
                ],
              ),
            ),

            SizedBox(height: 20),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 233, 249),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: allApproval()),
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}