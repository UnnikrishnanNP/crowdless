import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.1),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(customButtonColor),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(
                  vertical: size.width * 0.05, horizontal: size.width * 0.08),
            ),
          ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
