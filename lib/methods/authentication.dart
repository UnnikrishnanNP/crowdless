// ignore_for_file: unnecessary_null_comparison, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

import 'package:crowdless/methods/database.dart';

class Authentication {
  final auth = FirebaseAuth.instance;

  Future<User> getCurrentUser() async {
    return auth.currentUser!;
  }

  Future<void> signUp(String name, String email, String password,
      String phoneNumber, String userType) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final String uid = auth.currentUser!.uid;

    Map<String, dynamic> userInfoMap = {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'userType': userType,
      'uid': uid,
    };
    if (userCredential != null) {
      DataBaseMethods().addUserToDB(auth.currentUser!.uid, userInfoMap);
    }
  }

  Future<void> login(String email, String password) async {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
