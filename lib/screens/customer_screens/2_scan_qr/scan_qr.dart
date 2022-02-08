// import 'package:crowdless/constants/colors.dart';
// import 'package:crowdless/widgets/other_widgets/custom_card.dart';
// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/methods/database.dart';
import 'package:crowdless/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({Key? key}) : super(key: key);

  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  bool barocdeScanned = true;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQRCView(context),
          Positioned(
            bottom: 10,
            child: buildResult(),
          )
        ],
      ),
    );
  }

  Widget buildQRCView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: primaryLightColor,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen(
      (barcode) => setState(() {
        this.barcode = barcode;
        barocdeScanned = true;
        if (barocdeScanned) {
          DataBaseMethods().addMerchantScanData(barcode.code ?? "");
          DataBaseMethods().addCustomerScanData(barcode.code ?? "");
          controller.pauseCamera();
          Navigator.pushReplacementNamed(context, customerHomePage);
        }
      }),
    );
  }

  Widget buildResult() {
    return AlertDialog(
      content: Center(
        child: Text(
          barcode != null ? 'Data added to database' : 'Scan QR',
          style: const TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}
