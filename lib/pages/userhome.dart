import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diettracker/pages/useerlogin.dart';
import 'package:diettracker/provider/DBprov.dart';
import 'package:diettracker/provider/Database.dart';
import 'package:diettracker/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'Tabbar.dart';
import 'adminpages/Addplans.dart';

class Home extends StatefulWidget {
  final User user;
  Home(this.user);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showtoast() {
    Fluttertoast.showToast(
        msg: "incorrect password",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  TextEditingController _textFieldController = TextEditingController();
  String valueText;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey,
            title: Text('Enter the verification code'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              obscureText: true,
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Verification code "),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  if (valueText == "1827183") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Addplans()));
                  } else {
                    showtoast();
                  }
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    var prov = Provider.of<AuthProvider>(context);
    var dbprov = Provider.of<DBprov>(context);
    Database db = new Database();
    db.getinfobyemail(prov.user.email);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/img1.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        )),
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.black45, Colors.black12],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ).createShader(bounds),
          blendMode: BlendMode.darken,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome !',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Expanded(
                      child: FlatButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection("Users_Info")
                              .where("Email", isEqualTo: prov.user.email)
                              .get()
                              .then((value) {
                            value.docs.forEach((element) {
                              print(element.get("plan name"));
                              dbprov.setplaname(element.get("plan name"));
                            });
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => sperator()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 50, right: 50),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Expanded(
                      child: FlatButton(
                        onPressed: () {
                          _displayTextInputDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Creat Plan',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 50, right: 50),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Expanded(
                      child: FlatButton(
                        onPressed: () {
                          prov.logout();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Log Out',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
