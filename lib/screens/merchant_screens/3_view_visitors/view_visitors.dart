import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:crowdless/widgets/other_widgets/card.dart';
import 'package:crowdless/widgets/other_widgets/custom_alertdialog.dart';

class ViewVisitorsPage extends StatefulWidget {
  const ViewVisitorsPage({Key? key}) : super(key: key);

  @override
  _ViewVisitorsPageState createState() => _ViewVisitorsPageState();
}

class _ViewVisitorsPageState extends State<ViewVisitorsPage> {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundMain(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Text(
                'View Visitors',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: primaryColor),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'No data available',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: primaryColor),
                      ),
                    );
                  } else {
                    // final data = snapshot.data as Map<String, dynamic>;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final visit = snapshot.data!.docs[index].data();
                          final name = visit['data']['name'];
                          final email = visit['data']['email'];
                          final phoneNumber = visit['data']['phoneNumber'];
                          final date = visit['date'];
                          final time = visit['time'];
                          return ViewVisitsCard(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (_) {
                                  return CustomAlertDialog(
                                    title: 'Details',
                                    description: Column(
                                      children: [
                                        Text(
                                          'Name : $name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          'Email : $email',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          'Date : $date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          'Time : $time',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                color: primaryColor,
                                                fontWeight: FontWeight.w900,
                                              ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        const Divider(
                                          height: 1,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 50,
                                          child: InkWell(
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                            ),
                                            highlightColor: Colors.grey[200],
                                            onTap: () async {
                                              launch('tel://$phoneNumber');
                                            },
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.call,
                                                    color: Colors.green,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.01,
                                                  ),
                                                  Text(
                                                    'Call',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6
                                                        ?.copyWith(
                                                          color: Colors.green,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            title: Text(
                              name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'Date : $date Time : $time',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: customButtonColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          );
                        });
                  }
                },
                future: FirebaseFirestore.instance
                    .collection('merchant_data')
                    .doc(userId)
                    .collection('visitor')
                    .orderBy('time', descending: true)
                    .get(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
