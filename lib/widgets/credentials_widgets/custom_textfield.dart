import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.width * 0.02),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.width * 0.01),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: inputFieldColor,
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,
      ),
    );
  }
}
