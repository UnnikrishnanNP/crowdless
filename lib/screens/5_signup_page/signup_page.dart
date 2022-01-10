import 'package:firebase_auth/firebase_auth.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/screens/3_login/account_check.dart';
import 'package:crowdless/widgets/custom_textfield.dart';
import 'package:crowdless/widgets/others_options.dart';
import 'package:crowdless/widgets/rounded_button.dart';
import 'package:crowdless/widgets/rounded_inputfield.dart';
import 'package:crowdless/widgets/rounded_passwordfield.dart';
import 'package:flutter/material.dart';
import '../../router/app_router.dart' as route;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String name;
  late String password;
  late String phoneNumber;
  late String _selectedValue;
  @override
  void initState() {
    super.initState();
    _selectedValue = 'merchant';
  }

  setSelectedRadio(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Sign Up',
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(
                height: size.height * 0.00125,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Lets Get Started',
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
                          keyboardType: TextInputType.text,
                          hintTextTitle: 'Name',
                          onChanged: (value) {
                            name = value;
                          },
                          icon: const Icon(
                            Icons.person,
                            color: primaryColor,
                          ),
                        ),
                        RoundedInputField(
                          keyboardType: TextInputType.emailAddress,
                          hintTextTitle: 'Email',
                          onChanged: (value) {
                            email = value;
                          },
                          icon: const Icon(
                            Icons.email,
                            color: primaryColor,
                          ),
                        ),
                        TextFieldContainer(
                          child: RoundedPasswordField(
                            onChanged: (value) {
                              password = value;
                            },
                            hintTextTitle: 'Password',
                          ),
                        ),
                        RoundedInputField(
                          keyboardType: TextInputType.number,
                          hintTextTitle: 'Phone Number',
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          icon: const Icon(
                            Icons.phone,
                            color: primaryColor,
                          ),
                        ),

                        // radio buttons
                        // Column(
                        //   children: [
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Radio(
                        //           value: 'merchant',
                        //           activeColor: primaryColor,
                        //           groupValue: _selectedValue,
                        //           onChanged: (value) {
                        //             // setSelectedRadio(value as String);
                        //           },
                        //         ),
                        //         const Text('Merchant'),
                        //         SizedBox(
                        //           height: size.width * 0.05,
                        //         ),
                        //         Radio(
                        //           activeColor: primaryColor,
                        //           value: 'customer',
                        //           groupValue: _selectedValue,
                        //           onChanged: (value) {
                        //             setSelectedRadio(value as String);
                        //           },
                        //         ),
                        //         const Text('Customer'),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        SizedBox(
                          height: size.height * 0.05,
                        ),

                        // signup button
                        RoundedButton(
                          text: 'Sign Up',
                          press: () async {
                            try {
                              final newUser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              // ignore: unnecessary_null_comparison
                              if (newUser != null) {
                                if (_selectedValue == 'customer') {
                                  Navigator.pushNamed(
                                      context, route.customerHomePage);
                                } else {
                                  Navigator.pushNamed(
                                      context, route.merchantHomePage);
                                }
                              }
                            } catch (error) {
                              // ignore: avoid_print
                              print(error);
                            }
                          },
                          color: primaryColor,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        AccountCheck(
                          press: () => Navigator.pushReplacementNamed(
                              context, route.loginPage),
                          login: false,
                        ),
                        const OthersOption(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // body: BackgroundWidget(
      //   title: 'Sign Up',
      //   description: 'Lets get started!',
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       RoundedInputField(
      //         keyboardType: TextInputType.text,
      //         hintTextTitle: 'Name',
      //         onChanged: (value) {
      //           name = value;
      //         },
      //         icon: const Icon(
      //           Icons.person,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.emailAddress,
      //         hintTextTitle: 'Email',
      //         onChanged: (value) {
      //           email = value;
      //         },
      //         icon: const Icon(
      //           Icons.email,
      //           color: primaryColor,
      //         ),
      //       ),
      //       TextFieldContainer(
      //         child: RoundedPasswordField(
      //           onChanged: (value) {
      //             password = value;
      //           },
      //           hintTextTitle: 'Password',
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),
      //       RoundedInputField(
      //         keyboardType: TextInputType.number,
      //         hintTextTitle: 'Phone Number',
      //         onChanged: (value) {
      //           phoneNumber = value;
      //         },
      //         icon: const Icon(
      //           Icons.phone,
      //           color: primaryColor,
      //         ),
      //       ),

      //       // radio buttons
      //       Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Radio(
      //                 value: 'merchant',
      //                 activeColor: primaryColor,
      //                 groupValue: _selectedValue,
      //                 onChanged: (value) {
      //                   // setSelectedRadio(value as String);
      //                 },
      //               ),
      //               const Text('Merchant'),
      //               SizedBox(
      //                 height: size.width * 0.05,
      //               ),
      //               Radio(
      //                 activeColor: primaryColor,
      //                 value: 'customer',
      //                 groupValue: _selectedValue,
      //                 onChanged: (value) {
      //                   setSelectedRadio(value as String);
      //                 },
      //               ),
      //               const Text('Customer'),
      //             ],
      //           ),
      //         ],
      //       ),

      //       SizedBox(
      //         height: size.height * 0.05,
      //       ),

      //       // signup button
      //       RoundedButton(
      //         text: 'Sign Up',
      //         press: () async {
      //           try {
      //             final newUser = await _auth.createUserWithEmailAndPassword(
      //                 email: email, password: password);
      //             // ignore: unnecessary_null_comparison
      //             if (newUser != null) {
      //               if (_selectedValue == 'customer') {
      //                 Navigator.pushNamed(context, route.customerHomePage);
      //               } else {
      //                 Navigator.pushNamed(context, route.merchantHomePage);
      //               }
      //             }
      //           } catch (error) {
      //             // ignore: avoid_print
      //             print(error);
      //           }
      //         },
      //         color: primaryColor,
      //         textColor: Colors.white,
      //       ),
      //       SizedBox(
      //         height: size.height * 0.03,
      //       ),
      //       AccountCheck(
      //         press: () =>
      //             Navigator.pushReplacementNamed(context, route.loginPage),
      //         login: false,
      //       ),
      //       const OthersOption(),

      //       // SocialIcons()
      //     ],
      //   ),
      // ),
    );
  }
}

// class SocialIcons extends StatelessWidget {
//   const SocialIcons({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             border: Border.all(
//               width: 2,
//               color: primaryColor,
//             ),
//             shape: BoxShape.circle,
//           ),
//         ),
//       ],
//     );
//   }
// }
