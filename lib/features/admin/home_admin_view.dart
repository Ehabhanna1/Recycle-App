import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';

class HomeAdminView extends StatefulWidget {
  const HomeAdminView({super.key});

  @override
  State<HomeAdminView> createState() => _HomeAdminViewState();
}

class _HomeAdminViewState extends State<HomeAdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Admin",style: AppText.headLineTextStyle(28),),
        centerTitle: true,
        leading: SizedBox.shrink(),
      ),
      body:  Container(
       
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
          SizedBox(height: 30,),


          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.adminApprovalView);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                   
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                   
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/approval.png",height: 100,width: 100,fit: BoxFit.cover,),
                           SizedBox(width: 35,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Admin",style: AppText.headLineTextStyle(25),),
                            Text("Approval",style: AppText.headLineTextStyle(25),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ),

            SizedBox(height: 30,),
      
      
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, AppRoutes.adminRedeemApprovedView);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                   
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                   
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/reedem.png",height: 100,width: 100,fit: BoxFit.cover,),
                           SizedBox(width: 35,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Redeem",style: AppText.headLineTextStyle(25),),
                            Text("Request",style: AppText.headLineTextStyle(25),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
      
         
            
          
          ],
        ),
      ),
    );
  }
}