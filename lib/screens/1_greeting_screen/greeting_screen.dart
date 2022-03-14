import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/methods/database.dart';

import '../../router/app_router.dart' as route;

String? email;

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({Key? key}) : super(key: key);

  @override
  State<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      getValidationData().whenComplete(() async {
        if (email == null) {
          Navigator.pushReplacementNamed(context, route.loginPage);
        } else {
          var fetchedData = await DataBaseMethods().queryDataFromDB('userType');
          if (fetchedData == 'Customer') {
            Navigator.pushReplacementNamed(context, route.customerHomePage);
          } else {
            Navigator.pushReplacementNamed(context, route.merchantHomePage);
          }
        }
      });
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final obtianedEmail = sharedPreferences.getString('email');
    setState(() {
      email = obtianedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    // size provides total height and width of screen
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryLightColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo_splashscreen.png',
              width: size.width * 0.6,
              // height: size.height * 0.5,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
