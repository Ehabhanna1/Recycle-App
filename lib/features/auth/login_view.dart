import 'package:flutter/material.dart';
import 'package:recycle_app/core/services/auth_firebase_service.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset("assets/images/login.png",
          height: 300,
          width:MediaQuery.of(context).size.width,
          fit: BoxFit.cover,),
          SizedBox(height: 20,),
          Image.asset("assets/images/recycle1.png",height: 120,width: 120,fit: BoxFit.cover,),
          SizedBox(height: 20,),
          Text("Reduce.Ruse.Recycle.",style: AppText.headLineTextStyle(27),),
          
          Text("Repeat !",style: AppText.greenTextStyle(33),),
          SizedBox(height: 40,),
          Text("Every item you recycle\n makes a difference!",textAlign: TextAlign.center,style: AppText.normalTextStyle(20),),
          Text("Get started!",style: AppText.greenTextStyle(24),),
           SizedBox(height: 50,),
           SizedBox(
             height: 85,
             width: MediaQuery.of(context).size.width/1.15,
             child: ElevatedButton(
              
               style: ElevatedButton.styleFrom(
                elevation: 5,
                 backgroundColor: Colors.green,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20),
                 ),
               ),
               onPressed: (){
                AuthFirebaseService().signInWithGoogle(context);
               },
               child: Row(
                 children: [
                   Container(
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                       color: Colors.white,  
                       borderRadius: BorderRadius.circular(60),
                     ),
                     child: Image.asset("assets/images/google.png",height: 50,width: 50,fit: BoxFit.cover,)),
                     SizedBox(width: 15,),
                   Text("Sign in with Google",style: AppText.whiteTextStyle(23),),
                 ],
               ),
             ),
           ),
      
          
          
      
        ], 
      ),
    );
  } 
}