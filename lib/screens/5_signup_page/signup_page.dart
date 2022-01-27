// import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/screens/3_login/account_check.dart';
import 'package:crowdless/widgets/credentials_widgets/background_widget.dart';
import 'package:crowdless/widgets/credentials_widgets/custom_textfield.dart';
import 'package:crowdless/widgets/credentials_widgets/others_options.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_button.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_inputfield.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_passwordfield.dart';
import 'package:flutter/material.dart';
import '../../router/app_router.dart' as route;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<String> userType = ['Merchant', 'Customer'];
  late String email;
  late String name;
  late String password;
  late String phoneNumber;
  late String user;
  late int selectedIndex = 0;

  final _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  int? changeIndex(int index) {
    setState(() {
      selectedIndex = index;
      user = userType[index];
    });
  }

  Widget customRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex(index),
      child: Text(text),
      style: OutlinedButton.styleFrom(
        backgroundColor:
            selectedIndex == index ? inputFieldColor : secondaryColor,
        side: BorderSide(
            color: selectedIndex == index ? primaryColor : inputFieldColor),
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BackgroundWidget(
      title: 'Sign Up',
      description: 'Let\'s Get Started',
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.025,
          ),
          RoundedInputField(
            keyboardType: TextInputType.text,
            hintTextTitle: 'Name',
            onChanged: (value) {
              name = value;
            },
            icon: const Icon(
              Icons.person,
              color: primaryColor,
            ),
          ),
          RoundedInputField(
            keyboardType: TextInputType.emailAddress,
            hintTextTitle: 'Email',
            onChanged: (value) {
              email = value;
            },
            icon: const Icon(
              Icons.email,
              color: primaryColor,
            ),
          ),
          TextFieldContainer(
            child: RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
              hintTextTitle: 'Password',
            ),
          ),
          RoundedInputField(
            keyboardType: TextInputType.number,
            hintTextTitle: 'Phone Number',
            onChanged: (value) {
              phoneNumber = value;
            },
            icon: const Icon(
              Icons.phone,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Column(
            children: [
              const Text(
                'You are ',
                style: TextStyle(color: primaryColor),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customRadioButton(userType[0], 0),
                    const SizedBox(
                      width: 10,
                    ),
                    customRadioButton(userType[1], 1),
                  ]),
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          // signup button
          RoundedButton(
            text: 'Sign Up',
            press: () async {
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                users.add({
                  'name': name,
                  'email': email,
                  'phoneNumber': phoneNumber,
                  'userType': user,
                }).then((value) => debugPrint('User added'));
                // ignore: unnecessary_null_comparison
                if (newUser != null) {
                  if (user == userType[0]) {
                    Navigator.pushNamed(context, route.merchantHomePage);
                  } else {
                    Navigator.pushNamed(context, route.customerHomePage);
                  }
                }
              } catch (error) {
                // ignore: avoid_print
                print(error);
              }
            },
            color: primaryColor,
            textColor: Colors.white,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          AccountCheck(
            press: () =>
                Navigator.pushReplacementNamed(context, route.loginPage),
            login: false,
          ),
          const OthersOption(),
          SizedBox(
            height: size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
