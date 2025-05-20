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
        .collection("users")
        .doc(uid)
        .collection("Items")
        .doc(itemId)
        .set(userInfoData);
  }

  Future addAdminItem(Map<String, dynamic> userInfoData, String uid) async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .doc(uid)
        .set(userInfoData);
  }

  Future<Stream<QuerySnapshot>> getAdminApproval() async {
    return FirebaseFirestore.instance
        .collection("Requests")
        .where("Status", isEqualTo: "Pending")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getUserTransactions(String uid) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Redeem")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getAdminRedeemApproval() async {
    return FirebaseFirestore.instance
        .collection("Redeem")
        .where("Status", isEqualTo: "Pending")
        .snapshots();
  }

  Future updateAdminRequests(String uid) async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .doc(uid)
        .update({"Status": "Approved"});
  }

  Future updateAdminRedeemRequests(String uid) async {
    return await FirebaseFirestore.instance
        .collection("Redeem")
        .doc(uid)
        .update({"Status": "Approved"});
  }
   Future updateUserRequests(String uid, String itemId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Items")
        .doc(itemId)
        .update({"Status": "Approved"});
  }

  Future updateUserRedeemRequests(String uid, String itemId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Redeem")
        .doc(itemId)
        .update({"Status": "Approved"});
  }

  Future updateUserPoints(String uid, String points) async {
    return await FirebaseFirestore.instance.collection("users").doc(uid).update(
      {"Points": points},
    );
  }

  Future addUserRedeemPoints(
    Map<String, dynamic> userInfoData,
    String uid,
    String redeemId,
  ) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("Redeem")
        .doc(redeemId)
        .set(userInfoData);
  }

  Future addAdminRedeemRequest(
    Map<String, dynamic> userInfoData,

    String redeemId,
  ) async {
    return await FirebaseFirestore.instance
        .collection("Redeem")
        .doc(redeemId)
        .set(userInfoData);
  }
}
