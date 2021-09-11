import 'dart:convert';

import 'package:childtrack/screen/components.dart';
import 'package:childtrack/screen/view_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class TopBar extends StatelessWidget {
  const TopBar({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1a237e),
        automaticallyImplyLeading: false,
        title: Text(
          "ChildTrack",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: FormChild(),
    );
    ;
  }
}

class FormChild extends StatefulWidget {
  const FormChild({key}) : super(key: key);

  @override
  _FormChildState createState() => _FormChildState();
}

class _FormChildState extends State<FormChild> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController nomEnfant = TextEditingController();
  TextEditingController code = TextEditingController();

  Future registerChild() async {
    var url = Uri.parse('http://childtrack.inchtechs.com/child');
    final response = await http.post(
      url,
      body: json.encode(
        {
          "username": username.text,
          "nomEnfant": nomEnfant.text,
          "code": code.text,
        },
      ),
    );
    var message = response.body;
    if (message == 'Successfull record') {
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.green,
        fontSize: 15,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.TOP,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewChild(),
        ),
      );
      // print(message);
    } else {
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.BOTTOM,
      );
      // print(message);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Text(
                "Entrer Les Informations de l'enfant",
                style: TextStyle(
                  color: Color(0xff000063),
                  fontSize: 30.0,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: FormFields(
                inputController: username,
                inputPassword: false,
                inputText: "username",
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: FormFields(
                inputController: nomEnfant,
                inputPassword: false,
                inputText: "nom de l'enfant",
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: FormFields(
                inputController: code,
                inputPassword: false,
                inputText: "Code",
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Color(0xff1a237e),
              child: Container(
                width: 250,
                child: TextButton(
                  onPressed: () {
                    registerChild();
                    //TODO: put the future function to check the credentials
                    if (_formKey.currentState.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                      print("login pressed");
                    }
                  },
                  child: Text(
                    'Valider',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // margin: EdgeInsets.only(bottom: 40.0),
            ),
          ],
        ),
      ),
    );
  }
}
