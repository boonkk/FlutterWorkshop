import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterWorkshop/LangDifferences.dart';
import 'package:FlutterWorkshop/QuizPicker.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              children: <Widget>[
                Spacer(flex: 60),
                Container(

                  child: Text(
                    "Flutter Workshop",
                    style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
//                  padding: EdgeInsets.only(top: 40),
                ),
//                Spacer(flex: 60,),
                FlutterLogo(
                  size: 150,
                ),
                Spacer(flex: 60),
                RaisedButton(
                  child: Text("Syntax differences Java&Dart"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LangDifferences(1)),
                    );
                  },
                  color: Colors.indigoAccent,
                ),
                RaisedButton(
                    child: Text("Take the quiz!"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizPicker()),
                      );
                    },
                  color: Colors.indigoAccent,
                )
              ],
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            )
        ),
      backgroundColor: Colors.indigo,

    );
  }
}
