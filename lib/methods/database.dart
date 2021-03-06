// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataBaseMethods {
  final auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('users');
  final customerDataRef =
      FirebaseFirestore.instance.collection('customer_data');
  final merchantDataRef =
      FirebaseFirestore.instance.collection('merchant_data');

  // methods for user collection
  Future addUserToDB(String userId, Map<String, dynamic> userInfoMap) {
    return userRef.doc(userId).set(userInfoMap);
  }

  // get a specific field in document
  Future<Object?> queryDataFromDB(String fieldName) async {
    final uid = auth.currentUser!.uid;
    final QuerySnapshot snapshot =
        await userRef.where('uid', isEqualTo: uid).get();
    for (var element in snapshot.docs) {
      return element.get(fieldName);
    }
  }

  // methods for scanned_data collection
  // merchant visitors list
  Future addMerchantScanData(String uid, String date, String time) async {
    // cutterntUid is the current uid of customer
    final currentUid = auth.currentUser!.uid;
    // the data of currentUid is accessed in order to get uid field
    final customer = await userRef.doc(currentUid).get();
    // this uid is the uid that we get after scanning qr code
    final merchant = await userRef.doc(uid).get();
    Map<String, dynamic> scannedData = {
      'date': date,
      'time': time,
      'data': customer.data()!
    };
    merchantDataRef.doc(merchant['uid']).collection('visitor').add(scannedData);
  }

  // customer visited list
  Future addCustomerScanData(String uid, String date, String time) async {
    // cutterntUid is the current uid of customer
    final currentUid = auth.currentUser!.uid;
    // the data of currentUid is accessed in order to get uid field
    final customer = await userRef.doc(currentUid).get();
    // this uid is the uid that we get after scanning qr code
    final merchant = await userRef.doc(uid).get();
    Map<String, dynamic> scannedData = {
      'date': date,
      'time': time,
      'data': merchant.data()!
    };

    customerDataRef.doc(customer['uid']).collection('visited').add(scannedData);
  }

  // get data of customers
  Future<List<DocumentSnapshot<Object?>>> fetchCustomerData(
      String userId) async {
    QuerySnapshot querySnapshot =
        await customerDataRef.doc(userId).collection('visited').get();
    List<DocumentSnapshot> docCount = querySnapshot.docs;
    return docCount;
  }

  // get data of merchants
  Future<List<DocumentSnapshot<Object?>>> fetchMerchantData(
      String userId) async {
    QuerySnapshot querySnapshot =
        await merchantDataRef.doc(userId).collection('visitor').get();
    List<DocumentSnapshot> docCount = querySnapshot.docs;
    return docCount;
  }
}
