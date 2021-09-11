import 'package:childtrack/screen/components.dart';
import 'package:childtrack/screen/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  // const RegisterPage({key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();

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
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "INSCRIPTION",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff12005e),
                      fontSize: 30.0,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                child: FormFields(
                  inputController: username,
                  inputIcon: Icon(FontAwesomeIcons.user),
                  inputText: "Nom",
                  inputPassword: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                child: FormFields(
                  inputController: location,
                  inputText: "Localisation",
                  inputIcon: Icon(FontAwesomeIcons.locationArrow),
                  inputPassword: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                child: FormFields(
                  inputController: password,
                  inputIcon: Icon(FontAwesomeIcons.lock),
                  inputText: "Password",
                  inputPassword: true,
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
                      "Valider",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    //color: Colors.blue,
                    // textColor: Colors.white,
                    //)
                  ),
                ),
                // margin: EdgeInsets.only(bottom: 40.0),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 70.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Se connecter",
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
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
