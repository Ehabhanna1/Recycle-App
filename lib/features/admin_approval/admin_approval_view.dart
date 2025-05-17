import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class AdminApprovalView extends StatelessWidget {
  const AdminApprovalView({super.key});

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
                  SizedBox(width: MediaQuery.of(context).size.width /6.5),
                  Text("Admin Approval", style: AppText.headLineTextStyle(24)),
                ],
              ),
            ),


            SizedBox(height: 20),
            Expanded(child: Container(
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
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 20, right: 20),
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
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person,size: 25,color: Colors.green,),
                                  SizedBox(width: 5),
                                  Text("Ehab",style: AppText.normalTextStyle(20),),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
            )),
            
          ],
        ),
      ),
    );
  }
}