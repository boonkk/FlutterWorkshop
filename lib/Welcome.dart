import 'package:FlutterWorkshop/playground/Playground.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterWorkshop/LangDifferences.dart';
import 'package:FlutterWorkshop/QuizPicker.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Spacer(flex: 60),
          Container(
            child: Text(
              "Flutter Workshop",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
//                  padding: EdgeInsets.only(top: 40),
          ),
//                Spacer(flex: 60,),
          FlutterLogo(
            size: 150,
          ),
          Spacer(flex: 5),
          Text("For Java dev",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),),
          Spacer(flex:30),
          RaisedButton(
            color: Colors.indigoAccent,
            child: Text("Syntax differences Java&Dart", style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LangDifferences(1)),
              );
            },
          ),
          RaisedButton(
            color: Colors.indigoAccent,
            child: Text("Take the quiz!", style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPicker()),
              );
            },
          ),
          RaisedButton(
            color: Colors.indigoAccent,
            child: Text("Playground", style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Playground()),
              );
            },
          ),
          Spacer(flex: 20)
        ],
      )),
    );
  }
}
