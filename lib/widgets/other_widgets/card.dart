import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class ViewVisitsCard extends StatelessWidget {
  final Widget title;
  final Widget description;
  // final Color titleColor;
  // final Color descColor;
  final void Function()? onTap;
  const ViewVisitsCard(
      {Key? key,
      required this.title,
      required this.description,
      // required this.titleColor,
      // required this.descColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        splashColor: primaryLightColor,
        onTap: () {},
        child: SizedBox(
          height: size.height * 0.1,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                left: 10,
                child: title,
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: description,
              )
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(20.0),
    );
  }
}
