import 'package:diettracker/pages/useerlogin.dart';
import 'package:diettracker/provider/Database.dart';
import 'package:diettracker/provider/Selector.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _name, _email, _password;
  FirebaseAuth instance = FirebaseAuth.instance;
  var loginKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController str_name = TextEditingController();
  TextEditingController str_email = TextEditingController();
  TextEditingController str_password = TextEditingController();
  TextEditingController str_weight = TextEditingController();
  String gender, activity_level, goal;
  @override
  void showtoast() {
    Fluttertoast.showToast(
        msg: "account created ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: loginKey,
      body: Padding(
        padding: const EdgeInsets.all(0.1),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Colors.green]),
          ),
          child: ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 1, left: 10),
                            child: RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 38,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, left: 10.0),
                            child: Container(
                              //color: Colors.green,
                              height: 200,
                              width: 200,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      'Healthy Body    Happy Life ',
                                      style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 50),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            // key: _formKey,
                            controller: str_name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: const InputDecoration(
                              //  border: InputBorder.none,
                              fillColor: Colors.white,
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      //EMAIL CLASS
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 50),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            //  key: _formKey,
                            controller: str_email,
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
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 50),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            //  key: _formKey,
                            controller: str_password,
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
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 50),
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            //  key: _formKey,
                            controller: str_weight,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              // border: InputBorder.none,
                              fillColor: Colors.lightBlueAccent,
                              labelText: 'Weight',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your weight';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 50, right: 200),
                        child: Container(
                          height: 70,
                          // width
                          child: DropdownButtonFormField<String>(
                            value: gender,
                            hint: Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onChanged: (salutation) =>
                                setState(() => gender = salutation),
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            items: ['Female', 'Male']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 50, right: 100),
                        child: Container(
                          height: 70,
                          // width
                          child: DropdownButtonFormField<String>(
                            hint: Text(
                              'Your Goal ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onChanged: (val) => setState(() => goal = val),
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            items: ['Lose weight', 'Gain weight']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 20),
                        child: Container(
                          height: 70,
                          // width
                          child: DropdownButtonFormField<String>(
                            value: activity_level,
                            hint: Text(
                              'Activity level ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onChanged: (val) =>
                                setState(() => activity_level = val),
                            validator: (value) =>
                                value == null ? 'field required' : null,
                            items: [
                              'Low activity (setting on pc)',
                              'Regular activity(doing daily works )',
                              'High activity (walking daily/byclying)',
                              'Extermly high activity(going to gym )'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, right: 50, left: 200),
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
                              borderRadius: BorderRadius.circular(30)),
                          child: FlatButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackba

                                try {
                                  UserCredential credential = await instance
                                      .createUserWithEmailAndPassword(
                                          email: str_email.text,
                                          password: str_password.text);
                                  Selector selectorobj = new Selector(
                                      gender,
                                      activity_level,
                                      goal,
                                      double.parse(str_weight.text));
                                  new Database().adduser(
                                      str_name.text,
                                      str_email.text,
                                      str_password.text,
                                      double.parse(str_weight.text),
                                      goal,
                                      selectorobj.choosePlan());

                                  showtoast();

                                  loginKey.currentState.showSnackBar(SnackBar(
                                      content: Text(
                                          "account creadted"))); //show snackBar
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
//////////////////////////// a toast is needed her ?????????????????
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    loginKey.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            "weak password"))); //show snackBar
                                  } else if (e.code == 'email-already-in-use') {
                                    loginKey.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            "email in use"))); //show snackBar
                                  }
                                  //print('exception');
                                }
                                //loginKey.currentState.showSnackBar(SnackBar(content: Text("login succses")));

                              } else {
                                loginKey.currentState.showSnackBar(
                                    SnackBar(content: Text("missing fileds")));
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
                                /*Icon(
                  Icons.arrow_forward,
                  color: Colors.black54,
                ),*/
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
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Have we met before?',
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
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  'Sign in',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
