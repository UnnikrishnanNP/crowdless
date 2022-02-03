import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseMethods {
  final auth = FirebaseAuth.instance;

  Future addUserToDB(String userId, Map<String, dynamic> userInfoMap) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(userInfoMap);
  }

  Future<DocumentSnapshot> getUserFromDB(String userId) {
    return FirebaseFirestore.instance.collection('users').doc(userId).get();
  }
}
