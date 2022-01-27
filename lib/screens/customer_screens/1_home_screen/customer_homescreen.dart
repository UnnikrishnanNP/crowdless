import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:crowdless/widgets/other_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import '../../../router/app_router.dart' as route;

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
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
                child: Text(
                  'Hi <--Name-->👋🏼',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: primaryColor),
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
                    title: 'Scan QR',
                    description: 'Scan before you enter',
                    titleColor: Colors.black,
                    descColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, route.scanQRPage);
                    },
                  ),
                  CustomCard(
                    icon: Icons.folder_open,
                    title: 'View Visits',
                    description: 'You visited 1 place',
                    titleColor: Colors.black,
                    descColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(context, route.viewVists);
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
                          context, route.crowdManagmentCustomer);
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
