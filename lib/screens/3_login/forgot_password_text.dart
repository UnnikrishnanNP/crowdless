import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordText extends StatelessWidget {
  final void Function()? onTap;
  const ForgotPasswordText({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 175.0),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: primaryColor),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
