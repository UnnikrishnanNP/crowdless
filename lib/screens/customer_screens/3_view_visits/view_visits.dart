// import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/screens/customer_screens/3_view_visits/card.dart';
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
    final Size size = MediaQuery.of(context).size;
    return BackgroundMain(
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Text(
                'View Visits',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: primaryColor),
              ),
            ),
          ),
          const ViewVisitsCard(
              title: 'title',
              description: 'description',
              titleColor: primaryColor,
              descColor: primaryLightColor)
        ],
      ),
    );
  }
}
