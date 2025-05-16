import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{


Future addUserInfo (Map<String,dynamic> userInfoData, String uid)async{
  return await FirebaseFirestore.instance.collection("users").doc(uid).set(userInfoData);


}


}
