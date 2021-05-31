import 'package:diettracker/pages/secondscreen.dart';
import 'package:diettracker/provider/Database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Addplans extends StatefulWidget {
  @override
  _AddplansState createState() => _AddplansState();
}

class _AddplansState extends State<Addplans> {
  var loginKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController str_name = TextEditingController();
  TextEditingController str_email = TextEditingController();
  TextEditingController str_description = TextEditingController();
  TextEditingController break1 = TextEditingController();
  TextEditingController lunch1 = TextEditingController();
  TextEditingController dinner1 = TextEditingController();
  TextEditingController break2 = TextEditingController();
  TextEditingController lunch2 = TextEditingController();
  TextEditingController dinner2 = TextEditingController();
  TextEditingController break3 = TextEditingController();
  TextEditingController lunch3 = TextEditingController();
  TextEditingController dinner3 = TextEditingController();
  TextEditingController break4 = TextEditingController();
  TextEditingController lunch4 = TextEditingController();
  TextEditingController dinner4 = TextEditingController();
  TextEditingController break5 = TextEditingController();
  TextEditingController lunch5 = TextEditingController();
  TextEditingController dinner5 = TextEditingController();
  TextEditingController break6 = TextEditingController();
  TextEditingController lunch6 = TextEditingController();
  TextEditingController dinner6 = TextEditingController();
  TextEditingController break7 = TextEditingController();
  TextEditingController lunch7 = TextEditingController();
  TextEditingController dinner7 = TextEditingController();

  void showtoast() {
    Fluttertoast.showToast(
        msg: "Your plan is created",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: loginKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Create 7 Days Plan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black54, Colors.green]),
          ),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: str_name,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter your  name',
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: str_email,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email),
                        hintText: 'Enter a email',
                        labelText: 'email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an Email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: str_description,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.description),
                        hintText: 'Enter plan describtion',
                        labelText: 'describtion',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a describtion';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: break1,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.breakfast_dining),
                        hintText: 'Enter Day1 Breakfast',
                        labelText: 'Day1 Breakfast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lunch1,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Enter Day1 Lunch',
                        labelText: 'Day1 Lunch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dinner1,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.dinner_dining),
                        hintText: 'Enter Day1 Dinner',
                        labelText: 'Day1 Dinner',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: break2,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.breakfast_dining),
                        hintText: 'Enter Day2 Breakfast',
                        labelText: 'Day2 Breakfast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lunch2,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Enter Day2 Lunch',
                        labelText: 'Day2 Lunch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dinner2,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.dinner_dining),
                        hintText: 'Enter Day2 Dinner',
                        labelText: 'Day2 Dinner',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: break3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.breakfast_dining),
                        hintText: 'Enter Day3 Breakfast',
                        labelText: 'Day3 Breakfast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lunch3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Enter Day3 Lunch',
                        labelText: 'Day3 Lunch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dinner3,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.dinner_dining),
                        hintText: 'Enter Day3 Dinner',
                        labelText: 'Day3 Dinner',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: break4,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.breakfast_dining),
                        hintText: 'Enter Day4 Breakfast',
                        labelText: 'Day4 Breakfast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lunch4,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Enter Day4 Lunch',
                        labelText: 'Day4 Lunch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dinner4,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.dinner_dining),
                        hintText: 'Enter Day4 Dinner',
                        labelText: 'Day4 Dinner',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: break5,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.breakfast_dining),
                        hintText: 'Enter Day5 Breakfast',
                        labelText: 'Day5 Breakfast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lunch5,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Enter Day5 Lunch',
                        labelText: 'Day5 Lunch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dinner5,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.dinner_dining),
                        hintText: 'Enter Day5 Dinner',
                        labelText: 'Day5 Dinner',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: break6,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.breakfast_dining),
                        hintText: 'Enter Day6 Breakfast',
                        labelText: 'Day6 Breakfast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lunch6,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Enter Day6 Lunch',
                        labelText: 'Day6 Lunch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dinner6,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.dinner_dining),
                        hintText: 'Enter Day6 Dinner',
                        labelText: 'Day6 Dinner',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: break7,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.breakfast_dining),
                        hintText: 'Enter Day7 Breakfast',
                        labelText: 'Day7 Breakfast',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: lunch7,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.lunch_dining),
                        hintText: 'Enter Day7 Lunch',
                        labelText: 'Day7 Lunch',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: dinner7,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.dinner_dining),
                        hintText: 'Enter Day7 Dinner',
                        labelText: 'Day7 Dinner',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required ';
                        }
                        return null;
                      },
                    ),
                    Center(
                      child: IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Database().addPlan(
                                  str_name.text,
                                  str_email.text,
                                  str_description.text,
                                  break1.text,
                                  lunch1.text,
                                  dinner1.text,
                                  break2.text,
                                  lunch2.text,
                                  dinner2.text,
                                  break3.text,
                                  lunch3.text,
                                  dinner3.text,
                                  break4.text,
                                  lunch4.text,
                                  dinner4.text,
                                  break5.text,
                                  lunch5.text,
                                  dinner5.text,
                                  break6.text,
                                  lunch6.text,
                                  dinner6.text,
                                  break7.text,
                                  lunch7.text,
                                  dinner7.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SecondScreen()));
                            } else {
                              loginKey.currentState.showSnackBar(
                                  SnackBar(content: Text("missing fileds")));
                            }
                            showtoast();
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
