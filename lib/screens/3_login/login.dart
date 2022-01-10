// ignore_for_file: unused_local_variable, avoid_print

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/screens/3_login/account_check.dart';
import 'package:crowdless/screens/3_login/forgot_password_text.dart';
import 'package:crowdless/widgets/custom_textfield.dart';
import 'package:crowdless/widgets/others_options.dart';
import 'package:crowdless/widgets/rounded_button.dart';
import 'package:crowdless/widgets/rounded_inputfield.dart';
import 'package:crowdless/widgets/rounded_passwordfield.dart';

import '../../router/app_router.dart' as route;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.00125,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Welcome Back!',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: size.height * 0.025),
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.025,
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
                          onTap: () => Navigator.pushReplacementNamed(
                              context, route.forgotPass),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        RoundedButton(
                          color: primaryColor,
                          text: 'LOGIN as Customer',
                          press: () {
                            Navigator.pushNamed(
                                context, route.customerHomePage);
                          },
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        RoundedButton(
                          color: primaryColor,
                          text: 'LOGIN as Merchant',
                          press: () {
                            Navigator.pushNamed(
                                context, route.merchantHomePage);
                          },
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        AccountCheck(
                          press: () => Navigator.pushReplacementNamed(
                              context, route.signUpPage),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        const OthersOption()
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
