import 'package:diettracker/pages/userhome.dart';
import 'package:diettracker/pages/useerlogin.dart';
import 'package:diettracker/provider/DBprov.dart';
import 'package:diettracker/provider/Database.dart';
import 'package:diettracker/provider/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DBprov(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _showScreen(context),
    );
  }

  Widget _showScreen(context) {
    var prov = Provider.of<AuthProvider>(context);
    switch (prov.authStatus) {
      case AuthStatus.authentecating:
      case AuthStatus.unAuthenticated:
        return Login();
      case AuthStatus.authenticated:
        return Home(prov.user);
    }
    return Container();
  }
}
