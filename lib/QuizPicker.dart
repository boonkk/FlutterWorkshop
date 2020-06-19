import 'package:flutter/material.dart';

import 'JsonPageReader.dart';

class QuizPicker extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Pick your quiz: "),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("Flutter & Dart"),
                onPressed:null,
              ),
              RaisedButton(
                child: Text("Java or Flutter"),
                onPressed:null,
              ),
              RaisedButton(
                child: Text("Flutter true/false"),
                onPressed:null,
              ),
              Spacer(flex: 150,),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.indigoAccent,
              ),
            ],
          ),
        ),
      backgroundColor: Colors.indigo
    );
  }
}
