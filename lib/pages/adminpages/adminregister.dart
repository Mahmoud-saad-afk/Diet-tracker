// import 'package:diettracker/provider/Database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'adminlogin.dart';
//
// class adminregister extends StatefulWidget {
//   @override
//   _adminregisterState createState() => _adminregisterState();
// }
//
// class _adminregisterState extends State<adminregister> {
//   String _name, _email, _password;
//   FirebaseAuth instance = FirebaseAuth.instance;
//   var loginKey = GlobalKey<ScaffoldState>();
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController str_name = TextEditingController();
//   TextEditingController str_email = TextEditingController();
//   TextEditingController str_password = TextEditingController();
//   TextEditingController str_verfiction = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: loginKey,
//       appBar: AppBar(
//         title: Text('Create an admin account'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   TextFormField(
//                     controller: str_name,
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.person),
//                       hintText: 'Enter your  name',
//                       labelText: 'Name',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter some text';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: str_email,
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.email),
//                       hintText: 'Enter a email',
//                       labelText: 'email',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter valid phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: str_password,
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.security),
//                       hintText: 'Enter your password',
//                       labelText: 'password',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter valid date';
//                       }
//                       return null;
//                     },
//                   ),
//                   TextFormField(
//                     controller: str_verfiction,
//                     decoration: const InputDecoration(
//                       icon: const Icon(Icons.line_weight),
//                       hintText: 'Enter verfictioncodet',
//                       labelText: 'verfiction',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter valid code';
//                       }
//                       return null;
//                     },
//                   ),
//                   RaisedButton(
//                       child: Text('Register'),
//                       onPressed: () async {
//                         if (_formKey.currentState.validate()) {
//                           // If the form is valid, display a Snackba
//                           if (str_verfiction.text != "123456") {
//                             loginKey.currentState.showSnackBar(SnackBar(
//                                 content: Text("wrong verfiction code")));
//                           } else {
//                             try {
//                               UserCredential credential =
//                                   await instance.createUserWithEmailAndPassword(
//                                       email: str_email.text,
//                                       password: str_password.text);
//                               new Database().addadmin(str_name.text,
//                                   str_email.text, str_password.text);
//
//                               loginKey.currentState.showSnackBar(SnackBar(
//                                   content: Text(
//                                       "account creadted"))); //show snackBar
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => AdminLogin()));
// //////////////////////////// a toast is needed her ?????????????????
//                             } on FirebaseAuthException catch (e) {
//                               if (e.code == 'weak-password') {
//                                 loginKey.currentState.showSnackBar(SnackBar(
//                                     content:
//                                         Text("weak password"))); //show snackBar
//                               } else if (e.code == 'email-already-in-use') {
//                                 loginKey.currentState.showSnackBar(SnackBar(
//                                     content:
//                                         Text("email in use"))); //show snackBar
//                               }
//                             }
//                           }
//                           //loginKey.currentState.showSnackBar(SnackBar(content: Text("login succses")));
//
//                         } else {
//                           loginKey.currentState.showSnackBar(
//                               SnackBar(content: Text("missing fileds")));
//                         }
//                       }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
