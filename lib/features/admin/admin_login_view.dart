import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class AdminLoginView extends StatefulWidget {
  const AdminLoginView({super.key});

  @override
  State<AdminLoginView> createState() => _AdminLoginViewState();
}

class _AdminLoginViewState extends State<AdminLoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
               Image.asset("assets/images/login.png",
            height: 300,
            width:MediaQuery.of(context).size.width,
            fit: BoxFit.cover,),
            SizedBox(height: 20,),
            
            Text("Admin Login",style: AppText.headLineTextStyle(27),),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(96, 76, 175, 79),
               borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}