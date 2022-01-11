import 'package:crowdless/constants/colors.dart';
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

    return Scaffold(
      backgroundColor: primaryLightColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryLightColor,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(
            'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.v6whqX6ijqrdaGRsvXQzHAHaEK%26pid%3DApi&f=1',
            width: size.width * 0.01,
            height: size.height * 0.01,
            fit: BoxFit.fill,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context, route.loginPage);
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: primaryColor,
            ),
          )
        ],
      ),
      body: SizedBox(
        height: size.height - kToolbarHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.04,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Text(
                    'Hi <--Name-->👋🏼',
                    style: TextStyle(
                        fontSize: size.width * 0.07, color: primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: Column(
                  children: const <Widget>[
                    CustomCard(
                      title: 'Scan QR',
                      description: 'Scan before you enter',
                    ),
                    CustomCard(
                      title: 'View Visits',
                      description: 'You visited 1 place',
                    ),
                    CustomCard(
                      title: 'Crowd Mangament',
                      description: 'View Crowd at your location',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
