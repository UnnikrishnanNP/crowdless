// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/methods/database.dart';
import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:crowdless/widgets/other_widgets/custom_card.dart';

import '../../../router/app_router.dart' as route;

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final auth = FirebaseAuth.instance;
  final userRef = FirebaseFirestore.instance.collection('users');

  Future? getData() async {
    final name = await DataBaseMethods().queryDataFromDB('name');
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BackgroundMain(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.13,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: FutureBuilder(
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    } else {
                      return Text(
                        'Hi ${snapshot.data.toString()}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: primaryColor),
                      );
                    }
                  },
                  future: getData(),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  CustomCard(
                    icon: Icons.qr_code_scanner,
                    title: 'Scan QR',
                    description: 'Scan before you enter',
                    titleColor: Colors.black,
                    descColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, route.scanQRPage);
                    },
                  ),
                  CustomCard(
                    icon: Icons.folder_open,
                    title: 'View Visits',
                    description: 'You visited 1 place',
                    titleColor: Colors.black,
                    descColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, route.viewVists);
                    },
                  ),
                  CustomCard(
                    icon: Icons.people_alt,
                    title: 'Crowd Mangament',
                    description: 'View Crowd at your location',
                    titleColor: Colors.black,
                    descColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(
                          context, route.crowdManagmentCustomer);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future<String?> text() async {
  //   final User userCurrent = _auth.currentUser!;
  //   final uId = userCurrent.uid;
  //   final DatabaseReference docUserType = dbRef.child(uId).child('name');
  //   final data = await docUserType.get();
  //   return data.value.toString();
  // }
}
