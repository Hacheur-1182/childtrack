import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  const FormFields({
    Key key,
    @required this.inputController,
    this.inputIcon,
    this.inputText,
    this.inputPassword,
  }) : super(key: key);

  final Icon inputIcon;
  final String inputText;
  final bool inputPassword;
  final inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: inputPassword,
      cursorColor: Color(0xff1a237e),
      cursorRadius: Radius.circular(75.0),
      cursorWidth: 10.0,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.black,
        fontFamily: 'Roboto',
        fontSize: 18.0,
      ),
      controller: inputController,
      decoration: InputDecoration(
        prefixIcon: inputIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: inputText,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
