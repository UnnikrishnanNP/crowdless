import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintTextTitle;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.hintTextTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintTextTitle,
        icon: const Icon(
          Icons.lock,
          color: primaryColor,
        ),
        // suffixIcon: const Icon(
        //   Icons.visibility,
        //   color: primaryColor,
        // ),
      ),
    );
  }
}
