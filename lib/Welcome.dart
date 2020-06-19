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
        body: Container(
          //margin: EdgeInsets.only(top: 30),
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Flutter Workshop",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  FlutterLogo(
                    size: 150,
                  ),
                  Text(
                    "for Java dev",
                    style: TextStyle(fontFamily: "Courier", fontSize: 20),
                  ),
                ],
              ),
              Container(
                //margin: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.indigoAccent,
                      child: Text(
                        "Syntax differences Java&Dart",
                        style: TextStyle(
                          fontFamily: "Courier",
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LangDifferences(1)),
                        );
                      },
                    ),
                    RaisedButton(
                      color: Colors.indigoAccent,
                      child: Text(
                        "Take the quiz!",
                        style: TextStyle(
                          fontFamily: "Courier",
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuizPicker()),
                        );
                      },
                    ),
                    RaisedButton(
                      color: Colors.indigoAccent,
                      child: Text(
                        "Playground",
                        style: TextStyle(
                          fontFamily: "Courier",
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Playground()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
