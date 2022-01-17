import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:flutter/material.dart';

class CrowdManagementCustomer extends StatefulWidget {
  const CrowdManagementCustomer({Key? key}) : super(key: key);

  @override
  _CrowdManagementCustomerState createState() =>
      _CrowdManagementCustomerState();
}

class _CrowdManagementCustomerState extends State<CrowdManagementCustomer> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundMain(
      child: Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
