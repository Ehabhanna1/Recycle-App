import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/services/data_base_sevice.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class AdminApprovalView extends StatefulWidget {
  const AdminApprovalView({super.key});

  @override
  State<AdminApprovalView> createState() => _AdminApprovalViewState();
}

class _AdminApprovalViewState extends State<AdminApprovalView> {
  Stream? appApprovalStream;

  getOnTheLoading() async {
    appApprovalStream = await DataBaseService().getAdminApproval();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoading();
    super.initState();
  }

  Widget allApproval() {
    return StreamBuilder(
      stream: appApprovalStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20),

                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,

                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black45,
                                width: 2,
                              ),
                            ),
                            child: Image.asset(
                              "assets/images/coca.png",
                              height: 120,
                              width: 120,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 28,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    documentSnapshot["Name"],
                                    style: AppText.normalTextStyle(20),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 28,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      documentSnapshot["Address"],
                                      style: AppText.normalTextStyle(20),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.inventory,
                                    size: 28,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 5),
                                  Text(documentSnapshot["Quantity"], style: AppText.normalTextStyle(22)),
                                ],
                              ),
                              SizedBox(height: 7),
                              GestureDetector(
                                onTap: () async{
                                  await DataBaseService().updateAdminRequests(documentSnapshot.id);
                                  await DataBaseService().updateUserRequests(documentSnapshot["UserId"],documentSnapshot.id);
                                }, 
                                child: Container(
                                  width: 200,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Approve",
                                      style: AppText.whiteTextStyle(20),
                                    ),
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
              },
            )
            : Center(child: Text("No Data"));
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
                  SizedBox(width: MediaQuery.of(context).size.width / 6.5),
                  Text("Admin Approval", style: AppText.headLineTextStyle(24)),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: allApproval()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
