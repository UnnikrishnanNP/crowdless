import 'package:crowdless/screens/navbar/navabr.dart';

// import '../../../router/app_router.dart' as route;
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
      endDrawer: const NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
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
    );
  }
}
