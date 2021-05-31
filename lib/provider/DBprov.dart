import 'package:flutter/cupertino.dart';

class DBprov extends ChangeNotifier {
  String value = " ";
  String plan_name = "";

  setvalue(String newval) {
    value = newval;
    notifyListeners();
  }

  setplaname(String newplanname) {
    plan_name = newplanname;
    notifyListeners();
  }
}
