
import 'package:FlutterWorkshop/quiz/QuizWidget.dart';
import 'package:flutter/material.dart';

import '../flutterjavadiffer/JsonPageReader.dart';

class QuizPicker extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blueAccent],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            )),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Pick your quiz: "),
            backgroundColor: Colors.indigoAccent,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Flutter & Dart"),
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizWidget()),
                      //builder: (context) => AnimationWorkshop()),
                    );
                  },
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
        backgroundColor: Colors.transparent
      ),
    );
  }
}
