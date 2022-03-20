import 'package:crowdless/methods/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../router/app_router.dart' as route;

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Future? getData() async {
    final name = await DataBaseMethods().queryDataFromDB('name');
    final email = await DataBaseMethods().queryDataFromDB('email');
    return [name, email];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryLightColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Data Loading...');
                } else {
                  return Text(
                    snapshot.data[0].toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: primaryLightColor),
                  );
                }
              },
              future: getData(),
            ),
            accountEmail: FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Data Loading...');
                } else {
                  return Text(
                    snapshot.data[1].toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: primaryLightColor),
                  );
                }
              },
              future: getData(),
            ),
            decoration: const BoxDecoration(color: primaryColor),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: primaryColor,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () => debugPrint('Profile'),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: primaryColor,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () => debugPrint('Settings'),
          ),
          ListTile(
            leading: const Icon(
              Icons.quiz,
              color: primaryColor,
            ),
            title: const Text(
              'About',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () => debugPrint('About'),
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: primaryColor,
            ),
            title: const Text(
              'Help',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () => debugPrint('Help'),
          ),
          ListTile(
              leading: const Icon(
                Icons.bug_report,
                color: primaryColor,
              ),
              title: const Text(
                'Found a bug?',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () async {
                launch('mailto:uknp0371@gmail.com');
              }),
          ListTile(
              leading: const Icon(
                Icons.logout,
                color: primaryColor,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.remove('email');
                  Navigator.pushReplacementNamed(context, route.loginPage);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                          'Logged Out',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: primaryColor),
                  );
                });
              }),
        ],
      ),
    );
  }
}
