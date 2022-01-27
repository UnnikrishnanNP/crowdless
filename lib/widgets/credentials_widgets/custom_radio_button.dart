import 'package:crowdless/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({Key? key}) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  List<String> userType = ['Merchant', 'Customer'];
  late int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'You are ',
          style: TextStyle(color: primaryColor),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customRadioButton(userType[0], 0),
              const SizedBox(
                width: 10,
              ),
              customRadioButton(userType[1], 1),
            ]),
      ],
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadioButton(String text, int index) {
    return OutlinedButton(
      onPressed: () => changeIndex(index),
      child: Text(text),
      style: OutlinedButton.styleFrom(
        backgroundColor:
            selectedIndex == index ? inputFieldColor : secondaryColor,
        side: BorderSide(
            color: selectedIndex == index ? primaryColor : inputFieldColor),
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
