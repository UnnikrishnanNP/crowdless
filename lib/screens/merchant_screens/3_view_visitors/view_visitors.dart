import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:flutter/material.dart';

class ViewVisitorsPage extends StatefulWidget {
  const ViewVisitorsPage({Key? key}) : super(key: key);

  @override
  _ViewVisitorsPageState createState() => _ViewVisitorsPageState();
}

class _ViewVisitorsPageState extends State<ViewVisitorsPage> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundMain(
      child: Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
