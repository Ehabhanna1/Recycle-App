import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recycle_app/core/services/data_base_sevice.dart';
import 'package:recycle_app/core/services/shared_prefs_helper.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';

class AuthFirebaseService {



   signInWithGoogle(BuildContext context)async{

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
   UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);

   User? userDetail = result.user;

  Map<String,dynamic> userInfoData = {
    "uid": userDetail!.uid,
    "email": userDetail.email,
    "displayName": userDetail.displayName,
    "photoURL": userDetail.photoURL,
    "Points": "0",
  };

  await DataBaseService().addUserInfo(userInfoData, userDetail.uid);
  await SharedPrefsHelper().saveUserId(userDetail.uid);
  await SharedPrefsHelper().saveUserName(userDetail.displayName!);
  await SharedPrefsHelper().saveUserEmail(userDetail.email!);
  await SharedPrefsHelper().saveUserImage(userDetail.photoURL!);
  
  Navigator.pushNamed(context, AppRoutes.homeView);
 
   }
}