import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../router/app_router.dart' as route;

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // size provides total height and width of screen
    // final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route.loginPage),
      child: Scaffold(
        backgroundColor: primaryLightColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Logo Here'),
              Text('Loading Animation'),
            ],
          ),
        ),
      ),
    );
  }
}
