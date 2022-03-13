import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdless/constants/colors.dart';
import 'package:crowdless/widgets/other_widgets/card.dart';
import 'package:crowdless/widgets/other_widgets/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
                          return ViewVisitsCard(
                            title: Text(
                              visit['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              visit['email'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: primaryLightColor,
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
                    .get(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
