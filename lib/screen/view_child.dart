import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:childtrack/screen/form_child.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';

import 'location.dart';

class ViewChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(data);
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
      body: View_Child(),
    );
  }
}

class View_Child extends StatefulWidget {
  @override
  _View_ChildState createState() => _View_ChildState();
}

class _View_ChildState extends State<View_Child> with TickerProviderStateMixin {
  final box = GetStorage();
  var enfants = [];
  var latitude;
  var longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    getChild();
    // });

    // //data
    // enfants = (widget.data["position"] as List)
    //     .map(
    //       (e) => e["id_module"]["nom_enfant"],
    //     )
    //     .toList();
    //
    // print(box.read("user"));
    // // position
    //
    // latitude = (widget.data["position"] as List)
    //     .map(
    //       (e) => e["latitude"],
    //     )
    //     .toList();
    // longitude = (widget.data["position"] as List)
    //     .map(
    //       (e) => e["longitude"],
    //     )
    //     .toList();
  }

  Future getChild() async {
    var url = Uri.parse('http://childtrack.inchtechs.com/children');
    final response = await http.post(
      url,
      body: json.encode(
        box.read("user"),
      ),
    );

    var res = jsonDecode(response.body);
    var message = res["message"];

    if (message == "Success") {
      setState(() {
        // get child in array
        enfants = (res["position"] as List)
            .map(
              (e) => e["id_module"]["nom_enfant"],
            )
            .toList();

        // get latitude in array
        latitude = (res["position"] as List)
            .map(
              (e) => e["latitude"],
            )
            .toList();

        // get longitude in array
        longitude = (res["position"] as List)
            .map(
              (e) => e["longitude"],
            )
            .toList();
      });

      // print(enfants);
      // print(latitude);
      // print(longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return enfants.length <= 0
        ? SpinKitCircle(
            color: Color(0xff1a237e),
            size: 50.0,
            controller: AnimationController(
                vsync: this, duration: const Duration(milliseconds: 1200)),
          )
        : Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                // padding: EdgeInsets.all(10.0),
                child: Text(
                  "Visualisation du parcours \n de l'enfant",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff12005e),
                    fontSize: 25.0,
                  ),
                ),
              ),
              SizedBox(
                height: 65.0,
              ),
              Column(
                children: [
                  for (int i = 0; i < enfants.length; i++) ...[
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(60.0, 0, 0, 0),
                          child: CircleAvatar(
                            child: Icon(
                              FontAwesomeIcons.user,
                              size: 30.0,
                              color: Colors.black,
                            ),
                            // TODO: replace color with white70
                            backgroundColor: Colors.white70,
                            radius: 30,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChildPosition(
                                    latitude: latitude[i].toDouble(),
                                    longitude: longitude[i].toDouble(),
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            enfants[i].toString(),
                            // "child",
                            style: TextStyle(
                              color: Color(0xff12005e),
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 70.0),
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
          );
  }
}
