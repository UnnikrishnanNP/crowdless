import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        splashColor: primaryLightColor,
        onTap: () {
          debugPrint('$title tapped');
        },
        child: SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.2,
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
              ),
              Text(
                description,
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
