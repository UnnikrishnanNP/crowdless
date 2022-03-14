// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/methods/database.dart';
import 'package:crowdless/widgets/other_widgets/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../router/app_router.dart' as route;
import 'package:flutter/material.dart';
import 'package:crowdless/widgets/other_widgets/background.dart';

class MercantHomeScreen extends StatefulWidget {
  const MercantHomeScreen({Key? key}) : super(key: key);

  @override
  _MercantHomeScreenState createState() => _MercantHomeScreenState();
}

class _MercantHomeScreenState extends State<MercantHomeScreen> {
  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref().child('Users');
  final userRef = FirebaseFirestore.instance.collection('users');
  Future? getData() async {
    final name = await DataBaseMethods().queryDataFromDB('name');
    return name;
  }

  @override
  void initState() {
    getqueryDataFromDB();
    super.initState();
  }

  getqueryDataFromDB() async => await DataBaseMethods().queryDataFromDB('name');

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
                      return const Text('Data Loading...');
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
                    title: 'Generate QR',
                    description: 'Create QR Code for your shop',
                    titleColor: Colors.black,
                    descColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, route.generateQR);
                    },
                  ),
                  CustomCard(
                    icon: Icons.folder_open,
                    title: 'View Visitors',
                    description: 'You have 10 visitors',
                    titleColor: Colors.black,
                    descColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, route.viewVisitors);
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
                          context, route.crowdManagmentMerchant);
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
}
