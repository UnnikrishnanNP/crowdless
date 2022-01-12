// import 'package:crowdless/constants/colors.dart';
import '../../../router/app_router.dart' as route;
import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundMain extends StatefulWidget {
  final Widget child;
  const BackgroundMain({Key? key, required this.child}) : super(key: key);

  @override
  _BackgroundMainState createState() => _BackgroundMainState();
}

class _BackgroundMainState extends State<BackgroundMain> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryLightColor.withOpacity(0),
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
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/images/background_main/Ellipse_2.svg',
                width: size.width * 0.85,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                'assets/images/background_main/Ellipse_1.svg',
                width: size.width * 0.75,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/images/background_main/Ellipse_3.svg',
                width: size.width * 0.75,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/images/background_main/Ellipse_4.svg',
                width: size.width * 0.65,
              ),
            ),
            SizedBox(
              height: size.height - kToolbarHeight,
              child: widget.child,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.09,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.home,
              color: primaryColor,
              size: size.width * 0.08,
            ),
            Icon(
              Icons.notifications_none,
              color: primaryColor,
              size: size.width * 0.08,
            ),
            Icon(
              Icons.person,
              color: primaryColor,
              size: size.width * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
