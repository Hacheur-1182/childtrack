import 'package:childtrack/screen/form_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddChild extends StatelessWidget {
  const AddChild({key}) : super(key: key);

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
      body: AddChildren(),
    );
  }
}

class AddChildren extends StatefulWidget {
  const AddChildren({key}) : super(key: key);

  @override
  _AddChildrenState createState() => _AddChildrenState();
}

class _AddChildrenState extends State<AddChildren> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50.0,
        ),
        Container(
          margin: EdgeInsets.all(55.0),
          child: Text(
            "La Securité de votre enfant est votre responsabilité",
            style: TextStyle(
                color: Color(0xff0d47a1),
                fontSize: 30.0,
                fontFamily: 'fonts/Roboto-BlackItalic.ttf'),
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xff002171),
          child: Container(
            width: 280,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopBar(),
                  ),
                );
              },
              child: Text(
                "Ajouter",
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
    );
  }
}
