import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recycle_app/core/services/data_base_sevice.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';

class AuthFirebaseService {



  signInWithGoogle(BuildContext context)async{
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    final GoogleSignIn googleSignIn = GoogleSignIn();

     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      
      UserCredential result = await firebaseAuth.signInWithCredential(credential);
      User? userDetails = result.user;
      
      if(result != null){
        Map<String,dynamic> userInfoData = {
          "email": userDetails!.email,
          "name": userDetails.displayName,
          "image": userDetails.photoURL,
          "uid": userDetails.uid,
        };


        await DataBaseService().addUserInfo(userInfoData, userDetails.uid);

        Navigator.pushReplacementNamed(context, AppRoutes.homeView);
      }


      
  
    
    
  }
}