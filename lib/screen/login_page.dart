import 'dart:convert';
import 'package:childtrack/screen/view_child.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:childtrack/screen/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
  }

  var _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var url = Uri.parse('http://childtrack.inchtechs.com/login');
    final response = await http.post(
      url,
      body: json.encode(
        {"username": username.text, "password": password.text},
      ),
    );
    var res = jsonDecode(response.body);
    // print(res);
    // var body = res;
    // print(body);
    var message = res["message"];
    if (message == 'Success') {
      box.write('user', {"username": username.text, "password": password.text});
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
          builder: (context) {
            return ViewChild();
          },
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

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: FormFields(
                inputController: username,
                inputText: "username",
                inputIcon: Icon(FontAwesomeIcons.user),
                inputPassword: false,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: FormFields(
                inputController: password,
                inputText: "Mot de passe",
                inputIcon: Icon(FontAwesomeIcons.lock),
                inputPassword: true,
              ),
            ),
            // TODO: submit button
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
                    login();
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
                    'Connexion',
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
            // TODO: click to go to sign up
            Card(
              margin: EdgeInsets.only(top: 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Color(0xff40c4ff),
              child: Container(
                width: 250,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    "S'inscrire",
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
