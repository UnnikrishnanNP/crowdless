// import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:flutter/material.dart';

class ViewVists extends StatefulWidget {
  const ViewVists({Key? key}) : super(key: key);

  @override
  _ViewVistsState createState() => _ViewVistsState();
}

class _ViewVistsState extends State<ViewVists> {
  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return BackgroundMain(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text('Coming Soon'),
          ),
        ],
      ),
    );
  }
}
