// ignore_for_file: unnecessary_null_comparison

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:crowdless/widgets/credentials_widgets/background_widget.dart';
import 'package:crowdless/widgets/credentials_widgets/custom_textfield.dart';
import 'package:crowdless/widgets/credentials_widgets/others_options.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_button.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_inputfield.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_passwordfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/screens/3_login/account_check.dart';
import 'package:crowdless/screens/3_login/forgot_password_text.dart';

import '../../router/app_router.dart' as route;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref().child('Users');

  // CollectionReference userCollection =
  //     FirebaseFirestore.instance.collection('users');

  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundWidget(
      title: 'Login',
      description: 'Welcome Back!',
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          RoundedInputField(
            keyboardType: TextInputType.emailAddress,
            icon: const Icon(
              Icons.person,
              color: primaryColor,
            ),
            hintTextTitle: 'Your Email',
            onChanged: (value) {
              email = value;
            },
          ),
          TextFieldContainer(
            child: RoundedPasswordField(
              hintTextTitle: 'Password',
              onChanged: (value) {
                password = value;
              },
            ),
          ),
          ForgotPasswordText(
            onTap: () =>
                Navigator.pushReplacementNamed(context, route.forgotPass),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          RoundedButton(
            color: primaryColor,
            text: 'Login',
            press: () async {
              final newUser = _auth.signInWithEmailAndPassword(
                  email: email, password: password);

              if (newUser != null) {
                final User userCurrent = _auth.currentUser!;
                final uId = userCurrent.uid;
                final DatabaseReference docUserType =
                    dbRef.child(uId).child('userType');
                final data = await docUserType.get();
                if (data.value == 'Customer') {
                  Navigator.pushReplacementNamed(
                      context, route.customerHomePage);
                } else {
                  Navigator.pushReplacementNamed(
                      context, route.merchantHomePage);
                }
                // await dbRef
                //     .child(uId)
                //     .child('userType')
                //     .once()
                //     .then((DatabaseEvent event) {
                //   setState(() {
                //     if (docUserType == 'Customer') {
                //       Navigator.pushReplacementNamed(
                //           context, route.customerHomePage);
                //     } else {
                //       Navigator.pushReplacementNamed(
                //           context, route.merchantHomePage);
                //     }
                //   });
                // });

                // final QuerySnapshot result = await userCollection.get();
                // final List<DocumentSnapshot> documents = result.docs.toList();
                // for (var data in documents) {
                //   print(data['userType']);
              }
              // await dbRef
              //     .child(uId)
              //     .once()
              //     .then((DatabaseEvent? event) async {
              //   // var data = event?.snapshot.value;
              //   final QuerySnapshot result = awai;
              //   final List<DocumentSnapshot> documents = result.docs.toList();
              //   setState(() {
              //     for (var data in documents) {
              //       print(data['userType']);
              //     }
              // if (documents[] == 'Customer') {
              //   Navigator.pushReplacementNamed(
              //       context, route.customerHomePage);
              // } else {
              //   Navigator.pushReplacementNamed(
              //       context, route.merchantHomePage);
              // }
              //   });
              // });
            },
            textColor: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          AccountCheck(
            press: () =>
                Navigator.pushReplacementNamed(context, route.signUpPage),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          const OthersOption(),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
