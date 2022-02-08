// ignore_for_file: avoid_print

import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({Key? key}) : super(key: key);

  @override
  _GenerateQRPageState createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BackgroundMain(
      child: Center(
        child: QrImage(
          data: auth.currentUser!.uid,
        ),
      ),
    );
  }
}
