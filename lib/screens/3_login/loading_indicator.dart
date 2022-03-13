import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final String text;
  const LoadingIndicator({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          color: primaryLightColor,
        ),
        SizedBox(
          width: size.width * 0.04,
        ),
        Text(
          text,
          style: const TextStyle(color: primaryLightColor),
        )
      ],
    );
  }
}
