// import 'package:diettracker/pages/adminpages/adminregister.dart';
// import 'package:diettracker/provider/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'adminhome.dart';
//
// class AdminLogin extends StatefulWidget {
//   @override
//   _AdminLoginState createState() => _AdminLoginState();
// }
//
// class _AdminLoginState extends State<AdminLogin> {
//   String _email, _password, _verfiction;
//   var loginKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     var prov = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       key: loginKey,
//       appBar: AppBar(
//         title: Text('admin Login'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               TextField(
//                 decoration: InputDecoration(hintText: 'Enter your email'),
//                 onChanged: (value) {
//                   setState(() {
//                     this._email = value;
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 decoration: InputDecoration(hintText: 'Enter your password'),
//                 onChanged: (value) {
//                   setState(() {
//                     this._password = value;
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 decoration: InputDecoration(hintText: 'Enter  given id '),
//                 onChanged: (value) {
//                   setState(() {
//                     this._verfiction = value;
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               RaisedButton(
//                   child: Column(
//                     children: [
//                       prov.authStatus == AuthStatus.authentecating
//                           ? CircularProgressIndicator()
//                           : Text('Login'),
//                     ],
//                   ),
//                   onPressed: () async {
//                     if (!await prov.login(_email, _password)) {
//                       loginKey.currentState.showSnackBar(
//                           SnackBar(content: Text(prov.errorMessage)));
//                     } else if (_verfiction != "654321") {
//                       loginKey.currentState
//                           .showSnackBar(SnackBar(content: Text("invalid id ")));
//                     } else {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => adminhome(prov.user),
//                         ),
//                       );
//                     }
//                   }),
//               FlatButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => adminregister(),
//                     ),
//                   );
//                 },
//                 child: Text('admin Register'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
