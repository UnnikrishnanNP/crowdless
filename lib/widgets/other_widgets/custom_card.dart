import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final Widget description;
  final IconData icon;
  final Color titleColor;
  final void Function()? onTap;
  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.titleColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        splashColor: primaryLightColor,
        onTap: onTap,
        child: SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Center(
                child: Icon(
                  icon,
                  color: primaryColor,
                  size: size.width * 0.2,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: titleColor, fontWeight: FontWeight.w600),
                ),
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
      margin: const EdgeInsets.all(5.0),
    );
  }
}
