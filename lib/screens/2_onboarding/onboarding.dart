import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(
//               height: 80,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const <Widget>[
//                   Text('Login', style: sLoginText),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Welcome Back!',
//                     style: sWelcomeBackText,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: const BoxDecoration(
//                   color: secondaryColor,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40.0),
//                     topRight: Radius.circular(40.0),
//                   ),
//                 ),

//                 // input fields
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: <Widget>[
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: inputFieldColor,
//                               blurRadius: 20,
//                               offset: Offset(0, 10),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           children: const <Widget>[
//                             CustomInputField(
//                                 titleHintText: 'Email or Phone Number'),
//                             CustomInputField(
//                               titleHintText: 'Password',
//                             )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
