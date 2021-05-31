import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettracker/pages/useerlogin.dart';
import 'package:diettracker/pages/secondscreenview.dart';
import 'package:diettracker/provider/DBprov.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    // TODO: implement initState
  }
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<DBprov>(context);
    return Container(
      child: Center(
          child: Expanded(
              child: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Doctors_Plans').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  color: Colors.greenAccent,
                  shadowColor: Colors.greenAccent,
                  elevation: 8,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListTile(
                      subtitle: Text(doc["Name"]),
                      title: Text(doc["description"]),
                      onTap: () {
                        prov.setvalue(doc['Email']);
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new secondscreenview()));
                      }),
                );
              }).toList(),
            );
        },
      )
              //         child: StreamBuilder(
              //   stream: streamdata,
              //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (snapshot.hasData) {
              //       return ListView(
              //         children: snapshot.data.docs
              //             .map((e) => Column(
              //                   children: [
              //                     ListTile(
              //                       title: Text(e['Name']),
              //                       onTap: () {
              //                         prov.setvalue(e['Email']);
              //                         Navigator.push(
              //                             context,
              //                             new MaterialPageRoute(
              //                                 builder: (context) =>
              //                                     new secondscreenview()));
              //                         print(e["Name"].toString());
              //                         print(e["Email"].toString());
              //                       },
              //                     ),
              //                     Divider(
              //                       color: Colors.black.withOpacity(0.6),
              //                       thickness: 2,
              //                     )
              //                   ],
              //                 ))
              //             .toList(),
              //       );
              //     }
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   },
              // )
              )),
    );
  }
}
