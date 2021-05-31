// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:diettracker/pages/Tabbar.dart';
// import 'package:diettracker/pages/adminpages/Addplans.dart';
// import 'package:diettracker/provider/DBprov.dart';
// import 'package:diettracker/provider/auth_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../useerlogin.dart';
//
// class adminhome extends StatefulWidget {
//   final User user;
//   adminhome(this.user);
//
//   @override
//   _adminhomeState createState() => _adminhomeState();
// }
//
// class _adminhomeState extends State<adminhome> {
//   //String name, goal, weight;
//
//   Widget build(BuildContext context) {
//     var prov = Provider.of<AuthProvider>(context);
//     var dbprov = Provider.of<DBprov>(context);
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Admin Home'),
//           actions: [
//             IconButton(
//                 icon: Icon(Icons.logout),
//                 onPressed: () {
//                   prov.logout();
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) => Login()));
//                 })
//           ],
//         ),
//         body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 child: Center(
//                   child: Text(prov.user.email +
//                           "\n HI !" /* name.toString() +
//                       "your goal is \n" + goal.toString() +
//                       "and your current weight is " + weight.toString()*/
//                       ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               RaisedButton(
//                   child: Text("add plans"),
//                   onPressed: () {
//                     FirebaseFirestore.instance
//                         .collection("Doctors_Plans")
//                         .where("Email", isEqualTo: prov.user.email)
//                         .get()
//                         .then((value) {
//                       value.docs.forEach((element) {
//                         print(element.get("plan name"));
//                         dbprov.setplaname(element.get("plan name"));
//                       });
//                     });
//                     //Navigator.push(context,
//                     //  MaterialPageRoute(builder: (context) => Addplans()));
//                   }),
//             ]));
//   }
// /*
//   void getinfobyemail(String Email) async {
//     await FirebaseFirestore.instance
//         .collection("Users_Info")
//         .where("Email", isEqualTo: Email)
//         .get()
//         .then((value) {
//       value.docs.forEach((element) {
//         print(element.data());
//          name = element.get("Name").toString();
//          goal = element.get("Goal").toString();
//          weight = element.get("Weight").toString();
//          print(" this print insdie" + name + goal + weight);
//       });
//     });
//   } */
//
// }
