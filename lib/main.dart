import 'package:flutter/material.dart';
import 'package:FlutterWorkshop/Welcome.dart';
import 'package:FlutterWorkshop/JsonPageReader.dart';

import 'QuizPicker.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
      theme: ThemeData(
        buttonColor: Colors.indigoAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigoAccent,     //  <-- dark color
          textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color

        ),
        fontFamily: 'Helvetica',
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white, fontSize: 18),
          bodyText2: TextStyle(color: Colors.white),

        ),
      ),
    home: Main(),
  ));
}

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Welcome();
  }
}

