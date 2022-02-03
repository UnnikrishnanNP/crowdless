// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseMethods {
  final auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('users');
  final scannedDataRef = FirebaseFirestore.instance.collection('scanned_data');

  // methods for user collection
  Future addUserToDB(String userId, Map<String, dynamic> userInfoMap) {
    return userRef.doc(userId).set(userInfoMap);
  }

  Future getDataFromDB(String uid) async {
    return await userRef.doc(uid).get();
  }

  Future<Object?> queryDataFromDB(String fieldName) async {
    final uid = auth.currentUser!.uid;
    final QuerySnapshot snapshot =
        await userRef.where('uid', isEqualTo: uid).get();
    for (var element in snapshot.docs) {
      return element.get(fieldName);
    }
  }

  // methods for scanned_data collection
  Future<void> storeScannedData(Map<String, dynamic> data) {
    final uid = auth.currentUser!.uid;
    return scannedDataRef.doc(uid).set(data);
  }

  Future getScannedDataFromDB(String uid) async {
    return await scannedDataRef.doc(uid).get();
  }
}
