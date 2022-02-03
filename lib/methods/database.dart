// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseMethods {
  final auth = FirebaseAuth.instance;
  final collectionRef = FirebaseFirestore.instance.collection('users');

  Future addUserToDB(String userId, Map<String, dynamic> userInfoMap) {
    return collectionRef.doc(userId).set(userInfoMap);
  }

  Future<Object?> queryDataFromDB(String fieldName) async {
    final uid = auth.currentUser!.uid;
    final QuerySnapshot snapshot =
        await collectionRef.where('uid', isEqualTo: uid).get();
    for (var element in snapshot.docs) {
      return element.get(fieldName);
    }
  }
}
