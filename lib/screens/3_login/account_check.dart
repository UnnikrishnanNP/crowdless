import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final void Function()? press;
  const AccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? 'Don\'t have an Account? ' : 'Already have an account? ',
          style: const TextStyle(
            color: primaryColor,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? ' Signup' : ' Sign In',
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
