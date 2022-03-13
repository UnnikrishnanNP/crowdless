// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_button.dart';
import 'package:crowdless/widgets/credentials_widgets/rounded_inputfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String email;
    late int otp;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.025,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Forgot Password',
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.00125,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: size.height * 0.025),
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        RoundedInputField(
                          keyboardType: TextInputType.emailAddress,
                          icon: const Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                          hintTextTitle: 'Your Email',
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        RoundedInputField(
                          keyboardType: TextInputType.phone,
                          icon: const Icon(
                            Icons.phone,
                            color: primaryColor,
                          ),
                          hintTextTitle: 'Enter OTP',
                          onChanged: (value) {
                            otp = value as int;
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        RoundedButton(
                          color: customButtonColor,
                          text: const Text('Submit'),
                          press: () {},
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
