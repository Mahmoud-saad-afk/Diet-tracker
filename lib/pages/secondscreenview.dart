import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettracker/provider/DBprov.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class secondscreenview extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DBprov>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors plans"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('Doctors_Plans')
            .where("Email", isEqualTo: prov.value)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.black54, Colors.green]),
                  ),
                  child: Column(
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
                                    doc['b1'] +
                                    "\n\n Lunch: \n\n" +
                                    doc['l1'] +
                                    "\n\n Dinner: \n\n" +
                                    doc['d1'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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
                                    doc['b2'] +
                                    "\n\n Lunch: \n\n" +
                                    doc['l2'] +
                                    "\n\n Dinner: \n\n" +
                                    doc['d2'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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
                                    doc['b3'] +
                                    "\n\n Lunch: \n\n" +
                                    doc['l3'] +
                                    "\n\n Dinner: \n\n" +
                                    doc['d3'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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
                                    doc['b4'] +
                                    "\n\n Lunch: \n\n" +
                                    doc['l4'] +
                                    "\n\n Dinner: \n\n" +
                                    doc['d4'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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
                                    doc['b5'] +
                                    "\n\n Lunch: \n\n" +
                                    doc['l5'] +
                                    "\n\n Dinner: \n\n" +
                                    doc['d5'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                                    doc['b6'] +
                                    "\n\n Lunch: \n\n" +
                                    doc['l6'] +
                                    "\n\n Dinner: \n\n" +
                                    doc['d6'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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
                                    doc['b7'] +
                                    "\n\n Lunch: \n\n" +
                                    doc['l7'] +
                                    "\n\n Dinner: \n\n" +
                                    doc['d7'],
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
