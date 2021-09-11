import 'package:childtrack/screen/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: AfterSplash(),
      title: Text(
        "INTRAS",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      styleTextUnderTheLoader: TextStyle(),
      loaderColor: Color(0xff1a237e),
      // useLoader: false,
      loadingText: Text(
        "surveillez vos enfants",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({key}) : super(key: key);

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
      body: LoginPage(),
    );
  }
}
