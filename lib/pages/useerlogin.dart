import 'package:diettracker/pages/userhome.dart';
import 'package:diettracker/pages/userregister.dart';
import 'package:diettracker/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  var loginKey = GlobalKey<ScaffoldState>();
  @override
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: loginKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black54, Colors.green]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 10),
                    child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                    child: Container(
                      //color: Colors.green,
                      height: 200,
                      width: 200,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 60,
                          ),
                          Center(
                            child: Text(
                              'Think about why you started',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                // InputEmail(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          this._email = value;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        fillColor: Colors.lightBlueAccent,
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          this._password = value;
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid password ';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius:
                              10.0, // has the effect of softening the shadow
                          spreadRadius:
                              1.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        if (!await prov.login(_email, _password)) {
                          loginKey.currentState.showSnackBar(
                              SnackBar(content: Text(prov.errorMessage)));
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(prov.user),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.teal,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Container(
                    alignment: Alignment.topRight,
                    //color: Colors.red,
                    height: 30,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Your first time?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
