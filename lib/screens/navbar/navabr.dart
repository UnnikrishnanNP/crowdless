import 'package:crowdless/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../router/app_router.dart' as route;
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryLightColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              'Unnikrishnan',
              style: TextStyle(fontSize: 30),
            ),
            accountEmail: Text(
              'uknp0371@gmail.com',
              style: TextStyle(fontSize: 15),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: primaryLightColor,
              child: ClipOval(),
            ),
            decoration: BoxDecoration(color: primaryColor),
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
                Icons.logout,
                color: primaryColor,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushReplacementNamed(context, route.loginPage);
                  debugPrint('Logged Out');
                });
              }),
        ],
      ),
    );
  }
}
