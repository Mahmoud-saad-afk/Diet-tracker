import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettracker/provider/DBprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expansion_card/expansion_card.dart';

class FirstScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<FirstScreen> {
  @override
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DBprov>(context);
    return Container(
      child: Center(
          child: Expanded(
              child: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('Plans')
            .where("plan name", isEqualTo: prov.plan_name)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return Column(
                  children: [
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/exp.jpg",
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "         Day 1",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.lightGreen),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                              "Breakfast: \n\n" +
                                  doc['Breakfast1'] +
                                  "\n\n Lunch: \n\n" +
                                  doc['Lunch1'] +
                                  "\n\n Dinner: \n\n" +
                                  doc['Dinner1'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/exp.jpg",
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "         Day 2",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.lightGreen),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                              "Breakfast: \n\n" +
                                  doc['Breakfast2'] +
                                  "\n\n Lunch: \n\n" +
                                  doc['Lunch2'] +
                                  "\n\n Dinner: \n\n" +
                                  doc['Dinner2'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/exp.jpg",
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "         Day 3",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                              "Breakfast: \n\n" +
                                  doc['Breakfast3'] +
                                  "\n\n Lunch: \n\n" +
                                  doc['Lunch3'] +
                                  "\n\n Dinner: \n\n" +
                                  doc['Dinner3'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/exp.jpg",
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "         Day 4",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                              "Breakfast: \n\n" +
                                  doc['Breakfast4'] +
                                  "\n\n Lunch: \n\n" +
                                  doc['Lunch4'] +
                                  "\n\n Dinner: \n\n" +
                                  doc['Dinner4'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/exp.jpg",
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "         Day 5",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            child: Text(
                              "Breakfast: \n\n" +
                                  doc['Breakfast5'] +
                                  "\n\n Lunch: \n\n" +
                                  doc['Lunch5'] +
                                  "\n\n Dinner: \n\n" +
                                  doc['Dinner5'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/exp.jpg",
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "         Day 6",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                              "Breakfast: \n\n" +
                                  doc['Breakfast6'] +
                                  "\n\n Lunch: \n\n" +
                                  doc['Lunch6'] +
                                  "\n\n Dinner: \n\n" +
                                  doc['Dinner6'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/exp.jpg",
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "         Day 7",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.lightGreen,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                              "Breakfast: \n\n" +
                                  doc['Breakfast7'] +
                                  "\n\n Lunch: \n\n" +
                                  doc['Lunch7'] +
                                  "\n\n Dinner: \n\n" +
                                  doc['Dinner7'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        )
                      ],
                    ),
                  ],
                );
              }).toList(),
            );
        },
      ))),
    );
  }
}
