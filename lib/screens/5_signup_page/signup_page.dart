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
  final _auth = FirebaseAuth.instance;
  late String email;
  late String name;
  late String password;
  late String phoneNumber;
  late String _selectedValue;
  @override
  void initState() {
    super.initState();
    _selectedValue = 'merchant';
  }

  setSelectedRadio(String value) {
    setState(() {
      _selectedValue = value;
    });
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
            height: size.height * 0.05,
          ),

          // signup button
          RoundedButton(
            text: 'Sign Up',
            press: () async {
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                // ignore: unnecessary_null_comparison
                if (newUser != null) {
                  if (_selectedValue == 'customer') {
                    Navigator.pushNamed(context, route.customerHomePage);
                  } else {
                    Navigator.pushNamed(context, route.merchantHomePage);
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
        ],
      ),
    );
  }
}
