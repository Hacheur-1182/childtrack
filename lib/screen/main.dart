import 'package:childtrack/screen/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(
    ChildTarck(),
  );
}

class ChildTarck extends StatelessWidget {
  // const ChildTarck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color(0XFFf5f5f5),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
