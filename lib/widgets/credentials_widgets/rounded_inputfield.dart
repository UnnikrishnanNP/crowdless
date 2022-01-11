import 'package:crowdless/widgets/credentials_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintTextTitle;
  final Icon icon;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  const RoundedInputField({
    Key? key,
    required this.hintTextTitle,
    required this.icon,
    required this.onChanged,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
              border: InputBorder.none, hintText: hintTextTitle, icon: icon),
          keyboardType: keyboardType),
    );
  }
}
