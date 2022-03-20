// ignore_for_file: unnecessary_null_comparison

import 'package:crowdless/screens/3_login/loading_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/methods/authentication.dart';
import 'package:crowdless/methods/database.dart';
import 'package:crowdless/screens/3_login/account_check.dart';
import 'package:crowdless/screens/3_login/forgot_password_text.dart';
import 'package:crowdless/widgets/credentials_widgets/background_widget.dart';
import 'package:crowdless/widgets/credentials_widgets/custom_textfield.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_button.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_inputfield.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_passwordfield.dart';

import '../../router/app_router.dart' as route;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = FirebaseAuth.instance;
  bool isLoading = false;

  // userReference userCollection =
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
            color: customButtonColor,
            text: isLoading
                ? const LoadingIndicator(text: 'Logging In')
                : const Text(
                    'Login',
                    style: TextStyle(color: primaryLightColor),
                  ),
            press: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              setState(() {
                isLoading = true;
              });
              try {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                if (email != null) {
                  sharedPreferences.setString('email', email);
                }
                await Authentication().login(email, password);
                var fetchedData =
                    await DataBaseMethods().queryDataFromDB('userType');
                if (fetchedData == 'Customer') {
                  Navigator.pushReplacementNamed(
                      context, route.customerHomePage);
                } else {
                  Navigator.pushReplacementNamed(
                      context, route.merchantHomePage);
                }
              } on FirebaseAuthException catch (error) {
                setState(() {
                  isLoading = false;
                });

                debugPrint(error.toString());
                if (error.code == 'wrong-password') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                          'Wrong Password',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: primaryColor),
                  );
                } else if (error.code == 'user-not-found') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                          'Check your email',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: primaryColor),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                          error.code.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: primaryColor),
                  );
                }
              }
            },
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
        ],
      ),
    );
  }
}
