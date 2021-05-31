import 'package:flutter/material.dart';
import './FirstScreen.dart';
import './SecondScreen.dart';

void main() => runApp(sperator());

class sperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('DietTracker'),
            backgroundColor: Colors.blueGrey,
            bottom: TabBar(
              tabs: [Tab(text: "Your Plan"), Tab(text: "Doctors plans")],
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(0.1),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black54, Colors.green]),
                ),
                child: TabBarView(
                  children: [
                    FirstScreen(),
                    SecondScreen(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
