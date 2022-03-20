import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../router/app_router.dart' as route;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.greetingScreen,
      debugShowCheckedModeBanner: false,
    );
  }
}
