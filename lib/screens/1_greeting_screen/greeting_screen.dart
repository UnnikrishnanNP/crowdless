import 'dart:async';

import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../router/app_router.dart' as route;

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
      Navigator.pushReplacementNamed(context, route.loginPage);
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
