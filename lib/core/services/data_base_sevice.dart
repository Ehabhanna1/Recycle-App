import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  Future addUserInfo(Map<String, dynamic> userInfoData, String uid) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(userInfoData);
  }

  Future addUserUploadItem(
    Map<String, dynamic> userInfoData,
    String uid,
    String itemId,
  ) async {
    return await FirebaseFirestore.instance
        .collection("users").doc(uid) .collection("Items")
        .doc(itemId).set(userInfoData);
  }

  Future addAdminItem(
    Map<String, dynamic> userInfoData,
    String uid,
    
  ) async {
    return await FirebaseFirestore.instance
        .collection("Requests").doc(uid).set(userInfoData);
  }


  Future <Stream <QuerySnapshot>> getAdminApproval() async {
    return await FirebaseFirestore.instance.collection("Requests").where("Status", isEqualTo: "Pending").snapshots();
  }

    Future updateAdminRequests(
    
    String uid,
   
  ) async { 
    return await FirebaseFirestore.instance
        .collection("Requests").doc(uid).update({"Status": "Approved"});
  }


      Future updateUserRequests(
   
    String uid,
    String itemId,
  ) async { 
    return await FirebaseFirestore.instance
        .collection("users").doc(uid).collection("Items").doc(itemId).update({"Status": "Approved"});
  }



}
