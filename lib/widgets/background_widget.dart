import 'package:crowdless/constants/colors.dart';

import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final String description;
  const BackgroundWidget({
    Key? key,
    required this.child,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16.0),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.width * 0.1),
                    topRight: Radius.circular(size.width * 0.1),
                  ),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
