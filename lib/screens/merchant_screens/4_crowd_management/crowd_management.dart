import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:flutter/material.dart';

class CrowdManagementMerchant extends StatefulWidget {
  const CrowdManagementMerchant({Key? key}) : super(key: key);

  @override
  _CrowdManagementMerchantState createState() =>
      _CrowdManagementMerchantState();
}

class _CrowdManagementMerchantState extends State<CrowdManagementMerchant> {
  @override
  Widget build(BuildContext context) {
    return const BackgroundMain(
      child: Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
