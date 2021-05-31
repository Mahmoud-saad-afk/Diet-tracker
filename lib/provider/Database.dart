import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'DBprov.dart';

class Database {
  final firestoreInstance = FirebaseFirestore.instance;

  void adduser(String name, String email, String password, double weight,
      String goal, String Diet_Selector) async {
    await firestoreInstance.collection("Users_Info").add({
      "Email": email,
      "Goal": goal,
      "Name": name,
      "Password": password,
      "Weight": weight,
      "plan name": Diet_Selector
    }).then((value) {
      print(value.id);
    });
  }

  void addPlan(
      String name,
      String email,
      String description,
      String b1,
      String l1,
      String d1,
      String b2,
      String l2,
      String d2,
      String b3,
      String l3,
      String d3,
      String b4,
      String l4,
      String d4,
      String b5,
      String l5,
      String d5,
      String b6,
      String l6,
      String d6,
      String b7,
      String l7,
      String d7) async {
    await firestoreInstance.collection("Doctors_Plans").add({
      "Email": email,
      "Name": name,
      "description": description,
      "b1": b1,
      "l1": l1,
      "d1": d1,
      "b2": b2,
      "l2": l2,
      "d2": d2,
      "b3": b3,
      "l3": l3,
      "d3": d3,
      "b4": b4,
      "l4": l4,
      "d4": d4,
      "b5": b5,
      "l5": l5,
      "d5": d5,
      "b6": b6,
      "l6": l6,
      "d6": d6,
      "b7": b7,
      "l7": l7,
      "d7": d7,
    }).then((value) {
      print(value.id);
    });
  }

  void addadmin(
    String name,
    String email,
    String password,
  ) async {
    await firestoreInstance.collection("Admins_Info").doc(email).set({
      "Email": email,
      "Name": name,
      "Password": password,
    });
  }

  Future<Map<String, dynamic>> getinfobyemail(String Email) async {
    await firestoreInstance
        .collection("Users_Info")
        .where("Email", isEqualTo: Email)
        .parameters;
  }
}
