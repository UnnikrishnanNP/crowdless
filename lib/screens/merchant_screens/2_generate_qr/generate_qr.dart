import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({Key? key}) : super(key: key);

  @override
  _GenerateQRPageState createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundMain(
      child: Center(
        child: QrImage(
          data: 'G dgd',
        ),
      ),
    );
  }
}
