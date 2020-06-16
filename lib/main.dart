import 'package:flutter/material.dart';
import 'package:FlutterWorkshop/Welcome.dart';
import 'package:FlutterWorkshop/JsonPageReader.dart';

import 'QuizPicker.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Main(),
  ));
}

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Welcome(),
    );
  }
}

