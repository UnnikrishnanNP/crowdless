// ignore_for_file: avoid_print
import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_button.dart';
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
    final Size size = MediaQuery.of(context).size;
    return BackgroundMain(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Use this QR Code ',
              style: TextStyle(color: Colors.black),
            ),
            QrImage(
              data: auth.currentUser!.uid,
              size: 200,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            RoundedButton(
              color: primaryColor,
              text: const Text(
                'Print QR Code',
                style: TextStyle(color: primaryLightColor),
              ),
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
